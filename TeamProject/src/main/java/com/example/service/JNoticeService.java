package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.JNoticeVo;
import com.example.mapper.JNoticeMapper;

@Service
public class JNoticeService {

	@Autowired
	private JNoticeMapper jnoticeMapper;

	public JNoticeVo getJNoticeByNum(int num) {
		JNoticeVo jnoticeVo = jnoticeMapper.getJNoticeByNum(num);
		return jnoticeVo;
	}
}