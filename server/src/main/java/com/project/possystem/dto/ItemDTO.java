package com.project.possystem.dto;

import com.project.possystem.entity.Category;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ItemDTO {
    private Integer id;
    private String name;
    private BigDecimal price;
    private Category category;
    private String code;
    private byte[] photo;
    private BigDecimal poprice;
}
