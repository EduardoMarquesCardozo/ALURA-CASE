package br.com.alura.projeto.registration;

import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface RegistrationRepository extends JpaRepository<Registration, Long> {

    Optional<Registration> findByUserAndCourse(User user, Course course);

    List<Registration> findAllByUser(User user);

    List<Registration> findAllByCourse(Course course);

    @Query("""
        SELECT new br.com.alura.projeto.registration.RegistrationReportItem(
            c.name,
            c.code,
            u.name,
            u.email,
            COUNT(r.id)
        )
        FROM Registration r
        JOIN r.course c
        JOIN User u ON u.id = c.instructorId
        GROUP BY c.id, c.name, c.code, u.name, u.email
        ORDER BY COUNT(r.id) DESC
    """)
    List<RegistrationReportItem> generateCourseAccessReport();
}
