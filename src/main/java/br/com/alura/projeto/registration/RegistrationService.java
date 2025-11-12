package br.com.alura.projeto.registration;

import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.course.CourseRepository;
import br.com.alura.projeto.user.User;
import br.com.alura.projeto.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;

import java.util.List;

@Service
public class RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    public Registration createRegistration(NewRegistrationDTO dto) {
        User user = userRepository.findByEmail(dto.getStudentEmail());
        if (user == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found");
        }

        Course course = courseRepository.findByCode(dto.getCourseCode())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Course not found"));

        if (course.getStatus().equals("INACTIVE")) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot enroll in an inactive course");
        }

        registrationRepository.findByUserAndCourse(user, course).ifPresent(r -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User already enrolled in this course");
        });

        return registrationRepository.save(new Registration(user, course));
    }

    public List<Registration> findAll() {
        return registrationRepository.findAll();
    }
    public List<RegistrationReportItem> getCourseAccessReport() {
        return registrationRepository.generateCourseAccessReport();
    }
}
