package com.project.possystem.service;

import com.project.possystem.dto.TransactionDTO;

import java.util.HashMap;
import java.util.List;

public interface TransactionService {
    List<TransactionDTO> getAll(HashMap<String, String> params);

    TransactionDTO save(TransactionDTO transactionDTO);

    String delete(Integer id);
}
