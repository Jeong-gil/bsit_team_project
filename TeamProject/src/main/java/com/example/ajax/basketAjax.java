package com.example.ajax;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.service.BasketService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/basket/*")
@Log
public class basketAjax {
	
	@Autowired
	private BasketService basketService;
	
	@PostMapping(
			value = "/add", 
			consumes = MediaType.APPLICATION_JSON_VALUE, 
			produces = MediaType.APPLICATION_JSON_VALUE)
	public void add(
			@RequestBody Map<String, Object> params,
			HttpSession session) 
	{
		String consumerID = (String) session.getAttribute("id");
		
		basketService.addBasket(consumerID, (String) params.get("goodsName"), (int) params.get("amount"));
	}
	
}
