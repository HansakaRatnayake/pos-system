package com.project.possystem.dto;

import com.project.possystem.entity.Role;
import com.project.possystem.entity.Userstatus;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDTO {
    private Integer id;
    private String username;
    private String password;
    private String mobile;
    private String email;
    private Userstatus userstatus;
    private Role role;
}
