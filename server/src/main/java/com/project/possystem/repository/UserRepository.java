package com.project.possystem.repository;

import com.project.possystem.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Collection;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {

    boolean existsByUsername(String username);
    Optional<User> findByUsername(String username);


}
