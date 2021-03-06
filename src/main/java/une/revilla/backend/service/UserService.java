package une.revilla.backend.service;

import une.revilla.backend.entity.Task;
import une.revilla.backend.entity.User;
import une.revilla.backend.payload.request.RegisterRequest;
import une.revilla.backend.payload.response.MessageResponse;

import java.util.List;

public interface UserService {

    List<User> findAllUsers();

    User findUserById(Long id);

    User findByUsername(String username);

    User saveUser(RegisterRequest registerRequest);

    MessageResponse updateUser(Long id, Long idRole, User userData);

    User deleteUserById(Long id);

    User addTaskUser(Long id, Task task);

    Boolean existsByEmail(String email);

    User updateTaskUser(Long userId, Task taskToUpdate);
}
