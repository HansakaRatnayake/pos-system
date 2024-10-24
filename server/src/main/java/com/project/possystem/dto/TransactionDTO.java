package com.project.possystem.dto;

import com.project.possystem.entity.Transactionitem;
import com.project.possystem.entity.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TransactionDTO {
    private Integer id;
    private LocalDate date;
    private BigDecimal grandtotal;
    private User user;
    private Set<Transactionitem> transactionitems;
}
