package com.project.possystem.service.IMPL;

import com.project.possystem.dto.StockDTO;
import com.project.possystem.entity.Stock;
import com.project.possystem.exception.ResourceAlreadyExistException;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.StockRepository;
import com.project.possystem.service.StockService;
import com.project.possystem.util.Mapper.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
public class StockServiceIMPL implements StockService {

    private final StockRepository stockRepository;
    private final ObjectMapper objectMapper;

    @Override
    public List<StockDTO> getAll(HashMap<String, String> params) {
        List<Stock> stocks = stockRepository.findAll();
        if(!stocks.isEmpty()){
            List<StockDTO> stockDTOS = objectMapper.stockListToDtoList(stocks);
            if(params.isEmpty()){
                return stockDTOS;
            }else{
                String itemid = params.get("itemid");

                Stream<StockDTO> stream = stockDTOS.stream();

                if(itemid != null) stream = stream.filter(a-> a.getItem().getId() == Integer.parseInt(itemid));

                return stream.collect(Collectors.toList());
            }
        }else{
            throw new ResourceNotFoundException("Stocks Not Available");
        }
    }

    @Override
    public StockDTO save(StockDTO stockDTO) {

        if(stockRepository.existsByItem(stockDTO.getItem())){
            throw new ResourceAlreadyExistException("Item Already Exists in Stock");
        }

        Stock stock = objectMapper.stockDtoToStock(stockDTO);
        stockRepository.save(stock);
        return stockDTO;
    }

    @Override
    public StockDTO update(StockDTO stockDTO) {

        Stock stockrec = stockRepository.findById(stockDTO.getId()).orElseThrow(()-> new ResourceNotFoundException("Stock Not Found"));

        if(!Objects.equals(stockrec.getItem().getId(), stockDTO.getItem().getId()) && stockRepository.existsByItem(stockDTO.getItem())){
            throw new ResourceAlreadyExistException("Item Already Exists in Stock");
        }

        Stock stock = objectMapper.stockDtoToStock(stockDTO);
        stockRepository.save(stock);
        return stockDTO;
    }

    @Override
    public String delete(Integer id) {
        Stock stock = stockRepository.findById(id).orElseThrow(()-> new ResourceNotFoundException("Stock Not Found"));
        stockRepository.delete(stock);
        return "Stock Deleted Successfully";
    }
}
