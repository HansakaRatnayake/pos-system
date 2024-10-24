package com.project.possystem.service.IMPL;

import com.project.possystem.dto.UserStatusDTO;
import com.project.possystem.entity.Role;
import com.project.possystem.entity.Userstatus;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.UserStatusRepository;
import com.project.possystem.service.UserStatusService;
import com.project.possystem.util.Mapper.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserStatusServiceIMPL implements UserStatusService {

    private final UserStatusRepository userStatusRepository;
    private final ObjectMapper objectMapper;

    @Override
    public List<UserStatusDTO> getAll() {
        List<Userstatus> userStatusList = userStatusRepository.findAll();
        if(!userStatusList.isEmpty()){
            return objectMapper.userStatusListToDtoList(userStatusList);
        }else{
            throw new ResourceNotFoundException("UserStatuses Not Found!");
        }
    }

    @Override
    public void initializeUserStatuses() {
        if (userStatusRepository.findAll().isEmpty()) {

            userStatusRepository.saveAll(List.of(
                    Userstatus.builder()
                            .name("Active")
                            .build(),
                    Userstatus.builder()
                            .name("Inactive")
                            .build()
            ));
        }
    }
}
