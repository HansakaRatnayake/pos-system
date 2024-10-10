package com.project.possystem.util.Mapper;

import com.project.possystem.dto.*;
import com.project.possystem.entity.*;
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

    List<CategoryDTO> categoryListToDtoList(List<Category> categories);

    Category categoryDtoToCategory(CategoryDTO categoryDTO);

    List<StockDTO> stockListToDtoList(List<Stock> stocks);

    Stock stockDtoToStock(StockDTO stockDTO);
}
