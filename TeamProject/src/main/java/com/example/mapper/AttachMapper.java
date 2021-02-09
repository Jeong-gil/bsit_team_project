package com.example.mapper;

import java.util.List;

import com.example.domain.AttachVo;

public interface AttachMapper {

	int insertAttach(AttachVo attachVo);
	
	List<AttachVo> getAttachesByName(String attachName);
	
	void deleteAttachesByName(String goodsName);

}