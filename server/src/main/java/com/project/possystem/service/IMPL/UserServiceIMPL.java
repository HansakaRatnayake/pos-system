package com.project.possystem.service.IMPL;

import com.project.possystem.dto.UserDTO;
import com.project.possystem.entity.Role;
import com.project.possystem.entity.User;
import com.project.possystem.entity.Userstatus;
import com.project.possystem.exception.ResourceAlreadyExistException;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.RoleRepository;
import com.project.possystem.repository.UserRepository;
import com.project.possystem.repository.UserStatusRepository;
import com.project.possystem.service.UserService;
import com.project.possystem.util.Mapper.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class UserServiceIMPL implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final UserStatusRepository userStatusRepository;
    private final ObjectMapper objectMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public List<UserDTO> getAll(HashMap<String, String> params) {
        List<User> users = userRepository.findAll();
        if (!users.isEmpty()) {
            List<UserDTO> dtos = objectMapper.userListToDtoList(users);
            if (params.isEmpty()) {
                return dtos;
            } else {
                return dtos;
            }
        } else {
            throw new ResourceNotFoundException("Users Not Found!");
        }
    }

    @Override
    public UserDTO save(UserDTO userDTO) {
        if (userRepository.existsByUsername(userDTO.getUsername())) {
            throw new ResourceAlreadyExistException("Username Already Exist!");
        }

        List<Userstatus> all = userStatusRepository.findAll();
        Userstatus userstatus = all.stream().findFirst()
                .filter(c -> c.getName().equalsIgnoreCase("active")).orElseThrow(() -> new ResourceNotFoundException("Active status not found"));

        userDTO.setUserstatus(userstatus);

        User user = objectMapper.userDtoToUser(userDTO);
        user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        userRepository.save(user);
        return userDTO;

    }

    @Override
    public UserDTO update(UserDTO userDTO) {

        User userrec = userRepository.findById(userDTO.getId()).orElseThrow(() -> new ResourceNotFoundException("User Not Found!"));

        if (!userrec.getUsername().equals(userDTO.getUsername()) && userRepository.existsByUsername(userDTO.getUsername())) {
            throw new ResourceAlreadyExistException("Username Already Exist!");
        }

        User user = objectMapper.userDtoToUser(userDTO);
        if (!userrec.getPassword().equals(userDTO.getPassword())) {
            user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        }
        userRepository.save(user);
        return userDTO;
    }

    @Override
    public String delete(Integer id) {
        User user = userRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("User Not Found!"));
        userRepository.delete(user);
        return "User Successfully Deleted!";
    }

    @Override
    public void initializeAdmin() {

        if (userRepository.findByUsername("admin123@gmail.com").isEmpty()) {
            Role role = roleRepository.findByName("Admin").orElseThrow(() -> new ResourceNotFoundException("Admin role not found"));

//            if (selectedRoleName.isEmpty())
//                throw new ResourceNotFoundException("Admin role not found");


            userRepository.save(
                    User.builder()
                            .email("admin123@gmail.com")
                            .password(passwordEncoder.encode("admin123"))
                            .username("admin123@gmail.com")
                            .mobile("0111111111")
                            .role(role)
                            .userstatus(userStatusRepository.findByName("Active").orElseThrow(() -> new ResourceNotFoundException("Active status not found")))
                            .build()
            );
        }

    }
}
