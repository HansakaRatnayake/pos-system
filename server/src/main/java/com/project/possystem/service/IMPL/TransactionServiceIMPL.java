package com.project.possystem.service.IMPL;

import com.project.possystem.dto.TransactionDTO;
import com.project.possystem.entity.Transaction;
import com.project.possystem.entity.Transactionitem;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.TransactionRepository;
import com.project.possystem.service.TransactionService;
import com.project.possystem.util.Mapper.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TransactionServiceIMPL implements TransactionService {

    private final TransactionRepository transactionRepository;
    private final ObjectMapper objectMapper;

    @Override
    public List<TransactionDTO> getAll(HashMap<String, String> params) {
        List<Transaction> transactions = transactionRepository.findAll();
        if(!transactions.isEmpty()){
            List<TransactionDTO> dtos = objectMapper.transactionListToDtoList(transactions);
            if(params.isEmpty()){
                return dtos;
            }else{
                return dtos;
            }
        }else{
            throw new ResourceNotFoundException("Transactions Not Found!");
        }
    }

    @Override
    public TransactionDTO save(TransactionDTO transactionDTO) {

        Transaction transaction = objectMapper.transactionDtoToTransaction(transactionDTO);

        for (Transactionitem i : transaction.getTransactionitems()) {
            i.setTransaction(transaction);
        }

        transactionRepository.save(transaction);
        return transactionDTO;
    }


    @Override
    public String delete(Integer id) {

        Transaction tr = transactionRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Transaction not found!"));
        transactionRepository.delete(tr);
        return "Transaction Deleted Successfully";
    }
}
