package com.project.possystem.service.IMPL;

import com.project.possystem.dto.ItemDTO;
import com.project.possystem.entity.Item;
import com.project.possystem.exception.ResourceAlreadyExistException;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.ItemRepository;
import com.project.possystem.service.ItemService;
import com.project.possystem.util.Mapper.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
public class ItemServiceIMPL implements ItemService {

    private final ItemRepository itemRepository;
    private final ObjectMapper objectMapper;

    @Override
    public List<ItemDTO> getAll(HashMap<String, String> params) {
        List<Item> items = itemRepository.findAll();
        if(!items.isEmpty()){
            List<ItemDTO> dtos = objectMapper.itemListToDtoList(items);

            if(params.isEmpty()){
                return dtos;
            }else{

                String code = params.get("code");
                String name = params.get("name");
                String categoryid = params.get("categoryid");

                Stream<ItemDTO> stream = dtos.stream();

                if(code != null) stream = stream.filter(e -> e.getCode().equals(code));
                if(name != null) stream = stream.filter(e -> e.getName().contains(name));
                if(categoryid != null) stream = stream.filter(e-> e.getCategory().getId() == Integer.parseInt(categoryid));

                return stream.collect(Collectors.toList());
            }
        }else{
            throw new ResourceNotFoundException("Items Not Found!");
        }
    }

    @Override
    public ItemDTO save(ItemDTO itemDTO) {

        if(itemRepository.existsByCode(itemDTO.getCode())){
            throw new ResourceAlreadyExistException("Code Already Exist!");
        }

        Item item = objectMapper.itemDtoToItem(itemDTO);
        itemRepository.save(item);
        return itemDTO;
    }

    @Override
    public ItemDTO update(ItemDTO itemDTO) {

        Item itemrec = itemRepository.findById(itemDTO.getId()).orElseThrow(() -> new ResourceNotFoundException("Item Not Found"));

        if(!itemDTO.getCode().equals(itemrec.getCode()) && itemRepository.existsByCode(itemDTO.getCode())){
            throw new ResourceAlreadyExistException("Code Already Exist!");
        }

        Item item = objectMapper.itemDtoToItem(itemDTO);
        itemRepository.save(item);
        return itemDTO;
    }

    @Override
    public String delete(Integer id) {
        Item item = itemRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Item Not Found"));
        itemRepository.delete(item);
        return "Successfully deleted Item!";
    }
}
