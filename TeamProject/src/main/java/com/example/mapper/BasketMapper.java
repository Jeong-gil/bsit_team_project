package com.example.mapper;

public interface BasketMapper {
	
	// 장바구니 단일 상품 제거
	void deleteOne(String consumerID, String goodsName);
	
	// 장바구니 목록 추가
	void addBasket(String consumerID, String goodsName, int amount);

}
