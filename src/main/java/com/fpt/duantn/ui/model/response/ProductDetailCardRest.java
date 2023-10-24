package com.fpt.duantn.ui.model.response;


import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
public class ProductDetailCardRest extends RepresentationModel<ProductDetailCardRest> {

    private String productCode;
    private String productName;
    private BigDecimal price;
    private String mainImage;
    private String colorCode;
    private String colorName;


}
