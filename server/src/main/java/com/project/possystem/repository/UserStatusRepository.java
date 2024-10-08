package com.project.possystem.repository;

import com.project.possystem.entity.Userstatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserStatusRepository extends JpaRepository<Userstatus,Integer> {
}
