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
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
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

    @GetMapping({"/admin/course/new", "/admin/course/{code}/edit"})
    public String openForm(@PathVariable(required = false) String code, Model model) {
        CourseDTO dto;
        boolean isEdit = (code != null);

        if (isEdit) {
            Course course = courseRepository.findByCode(code)
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Course not found"));
            var category = categoryRepository.findById(course.getCategoryId()).orElse(null);
            var instructor = userRepository.findById(course.getInstructorId()).orElse(null);
            dto = new CourseDTO(course, category, instructor);
        } else {
            dto = new CourseDTO();
        }

        model.addAttribute("courseForm", dto);
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("instructors", userRepository.findAll());
        model.addAttribute("isEdit", isEdit);
        return "admin/course/newForm";
    }

    @PostMapping("/admin/course/new")
    public String save(@Valid @ModelAttribute("courseForm") CourseDTO course, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/course/newForm";
        }

        service.registerCourse(course);
        return "redirect:/admin/courses";
    }

    @PostMapping("/admin/course/{code}/edit")
    public String update(@PathVariable String code,
                         @Valid @ModelAttribute("courseForm") CourseDTO dto,
                         BindingResult result) {
        if (result.hasErrors()) {
            return "admin/course/newForm";
        }

        service.updateCourse(code, dto);
        return "redirect:/admin/courses";
    }

    @GetMapping("/admin/course/{code}/status")
    public String showStatusPage(@PathVariable("code") String code, Model model) {
        Course course = courseRepository.findByCode(code)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Course not found"));
        model.addAttribute("course", course);
        return "admin/course/deactivate";
    }

    @PostMapping("/admin/course/{code}/inactive")
    public String toggleStatus(@PathVariable("code") String code) {
        service.toggleStatus(code);
        return "redirect:/admin/courses";
    }


}
