package com.project.possystem.service.IMPL;

import com.project.possystem.dto.RoleDTO;
import com.project.possystem.entity.Role;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.RoleRepository;
import com.project.possystem.service.RoleService;
import com.project.possystem.util.Mapper.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoleServiceIMPL implements RoleService {

    private final RoleRepository roleRepository;
    private final ObjectMapper objectMapper;

    @Override
    public List<RoleDTO> getAll() {
        List<Role> roles = roleRepository.findAll();
        if(!roles.isEmpty()){
            return objectMapper.roleListToDtoList(roles);
        }else{
            throw new ResourceNotFoundException("Roles Not Found!");
        }
    }
}
