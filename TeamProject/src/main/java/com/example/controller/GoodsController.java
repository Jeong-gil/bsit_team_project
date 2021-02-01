package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.GoodsVo;
import com.example.service.GoodsService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/allGoods")
	public String allGoods(Model model) {
		
		List<GoodsVo> goodsVos = goodsService.getAllGoods();
		
		model.addAttribute("goodsVos", goodsVos);
		
		return "goods/best/product";
	}
	
	@GetMapping("/productDetail")
	public String productDetail(String goodsName, Model model) {
		
		System.out.println("public String productDetail(String productName, Model model) 실행");
		System.out.println(goodsName);
		
		GoodsVo goodsVo = goodsService.getProductDetail(goodsName);
		
		model.addAttribute("goodsVo", goodsVo);
		
		return "goods/productDetail";
	}
	
	@GetMapping("/cart")
	public String cart() {
		
		return "goods/cart";
		
	}

}
