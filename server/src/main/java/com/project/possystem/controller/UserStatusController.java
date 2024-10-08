package com.project.possystem.controller;

import com.project.possystem.dto.UserStatusDTO;
import com.project.possystem.service.UserStatusService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/userstatuses")
@RequiredArgsConstructor
public class UserStatusController {

    private final UserStatusService userStatusService;

    @GetMapping
    public List<UserStatusDTO> getAll(){
        return userStatusService.getAll();
    }
}