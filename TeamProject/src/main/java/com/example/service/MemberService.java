package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.MemberVo;
import com.example.mapper.MemberMapper;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class MemberService {
	
	// 스프링 빈으로 등록된 객체중에서
	// 타입으로 객체의 참조를 가져와서 참조변수에 저장
	@Autowired
	private MemberMapper memberMapper;
	
	public void addmember(MemberVo memberVo) {
		memberMapper.addMember(memberVo);
	}
	
	public int getCountById(String id) {
		int count = memberMapper.getCountById(id);
		return count;
	}
	
	public int getLoginCheck(String id, String pw) {
		int check = -1;
		String dbPw = memberMapper.getPw(id);
		
		if (dbPw != null) {
			if (pw.equals(dbPw)) {
				check = 1;  // 로그인 성공
			} else {
				check = -1;  // 패스워드 틀림
			}
		} else {
			check = -2;  // 존재하지 않는 아이디
		}
		return check;
	}

}
