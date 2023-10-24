package com.fpt.duantn.io.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name="colors")
public class ColorEntity implements Serializable {

    private static final long serialVersionUID = 5313493413859894403L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "color_name")
    private String colorName;

    @Column(name = "color_code")
    private String colorCode;

    @OneToMany(mappedBy = "colorEntity", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ProductDetailEntity> productDetails;



}
