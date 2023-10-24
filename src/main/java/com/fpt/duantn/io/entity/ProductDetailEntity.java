package com.fpt.duantn.io.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name="product_detail")
public class ProductDetailEntity implements Serializable {

    private static final long serialVersionUID = 5313493413859894403L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "default_price")
    private BigDecimal defaultPrice;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "status")
    private Integer status;

    @ManyToOne
    @JoinColumn(name = "color_id")
    private ColorEntity colorEntity;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private ProductEntity productEntity;




}
