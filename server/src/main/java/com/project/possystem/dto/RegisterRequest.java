package com.project.possystem.dto;

import com.project.possystem.entity.Role;
import com.project.possystem.entity.Userstatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequest {

    private String username;
    private String password;
    private String mobile;
    private String email;
    private Userstatus userstatus;
    private Role role;
}
