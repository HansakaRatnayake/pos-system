package com.project.possystem.repository;

import com.project.possystem.entity.Userstatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserStatusRepository extends JpaRepository<Userstatus,Integer> {
    Optional<Userstatus> findByName(String name);
}
