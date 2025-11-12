package br.com.alura.projeto.user;


import br.com.alura.projeto.course.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    boolean existsByEmail(String email);
    User findByEmail(String email);

    List<User> findAllByRole(Role role);

}
