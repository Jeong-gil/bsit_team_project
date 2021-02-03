package com.example.mapper;

import org.apache.ibatis.annotations.Param;

import com.example.domain.MemberVo;

public interface MemberMapper {

	// 회원가입
	void addMember(MemberVo memberVo);

	// 아이디 중복확인
	int getCountById(String id);

	// 아이디 찾기
	String getFindId(@Param("name") String name, @Param("email") String email);

	// 로그인
	String userCheck(String id);

	// 로그인된상태
	String userCheck1(String id);
	
	void addRandom(String randomNum);
	
	void randomTruncate();
	
	int getCountByPushId(String id);
	
	int getCountRandomNum(String randomNum);

}
