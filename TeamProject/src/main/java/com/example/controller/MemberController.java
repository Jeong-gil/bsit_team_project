package com.example.controller;




import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.MemberVo;
import com.example.service.MemberService;

import lombok.extern.java.Log;



@Log
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/joinView")
	public void joinView() {
		log.info("GET - joinView() 호출됨");
	}
	
	@PostMapping("/joinView")
	public String joinView(MemberVo memberVo) {
		log.info("Post - joinView() 호출됨");
		
		// 회원가입 날짜 설정
		memberVo.setRegDate(new Timestamp(System.currentTimeMillis()));
		log.info("memberVo : " + memberVo);
		
		memberService.addmember(memberVo);
		
		return "redirect:/member/login";
	}
	
	@GetMapping(value = "/ajax/idDupChk", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})// 최종적으로 이메서드가 요청하는 메서드를 클라이언트쪽에 어떠한응답을 줄것인가? 정하는것
	@ResponseBody // 리턴 객체를 JSON 문자열로 변환해서 응답을 줌
	public Map<String, Boolean> ajaxJoinIdDupChk(String id){ // 제이슨문자열을 통으로 줄때는 @RequstBody애노테이션을 매개변수앞에 써줌
		
		log.info("Dubid = " + id);
		
		int count = memberService.getCountById(id);
		
		Map<String, Boolean> map = new HashMap<>();
		if (count == 0) {
			map.put("isIdDup", false);
		} else {
			map.put("isIdDup", true);
		}
		
		return map;
		
	}
	
	@PostMapping("/login")
	public String login(
			@RequestParam(name = "m_id") String mId,
			String password,
			@RequestParam(name = "chk_security", defaultValue = "n") String chkSecurity,
			HttpServletResponse response,
			HttpSession session) throws IOException 
	{
		System.out.println("mId: " + mId + "  password: " + password + "  chkSecurity: " + chkSecurity);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int check = memberService.getLoginCheck(mId, password);
		
		if(check == -1) {
			out.println("<script>");
			out.println("	alert('패스워드가 일치하지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else if(check == -2) {
			out.println("<script>");
			out.println("	alert('존재하지 않는 아이디입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else if (check == 1) {
			if (chkSecurity.equals("y")) {
				Cookie cookie = new Cookie("id", mId);
				cookie.setMaxAge(60 * 10);
				cookie.setPath("/");
				
				response.addCookie(cookie);
			}
			session.setAttribute("id", mId);
			
			return "redirect:/";
		}
		return null;
	}
	
	@GetMapping("/logout")
	public String logout(
			HttpServletRequest request,
			HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		session.invalidate();
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("id")) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					
					response.addCookie(cookie);
				}
			}
		}
		
		return "redirect:/";
	}
	
	
	@GetMapping("/login")
	public void login() {
		log.info("GET - login() 호출됨");
	}
	
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 장바구니 폴더 컨트롤러 만들면 옮기기
	@GetMapping("/cart")
	public void cart() {
		log.info("GET - cart() 호출됨");
	}
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	@GetMapping("/product")
	public void product() {
		log.info("GET - product() 호출됨");
	}
	
	@GetMapping("productDetail")
	public void productDetail() {
		log.info("GET - productDetail() 호출됨");
	}
	
	

}
