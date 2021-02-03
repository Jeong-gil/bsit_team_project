package com.example.mapper;

import java.util.List;

import com.example.domain.BasketVo;

public interface BasketMapper {

	// 장바구니 단일 상품 제거
	void deleteOne(String consumerID, String goodsName);

	// 장바구니 목록 추가
	void addBasket(String consumerID, String goodsName, int amount, int totalPrice);

	// 회원 장바구니 정보 불러오기
	List<BasketVo> getMemberBasket(String consumerID);

}
