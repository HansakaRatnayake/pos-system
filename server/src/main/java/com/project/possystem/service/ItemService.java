package com.project.possystem.service;

import com.project.possystem.dto.ItemDTO;

import java.util.HashMap;
import java.util.List;

public interface ItemService {
    List<ItemDTO> getAll(HashMap<String, String> params);

    ItemDTO save(ItemDTO itemDTO);

    ItemDTO update(ItemDTO itemDTO);

    String delete(Integer id);
}
