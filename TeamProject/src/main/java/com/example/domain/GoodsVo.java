package com.example.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GoodsVo {

	private String goodsName;
	private String subGoods;
	private String mainCategory;
	private String subCategory;
	private int salePrice;
	private String salesUnit;
	private String volume;
	private String delClassification;
	private String packingType;
	private String allergy;
	private String shelfLife;
	private String contents1;
	private String contents2;
	private Timestamp upload;

}
