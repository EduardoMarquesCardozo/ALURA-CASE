package br.com.alura.projeto.login;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;
import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.course.CourseRepository;
import br.com.alura.projeto.course.CourseService;
import br.com.alura.projeto.user.LoginUserService;
import br.com.alura.projeto.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private LoginUserService userService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("categoryCourses", courseService.findAllCoursesGroupedByCategory());
        return "login";
    }

    @PostMapping("/login")
    public ModelAndView login(@RequestParam String email, @RequestParam String password, Model model) {
        User user = userService.loginUser(email, password);
        if (user == null) {
            ModelAndView mv = new ModelAndView("redirect:/");
            mv.addObject("categoryCourses", courseService.findAllCoursesGroupedByCategory());
            return mv;
        }

        ModelAndView mv = new ModelAndView("redirect:/dashboard");
        mv.addObject("user", user);
        return mv;
    }
}
