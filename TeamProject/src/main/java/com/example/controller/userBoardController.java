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
@RequestMapping("/userBoard/*")
public class userBoardController {

   @Autowired
   private JNoticeService jnoticeService;
   
   @GetMapping("/jnotice")
   public String jnotice(
         @RequestParam(defaultValue = "1") int pageNum,
         @RequestParam(defaultValue = "") String category,
         @RequestParam(defaultValue = "") String search,
         Model model) {
      
      //int count = noticeService.getCountAll();
      int count = jnoticeService.getCountBySearch(category, search);
      
      // 공지사항에 노출되는 게시물 10개로 제한
      int pageSize = 10;
      
      int startRow = (pageNum - 1) * pageSize;      
      
      List<JNoticeVo> jnoticeList = null;
      if (count > 0) {
         //noticeList = noticeService.getNotices(startRow, pageSize);
         jnoticeList = jnoticeService.getJNoticesBySearch(startRow, pageSize, category, search);
      }
      
      
      PageDto pageDto = new PageDto();
      
      if (count > 0) {
         int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
         //int pageCount = (int) Math.ceil((double) count / pageSize);
         
         int pageBlock = 5;
         
         // 1~5          6~10          11~15          16~20       ...
         // 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
         int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
         
         int endPage = startPage + pageBlock - 1;
         if (endPage > pageCount) {
            endPage = pageCount;
         }
         
         pageDto.setCategory(category);
         pageDto.setSearch(search);
         pageDto.setCount(count);
         pageDto.setPageCount(pageCount);
         pageDto.setPageBlock(pageBlock);
         pageDto.setStartPage(startPage);
         pageDto.setEndPage(endPage);
      } // if
      
      
      model.addAttribute("jnoticeList", jnoticeList);
      System.out.println("jnoticeList :" + jnoticeList);
      model.addAttribute("pageDto", pageDto);
      model.addAttribute("pageNum", pageNum);
      System.out.println("pageNum :" + pageNum);
      
      return "userBoard/jnotice";
   }
   
   @GetMapping("/jservice")
   public String jservice() {
      log.info("jservice() 호출됨");
      return "userBoard/jservice";
   }
   @GetMapping("/jwrite")
   public String jwrite(@ModelAttribute("pageNum") String pageNum, HttpSession session, Model model) {
      return "userBoard/jwrite";
   }
   
   @PostMapping("/jwrite")
   public String jwrite(String pageNum, JNoticeVo jnoticeVo,
         HttpSession sesstion, HttpServletRequest request) {
      log.info("jwrite() 호출됨");
      jnoticeVo.setRegDate(new Timestamp(System.currentTimeMillis()));
      jnoticeVo.setReadcount(0);
      
      
      int num = jnoticeService.getNextNum("jnotice");
      jnoticeVo.setReRef(num);
      System.out.println("num :" +num);
      jnoticeVo.setReLev(0);
      jnoticeVo.setReSeq(0);
      
      // 공지 글쓰기.
      jnoticeService.addJNotice(jnoticeVo);
      
      return "redirect:/userBoard/jcontent?num=" + num + "&pageNum=" + pageNum;
   }

   @GetMapping("/jcontent")
   public String jcontent(int num, String pageNum, Model model) {
      log.info("/jcontent() 호출됨");
      jnoticeService.updateReadcount(num);
      
      JNoticeVo  jnoticeVo = jnoticeService.getJNoticeByNum(num);
      
      String content = "";
      if (jnoticeVo.getContent() != null) {
         content = jnoticeVo.getContent().replace("\n", "<br>");
         jnoticeVo.setContent(content);
      }
      
      model.addAttribute("jnoticeVo", jnoticeVo);
      model.addAttribute("pageNum", pageNum);
      
      return "userBoard/jcontent";
   }

}