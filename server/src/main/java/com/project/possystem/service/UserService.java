package com.project.possystem.service;

import com.project.possystem.dto.UserDTO;

import java.util.HashMap;
import java.util.List;

public interface UserService {
    List<UserDTO> getAll(HashMap<String, String> params);

    UserDTO save(UserDTO userDTO);

    UserDTO update(UserDTO userDTO);

    String delete(Integer id);
}
