package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.user.User;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Length;

public class CourseDTO {

    @NotBlank
    private String name;

    @NotBlank
    @Length(min = 4, max = 10)
    @Pattern(
            regexp = "^[a-z]+(-[a-z]+)*$",
            message = "Code must contain only lowercase letters and hyphens"
    )
    private String code;

    private String description;

    private String instructorEmail;
    private String status;
    private String categoryName;

    @NotNull
    private Long categoryId;

    public CourseDTO(Course course, Category category, User instructor) {
        this.name = course.getName();
        this.code = course.getCode();
        this.description = course.getDescription();
        this.categoryId = course.getCategoryId();
        this.status = course.getStatus();
        this.categoryName = (category != null ? category.getName() : null);
        this.instructorEmail = (instructor != null ? instructor.getEmail() : null);
    }

    public CourseDTO() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInstructorEmail() {
        return instructorEmail;
    }

    public void setInstructorEmail(String instructorEmail) { this.instructorEmail = instructorEmail; }

    public Long getCategoryId() { return categoryId; }

    public void setCategoryId(Long categoryId) { this.categoryId = categoryId; }

    public String getCategoryName() { return categoryName; }

    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }

}


