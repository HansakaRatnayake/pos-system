package com.project.possystem.dto;

import com.project.possystem.entity.Item;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class StockDTO {
    private Integer id;
    private BigDecimal quentity;
    private LocalDate lastupdated;
    private Item item;
}
