package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/consumerBoard/*")
public class ConsumerBoardController {

	@GetMapping("/cboard")
	public void cboard() {
		log.info("cobard===================호출됨");
	}
	
	@GetMapping("/shipping")
	public void shipping() {
		log.info("shipping=================호출됨");
	}
	
	@GetMapping("/alwaysLiving")
	public void alwaysLiving() {
		log.info("alwaysLiving=============호출됨");
	}
	
	@GetMapping("/goodsReview")
	public void goodsReview() {
		log.info("goodsReview==============호출됨");
	}
	
	@GetMapping("/savings")
	public void savings() {
		log.info("savings==================호출됨");
	}
	
	@GetMapping("/coupon")
	public void coupon() {
		log.info("coupon===================호출됨");
	}
	
	@GetMapping("/memberUpdate")
	public void memberUpdate() {
		log.info("memberUpdate=============호출됨");
	}
}