package com.project.possystem.service;

import com.project.possystem.dto.AuthenticationRequest;
import com.project.possystem.dto.AuthenticationResponse;
import com.project.possystem.dto.RegisterRequest;

public interface AuthService {
    AuthenticationResponse register(RegisterRequest request);

    AuthenticationResponse authenticate(AuthenticationRequest request);

    AuthenticationResponse refreshToken(String value);
}
