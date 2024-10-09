package com.project.possystem.util.Mapper;

import com.project.possystem.dto.ItemDTO;
import com.project.possystem.dto.RoleDTO;
import com.project.possystem.dto.UserDTO;
import com.project.possystem.dto.UserStatusDTO;
import com.project.possystem.entity.Item;
import com.project.possystem.entity.Role;
import com.project.possystem.entity.User;
import com.project.possystem.entity.Userstatus;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ObjectMapper {

    List<UserDTO> userListToDtoList(List<User> users);

    User userDtoToUser(UserDTO userDTO);

    List<RoleDTO> roleListToDtoList(List<Role> roles);

    List<UserStatusDTO> userStatusListToDtoList(List<Userstatus> userStatusList);

    List<ItemDTO> itemListToDtoList(List<Item> items);

    Item itemDtoToItem(ItemDTO itemDTO);
}
