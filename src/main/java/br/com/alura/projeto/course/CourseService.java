package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryCoursesDTO;
import br.com.alura.projeto.category.CategoryRepository;
import br.com.alura.projeto.user.User;
import br.com.alura.projeto.user.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.*;

@Service
public class CourseService {
    private final CourseRepository repo;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;

    public CourseService(CourseRepository repo, CategoryRepository categoryRepository, UserRepository userRepository) {
        this.repo = repo;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
    }

    @Transactional
    public Course registerCourse(CourseDTO dto) {
        if (repo.existsByCode(dto.getCode())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT,"Code already exists.");
        }
        Optional<Category> categoryOpt = categoryRepository.findById(dto.getCategoryId());
        if (categoryOpt.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.CONFLICT,"No category exists with this ID.");
        }

        if (!userRepository.existsByEmail(dto.getInstructorEmail())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT,"No instructor exists with this email.");
        }

        Course course = new Course();
        course.setName(dto.getName());
        course.setCode(dto.getCode());
        course.setStatus("ACTIVE");
        course.setInstructorId(
            userRepository.findByEmail(dto.getInstructorEmail()).getId()
        );
        course.setCategoryId(dto.getCategoryId());
        course.setDescription(dto.getDescription());

        return repo.save(course);
    }

    @Transactional
    public Course updateCourse(String code, CourseDTO dto) {
        Course course = repo.findByCode(code)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "No course exists with this ID."));

        Category category = categoryRepository.findById(dto.getCategoryId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.CONFLICT, "No category exists with this ID."));

        User instructor = userRepository.findByEmail(dto.getInstructorEmail());
        if (instructor == null) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "No instructor exists with this email.");
        }

        course.setName(dto.getName());
        course.setDescription(dto.getDescription());
        course.setCategoryId(category.getId());
        course.setInstructorId(instructor.getId());

        return repo.save(course);
    }

    @Transactional
    public Course toggleStatus(String code) {
        Course course = repo.findByCode(code)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "No course exists with this ID."));

        if ("ACTIVE".equals(course.getStatus())) {
            course.setStatus("INACTIVE");
        } else {
            course.setStatus("ACTIVE");
        }

        return repo.save(course);
    }

    public List<CategoryCoursesDTO> findAllCoursesGroupedByCategory() {
        List<Category> categories = categoryRepository.findAll();
        List<CategoryCoursesDTO> result = new ArrayList<>();

        for (Category category : categories) {
            List<Course> courses = repo.findByCategoryId(category.getId());
            result.add(new CategoryCoursesDTO(category, courses));
        }

        return result;
    }
}
