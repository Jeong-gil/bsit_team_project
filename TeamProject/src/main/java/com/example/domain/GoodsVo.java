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
	private String cunsumerId;
	private String mainCategory;
	private String subCategory;
	private int salePrice;
	private String goodsEx;
	private int saleQ;
	private String salesUnit;
	private String volume;
	private String delClassification;
	private String packingType;
	private String allergy;
	private String shelfLife;
	private Timestamp upload;
	private String filename1;
	private String filename2;
	private String fileuploadpath;
	
}
