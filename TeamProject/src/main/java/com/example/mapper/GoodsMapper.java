package com.example.mapper;

import java.util.List;

import com.example.domain.AttachVo;
import com.example.domain.GoodsVo;


public interface GoodsMapper {

//	 전체 상품 가져오기
	List<AttachVo> getAllGoods();

	GoodsVo getJollygoodsAndAttaches(String goodsName);

	void goodsWrite(GoodsVo goodsVo);
	
	void deleteGoodsByName(String goodsName);

}
