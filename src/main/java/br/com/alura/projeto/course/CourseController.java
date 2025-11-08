package br.com.alura.projeto.course;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

@Controller
public class CourseController {
    private final CourseService service;
    public CourseController(CourseService service) { this.service = service; }

    @GetMapping("/admin/courses")
    public String list(@Valid CourseDTO form) {
        // TODO: Implementar a Questão 1 - Listagem de Cursos aqui...

        return "";
    }

    @GetMapping("/admin/course/new")
    public String create(CourseDTO form) {
        // TODO: Implementar a Questão 1 - Cadastro de Cursos aqui...

        return "";
    }

    @PostMapping("/admin/course/new")
    public ResponseEntity<Map<String, Object>> save(@Valid @RequestBody CourseDTO course) {
        Course created = service.registerCourse(course);

        Map<String, Object> response = Map.of("id", created.getId());
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PostMapping("/course/{code}/inactive")
    public ResponseEntity<?> updateStatus(@PathVariable("code") String courseCode) {
        // TODO: Implementar a Questão 2 - Inativação de Curso aqui...

        return ResponseEntity.ok().build();
    }

}
