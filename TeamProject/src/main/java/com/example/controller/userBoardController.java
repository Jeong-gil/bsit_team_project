package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/userBoard/*")
public class userBoardController {

	@GetMapping("/jnotice")
	public void joinView() {
		log.info("GET - joinView() 호출됨");
	}

}