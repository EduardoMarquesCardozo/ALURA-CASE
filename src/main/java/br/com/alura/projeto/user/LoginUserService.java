package br.com.alura.projeto.user;

import org.springframework.http.HttpStatus;
import br.com.alura.projeto.util.EncryptUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class LoginUserService {

    private final UserRepository userRepository;

    public LoginUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public User loginUser(String email, String password) {
        User user = userRepository.findByEmail(email);
        if (user == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Email not found.");
        }

        String encryptedPassword = EncryptUtil.toMD5(password);
        if (!user.getPassword().equals(encryptedPassword)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid password.");
        }

        return user;
    }

}
