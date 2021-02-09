package com.example.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.JNoticeVo;
import com.example.domain.PageDto;
import com.example.service.JNoticeService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/consumerBoard/*")
public class ConsumerBoardController {

	@GetMapping("/cboard")
	public void cboard() {
		log.info("cobard===================호출됨");
	}
}