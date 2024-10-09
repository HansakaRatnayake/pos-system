package com.project.possystem.repository;

import com.project.possystem.entity.Item;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemRepository extends JpaRepository<Item, Integer> {

    boolean existsByCode(String code);
}
