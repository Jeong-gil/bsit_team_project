package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.GoodsVo;
import com.example.mapper.GoodsMapper;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	public List<GoodsVo> getAllGoods() {
		List<GoodsVo> goodsVos = goodsMapper.getAllGoods();
		return goodsVos;
	}
	
	public GoodsVo getProductDetail(String goodsName) {
		GoodsVo goodsVo = goodsMapper.getProductDetail(goodsName);
		return goodsVo;
	}
	
}
