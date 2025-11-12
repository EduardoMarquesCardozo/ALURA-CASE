package br.com.alura.projeto.registration;

import br.com.alura.projeto.course.CourseRepository;
import br.com.alura.projeto.user.Role;
import br.com.alura.projeto.user.UserRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class RegistrationController {

    @Autowired
    private RegistrationService registrationService;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/admin/registrations")
    public String list(Model model) {
        model.addAttribute("registrations", registrationService.findAll());
        return "admin/registration/list";
    }

    @GetMapping("admin/registration/new")
    public String form(Model model) {
        model.addAttribute("courses", courseRepository.findAll());
        model.addAttribute("students", userRepository.findAllByRole(Role.STUDENT));
        model.addAttribute("newRegistration", new NewRegistrationDTO());
        return "admin/registration/newForm";
    }

    @PostMapping("admin/registration/new")
    public String createCourse(@Valid @ModelAttribute("newRegistration") NewRegistrationDTO newRegistration, Model model) {
        try {
            registrationService.createRegistration(newRegistration);
            return "redirect:/admin/registrations";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("courses", courseRepository.findAll());
            model.addAttribute("students", userRepository.findAllByRole(Role.STUDENT));
            return "redirect:/admin/registration/newForm";
        }
    }

    @GetMapping("/admin/reports")
    public String report(Model model) {
        model.addAttribute("report", registrationService.getCourseAccessReport());
        return "admin/registration/report";
    }

}
