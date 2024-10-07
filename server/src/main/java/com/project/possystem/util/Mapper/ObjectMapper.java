package com.project.possystem.util.Mapper;

import com.project.possystem.dto.UserDTO;
import com.project.possystem.entity.User;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ObjectMapper {

    List<UserDTO> userListToDtoList(List<User> users);

    User userDtoToUser(UserDTO userDTO);
}
