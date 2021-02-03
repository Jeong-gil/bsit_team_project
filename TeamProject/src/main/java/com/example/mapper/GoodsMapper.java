package com.example.mapper;

import java.util.List;

import com.example.domain.GoodsVo;

public interface GoodsMapper {

	// 전체 상품 가져오기
	List<GoodsVo> getAllGoods();

	// 선택한 상품 상세정보 불러오기
	GoodsVo getProductDetail(String goodsName);

	void goodsWrite(GoodsVo goodsVo);

}
