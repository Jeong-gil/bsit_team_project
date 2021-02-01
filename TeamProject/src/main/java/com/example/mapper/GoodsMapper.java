package com.example.mapper;

import java.util.List;

import com.example.domain.GoodsVo;

public interface GoodsMapper {
	
	// 전체 상품 가져오기
	List<GoodsVo> getAllGoods();
	
	GoodsVo getProductDetail(String goodsName);
	
}
