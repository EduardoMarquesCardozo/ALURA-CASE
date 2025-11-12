package br.com.alura.projeto.user;

import br.com.alura.projeto.util.EncryptUtil;
import org.springframework.stereotype.Service;

@Service
public class LoginUserService {

    private final UserRepository userRepository;

    public LoginUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public User loginUser(String email, String password) {
        User user = userRepository.findByEmail(email);
        if (user == null) {
            return null;
        }

        String encryptedPassword = EncryptUtil.toMD5(password);
        if (!user.getPassword().equals(encryptedPassword)) {
            return null;
        }

        return user;
    }

}
