package br.com.alura.projeto.category;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.course.Course;

import java.util.List;

public class CategoryCoursesDTO {
    private Category category;
    private List<Course> courses;

    public CategoryCoursesDTO(Category category, List<Course> courses) {
        this.category = category;
        this.courses = courses;
    }

    public Category getCategory() {
        return category;
    }

    public List<Course> getCourses() {
        return courses;
    }
}