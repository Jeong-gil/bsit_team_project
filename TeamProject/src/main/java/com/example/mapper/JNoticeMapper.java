package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.JNoticeVo;

public interface JNoticeMapper {

   void addJNotice(JNoticeVo jnoticeVo);
   
   JNoticeVo getJNoticeByNum(int num);
   
   int getCountBySearch(
         @Param("category") String category, 
         @Param("search") String search);
   
   
   List<JNoticeVo> getJNoticesBySearch(
         @Param("startRow") int startRow, 
         @Param("pageSize") int pageSize, 
         @Param("category") String category, 
         @Param("search") String search);
   
   int getNextNum(String tableName);
   
   
   void updateReadcount(int num);

}