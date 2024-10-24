package com.project.possystem.controller;

import com.project.possystem.dto.ItemDTO;
import com.project.possystem.dto.StandardResponse;
import com.project.possystem.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
@CrossOrigin
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/items")
public class ItemController {

    private final ItemService itemService;

    @GetMapping
    public List<ItemDTO> getAll(@RequestParam HashMap<String,String> params) {
        return itemService.getAll(params);
    }

    @PostMapping
    public ItemDTO create(@RequestBody ItemDTO itemDTO) {
        return itemService.save(itemDTO);
    }

    @PutMapping
    public ItemDTO update(@RequestBody ItemDTO itemDTO) {
        return itemService.update(itemDTO);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<StandardResponse> delete(@PathVariable Integer id) {
        String message = itemService.delete(id);

        return new ResponseEntity<StandardResponse>(
                new StandardResponse(200,"Deleted Successfully",message), HttpStatus.OK
        );
    }
}
