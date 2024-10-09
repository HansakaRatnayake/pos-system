package com.project.possystem.service.IMPL;

import com.project.possystem.dto.CategoryDTO;
import com.project.possystem.entity.Category;
import com.project.possystem.exception.ResourceAlreadyExistException;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.CategoryRepository;
import com.project.possystem.service.CategoryService;
import com.project.possystem.util.Mapper.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceIMPL implements CategoryService {

    private final CategoryRepository categoryRepository;
    private final ObjectMapper objectMapper;

    @Override
    public List<CategoryDTO> getAll() {
        List<Category> categories = categoryRepository.findAll();
        if(!categories.isEmpty()) {
            return objectMapper.categoryListToDtoList(categories);
        }else{
            throw new ResourceNotFoundException("Categories Not Found!");
        }
    }

    @Override
    public CategoryDTO save(CategoryDTO categoryDTO) {

        if(categoryRepository.existsByName(categoryDTO.getName())){
            throw new ResourceAlreadyExistException("Category Already Exist!");
        }

        Category category = objectMapper.categoryDtoToCategory(categoryDTO);
        categoryRepository.save(category);
        return categoryDTO;
    }

    @Override
    public CategoryDTO update(CategoryDTO categoryDTO) {

        Category categoryrec = categoryRepository.findById(categoryDTO.getId()).orElseThrow(() -> new ResourceNotFoundException("Category Not Found!"));

        if(!categoryDTO.getName().equals(categoryrec.getName()) && categoryRepository.existsByName(categoryDTO.getName())){
            throw new ResourceAlreadyExistException("Category Already Exist!");
        }

        Category category = objectMapper.categoryDtoToCategory(categoryDTO);
        categoryRepository.save(category);
        return categoryDTO;
    }

    @Override
    public String delete(int id) {
        Category category = categoryRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Category Not Found!"));
        categoryRepository.delete(category);
        return "Successfully Deleted!";
    }
}
