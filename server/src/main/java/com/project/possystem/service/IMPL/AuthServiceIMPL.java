package com.project.possystem.service.IMPL;

import com.project.possystem.dto.*;
import com.project.possystem.entity.User;
import com.project.possystem.entity.Userstatus;
import com.project.possystem.exception.ResourceNotFoundException;
import com.project.possystem.repository.CategoryRepository;
import com.project.possystem.repository.UserRepository;
import com.project.possystem.repository.UserStatusRepository;
import com.project.possystem.security.JwtService;
import com.project.possystem.service.AuthService;
import com.project.possystem.service.CategoryService;
import com.project.possystem.service.UserStatusService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
public class AuthServiceIMPL implements AuthService {

    private final UserRepository userRepository;
    private final UserStatusRepository userStatusRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;

    @Override
    public AuthenticationResponse register(RegisterRequest request) {
        List<Userstatus> all = userStatusRepository.findAll();
        Userstatus userstatus = all.stream().findFirst()
                .filter(c -> c.getName().equalsIgnoreCase("active")).orElseThrow(() -> new ResourceNotFoundException("Active status not found"));

        var user = User.builder()
                .username(request.getUsername())
                .password(passwordEncoder.encode(request.getPassword()))
                .email(request.getEmail())
                .role(request.getRole())
                .mobile(request.getMobile())
                .userstatus(userstatus)
                .build();

        userRepository.save(user);
        var jwtToken = jwtService.generateToken(user);
        var refreshToken = jwtService.generateRefreshToken(user);

        return AuthenticationResponse.builder()
                .accessToken(jwtToken)
                .refreshToken(refreshToken)
                .user(user)
                .build();
    }

    @Override
    public AuthenticationResponse authenticate(AuthenticationRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
        );

        User user = userRepository.findByUsername(request.getUsername()).orElseThrow();
        var jwtToken = jwtService.generateToken(user);
        var refreshToken = jwtService.generateRefreshToken(user);

        return AuthenticationResponse.builder()
                .accessToken(jwtToken)
                .refreshToken(refreshToken)
                .user(user)
                .build();
    }

    @Override
    public AuthenticationResponse refreshToken(String token) {
        User user = userRepository.findByUsername(jwtService.extractUsername(token)).orElseThrow();

        if(jwtService.isTokenValid(token,user)){
            String accessToken = jwtService.generateToken(user);

            return AuthenticationResponse.builder()
                    .accessToken(accessToken)
                    .user(user)
                    .build();
        }else{
            throw new ResourceNotFoundException("Invalid Refresh Token!");
        }
    }
}
