package com.project.possystem.controller;

import com.project.possystem.dto.AuthenticationRequest;
import com.project.possystem.dto.AuthenticationResponse;
import com.project.possystem.dto.RegisterRequest;
import com.project.possystem.dto.StandardResponse;
import com.project.possystem.entity.User;
import com.project.possystem.security.CookieProvider;
import com.project.possystem.service.AuthService;
import com.project.possystem.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import java.io.IOException;
import java.util.HashMap;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;
    private final CookieProvider cookieProvider;
    private final UserService userService;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(@RequestBody RegisterRequest request){
        return ResponseEntity.ok(authService.register(request));
    }

    @PostMapping("/authenticate")
    public ResponseEntity<User> authenticate(@RequestBody AuthenticationRequest request, HttpServletResponse response){
        AuthenticationResponse auth = authService.authenticate(request);
        response.addCookie(cookieProvider.createAuthCookie(auth.getAccessToken()));
        response.addCookie(cookieProvider.createRefreshCookie(auth.getRefreshToken()));

        return ResponseEntity.ok(auth.getUser());
    }

    @GetMapping("/refresh")
    public void refreshToken(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie refreshCookie = WebUtils.getCookie(request,"refreshToken");

        if(refreshCookie != null){
            AuthenticationResponse authResponse = authService.refreshToken(refreshCookie.getValue());
            response.addCookie(cookieProvider.createAuthCookie(authResponse.getAccessToken()));
        }
    }
}
