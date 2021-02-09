package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.AttachVo;
import com.example.domain.GoodsVo;

import com.example.mapper.AttachMapper;
import com.example.mapper.GoodsMapper;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired
	private AttachMapper attachMapper;

//	public List<GoodsVo> getAllGoods() {
//		List<GoodsVo> goodsVos = goodsMapper.getAllGoods();
//		return goodsVos;
//	}
	
	public List<AttachVo> getAllGoods() {
		List<AttachVo> attachVos = goodsMapper.getAllGoods();
		return attachVos;
	}


	
	public GoodsVo getJollygoodsAndAttaches(String goodsName) {
		return goodsMapper.getJollygoodsAndAttaches(goodsName);
	}
	
	

//  게시판 주글 쓰기
	public void addGoodsAndAttaches(GoodsVo goodsVo, List<AttachVo> attachList) {
		goodsMapper.goodsWrite(goodsVo);

		for (AttachVo attachVo : attachList) {
			attachMapper.insertAttach(attachVo);
		}
	}

	public void ckUpload(AttachVo attachVo) {

		attachMapper.insertAttach(attachVo);

	}
	
	@Transactional
	public void deleteGoodsAndAttaches(String goodsName) {
		goodsMapper.deleteGoodsByName(goodsName);
		attachMapper.deleteAttachesByName(goodsName);
	}

//	public void setgoodsMapper(GoodsMapper goodsMapper) {
//		this.goodsMapper = goodsMapper;
//	}

}
