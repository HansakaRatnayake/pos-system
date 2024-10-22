package com.project.possystem.service.IMPL;

import com.project.possystem.dto.UserDTO;
import com.project.possystem.entity.User;
import com.project.possystem.exception.ResourceAlreadyExistException;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.UserRepository;
import com.project.possystem.service.UserService;
import com.project.possystem.util.Mapper.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceIMPL implements UserService {

    private final UserRepository userRepository;
    private final ObjectMapper objectMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public List<UserDTO> getAll(HashMap<String, String> params) {
        List<User> users = userRepository.findAll();
        if(!users.isEmpty()){
            List<UserDTO> dtos = objectMapper.userListToDtoList(users);
            if(params.isEmpty()){
                return dtos;
            }else{
                return dtos;
            }
        }else{
            throw new ResourceNotFoundException("Users Not Found!");
        }
    }

    @Override
    public UserDTO save(UserDTO userDTO) {
        if(userRepository.existsByUsername(userDTO.getUsername())){
            throw new ResourceAlreadyExistException("Username Already Exist!");
        }

        User user = objectMapper.userDtoToUser(userDTO);
        user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        userRepository.save(user);
        return userDTO;

    }

    @Override
    public UserDTO update(UserDTO userDTO) {

        User userrec = userRepository.findById(userDTO.getId()).orElseThrow(() -> new ResourceNotFoundException("User Not Found!"));

        if(!userrec.getUsername().equals(userDTO.getUsername()) && userRepository.existsByUsername(userDTO.getUsername())){
            throw new ResourceAlreadyExistException("Username Already Exist!");
        }

        User user = objectMapper.userDtoToUser(userDTO);
        if(!userrec.getPassword().equals(userDTO.getPassword())){
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
}
