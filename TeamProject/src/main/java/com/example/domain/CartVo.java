package com.example.domain;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVo {
	
	private int cartId;
	private String consumerID;
	private String goodsName;
	private int amount;
	
}
