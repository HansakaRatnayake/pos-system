package com.project.possystem.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.possystem.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AuthenticationResponse {

    @JsonProperty("accesstoken")
    private String accessToken;

    @JsonProperty("refreshtoken")
    private String refreshToken;

    private User user;
}
