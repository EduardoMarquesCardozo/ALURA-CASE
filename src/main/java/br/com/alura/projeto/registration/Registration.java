package br.com.alura.projeto.registration;

import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.user.User;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name = "registration", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"studentId", "courseId"})
})
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "studentId")
    private User user;

    @ManyToOne(optional = false)
    @JoinColumn(name = "courseId")
    private Course course;

    @Column(name = "registration_date", nullable = false)
    private LocalDateTime registrationDate = LocalDateTime.now();

    @Transient
    private String formattedDate;

    public Registration() {}

    public Registration(User user, Course course) {
        this.user = user;
        this.course = course;
    }

    public Long getId() { return id; }

    public User getUser() { return user; }

    public Course getCourse() { return course; }

    public LocalDateTime getRegistrationDate() { return registrationDate; }

    public String getFormattedDate() {
        if (registrationDate != null) {
            return registrationDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        }
        return null;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }
}
