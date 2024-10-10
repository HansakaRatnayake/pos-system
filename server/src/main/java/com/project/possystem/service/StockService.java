package com.project.possystem.service;

import com.project.possystem.dto.StockDTO;

import java.util.HashMap;
import java.util.List;

public interface StockService {
    List<StockDTO> getAll(HashMap<String, String> params);

    StockDTO save(StockDTO stockDTO);

    StockDTO update(StockDTO stockDTO);

    String delete(Integer id);
}
