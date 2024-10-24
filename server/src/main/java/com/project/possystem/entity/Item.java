package com.project.possystem.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "item")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "price", precision = 10, scale = 2)
    private BigDecimal price;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @Column(name = "code", length = 45)
    private String code;

    @Lob
    @Column(name = "photo")
    private byte[] photo;

    @JsonIgnore
    @OneToMany(mappedBy = "item")
    private Set<Stock> stocks = new LinkedHashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "item")
    private Set<Transactionitem> transactionitems = new LinkedHashSet<>();

    @Column(name = "poprice", precision = 10, scale = 2)
    private BigDecimal poprice;

}