package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;
import br.com.alura.projeto.user.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;

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
        course.setInstructorId(
            userRepository.findByEmail(dto.getInstructorEmail()).getId()
        );
        course.setCategoryId(dto.getCategoryId());
        course.setDescription(dto.getDescription());

        return repo.save(course);
    }
}
