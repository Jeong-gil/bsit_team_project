package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mapper.BasketMapper;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class BasketService {
	
	@Autowired
	private BasketMapper basketMapper;
	
	public void addBasket(String consumerID, String goodsName, int amount) {
		
		basketMapper.deleteOne(consumerID, goodsName);
		basketMapper.addBasket(consumerID, goodsName, amount);
		
	}
	
}
