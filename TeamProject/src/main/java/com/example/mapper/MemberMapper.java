package com.example.mapper;

import com.example.domain.MemberVo;

public interface MemberMapper {
	
	// 회원가입
	void addMember(MemberVo memberVo);
	
	// 아이디 중복확인
	int getCountById(String id);
	
	// 로그인
	String getPw(String id);

}
