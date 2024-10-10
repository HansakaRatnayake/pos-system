package com.project.possystem.repository;

import com.project.possystem.entity.Item;
import com.project.possystem.entity.Stock;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StockRepository extends JpaRepository<Stock, Integer> {

    boolean existsByItem(Item item);
}
