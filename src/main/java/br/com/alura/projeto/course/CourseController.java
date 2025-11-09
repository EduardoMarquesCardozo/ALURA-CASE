package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryDTO;
import br.com.alura.projeto.category.CategoryRepository;
import br.com.alura.projeto.category.NewCategoryForm;
import br.com.alura.projeto.user.User;
import br.com.alura.projeto.user.UserRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
public class CourseController {
    private final CourseService service;
    private final CourseRepository courseRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;

    public CourseController(CourseService service, CourseRepository courseRepository, CategoryRepository categoryRepository, UserRepository userRepository) { this.service = service;
        this.courseRepository = courseRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/admin/courses")
    public String list(Model model) {
        System.out.println(courseRepository.findAll());
        List<CourseDTO> list = courseRepository.findAll()
                .stream()
                .map(course -> {
                    Category category = categoryRepository.findById(course.getCategoryId())
                            .orElse(null);

                    User instructor = userRepository.findById(course.getInstructorId())
                            .orElse(null);

                    return new CourseDTO(course, category, instructor);
                })
                .toList();
        model.addAttribute("courses", list);

        return "admin/course/list";
    }

    @GetMapping("/admin/course/new")
    public String create(Model model) {
        model.addAttribute("newCourseForm", new CourseDTO());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("instructors", userRepository.findAll());
        return "admin/course/newForm";
    }



    @PostMapping("/admin/course/new")
    public ResponseEntity<Map<String, Object>> save(@Valid @RequestBody CourseDTO course) {
        Course created = service.registerCourse(course);

        Map<String, Object> response = Map.of("id", created.getId());
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
    @GetMapping("/admin/course/{code}/status")
    public String showDeactivatePage(@PathVariable("code") String courseCode, Model model) {
        Course course = courseRepository.findByCode(courseCode)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Course not found"));
        model.addAttribute("course", course);
        return "admin/course/deactivate";
    }

    @PostMapping("/admin/course/{code}/inactive")
    public String toggleCourseStatus(@PathVariable("code") String courseCode) {
        Course course = courseRepository.findByCode(courseCode)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Course not found"));

        if (Objects.equals(course.getStatus(), "ACTIVE")) {
            course.setStatus("INACTIVE");
        } else {
            course.setStatus("ACTIVE");
        }

        courseRepository.save(course);

        return "redirect:/admin/courses";
    }

}
