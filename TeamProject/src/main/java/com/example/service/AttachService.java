package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.AttachVo;
import com.example.mapper.AttachMapper;

@Service
@Transactional
public class AttachService {

	@Autowired
	private AttachMapper attachMapper;

	public void insertAttach(AttachVo attachVo) {
		attachMapper.insertAttach(attachVo);
	}

	public void insertAttaches(List<AttachVo> attaches) {
		for (AttachVo attachVo : attaches) {
			attachMapper.insertAttach(attachVo);
		}
	}

}