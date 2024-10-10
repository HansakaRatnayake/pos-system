package com.project.possystem.controller;

import com.project.possystem.dto.StandardResponse;
import com.project.possystem.dto.StockDTO;
import com.project.possystem.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/v1/stocks")
@RequiredArgsConstructor
public class StockController {

    private final StockService stockService;

    @GetMapping
    public List<StockDTO> getAll(@RequestParam HashMap<String, String> params) {
        return stockService.getAll(params);
    }

    @PostMapping
    public StockDTO create(@RequestBody StockDTO stockDTO) {
        return stockService.save(stockDTO);
    }

    @PutMapping
    public StockDTO update(@RequestBody StockDTO stockDTO) {
        return stockService.update(stockDTO);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<StandardResponse> delete(@PathVariable Integer id) {
        String message = stockService.delete(id);

        return new ResponseEntity<StandardResponse>(
                new StandardResponse(200,"Deleted",message), HttpStatus.OK
        );
    }
}
