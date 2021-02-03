package com.example.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.platform.commons.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.AttachVo;
import com.example.domain.GoodsVo;
import com.example.service.GoodsService;
import com.google.gson.JsonObject;

import lombok.extern.java.Log;
import net.coobird.thumbnailator.Thumbnailator;

@Log
@Controller
@RequestMapping("/goods/*")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;

	@GetMapping("/allGoods")
	public String allGoods(Model model) {

		List<GoodsVo> goodsVos = goodsService.getAllGoods();

		model.addAttribute("goodsVos", goodsVos);

		return "goods/best/product";
	}

	@GetMapping("/productDetail")
	public String productDetail(String goodsName, Model model) {

		System.out.println("public String productDetail(String productName, Model model) 실행");
		System.out.println(goodsName);

		GoodsVo goodsVo = goodsService.getProductDetail(goodsName);

		model.addAttribute("goodsVo", goodsVo);

		return "goods/productDetail";
	}

	@GetMapping("/writer")
	public void goodsWriter() {
		log.info("GET - writer() 호출됨");
	}

	private String getFolder() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String strDate = sdf.format(date); // "2020/11/11"
		return strDate;
	}

	private boolean isImage(String filename) {
		boolean result = false;

		// aaaa.bbb.ccc.ddd
		int index = filename.lastIndexOf(".");
		String ext = filename.substring(index + 1);

		if (ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("jpeg") || ext.equalsIgnoreCase("gif")
				|| ext.equalsIgnoreCase("png")) {
			result = true;
		}
		return result;
	}

	// 주글쓰기
	@PostMapping("/writer")
	public String productWrite(HttpServletRequest request,
			@RequestParam(name = "filename1", required = false) List<MultipartFile> multipartFiles, GoodsVo goodsVo)
			throws IOException {

		goodsVo.setUpload(new Timestamp(System.currentTimeMillis()));

		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/"); // webapp 폴더의 실제경로
		log.info("realPath : " + realPath);

		String strDate = this.getFolder();

		File dir = new File(realPath + "/upload", strDate);
		log.info("dir : " + dir.getPath());

		if (!dir.exists()) { // 디렉토리가 존재하지 않으면
			dir.mkdirs(); // 생성
		}

		List<AttachVo> attachList = new ArrayList<>();

		if (multipartFiles != null) {
			for (MultipartFile multipartFile : multipartFiles) {
				if (multipartFile.isEmpty()) {
					continue;
				}

				String filename = multipartFile.getOriginalFilename();
				log.info("filename1 : " + filename); // DDD.jpg
				int beginIndex = filename.lastIndexOf("\\") + 1;
				filename = filename.substring(beginIndex);

				UUID uuid = UUID.randomUUID();
				String strUuid = uuid.toString();

				String uploadFilename = strUuid + "_" + filename;

				File saveFile = new File(dir, uploadFilename);

				multipartFile.transferTo(saveFile);

				AttachVo attachVo = new AttachVo();

				attachVo.setNoNum(1);

				attachVo.setUuid(strUuid);
				attachVo.setFilename1(filename);
				attachVo.setUploadpath(strDate);

				if (isImage(filename)) {
					attachVo.setImage("I");

					File thumbnailFile = new File(dir, "s_" + uploadFilename);

					try (FileOutputStream fos = new FileOutputStream(thumbnailFile)) {
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), fos, 100, 100);
					}
				} else {
					attachVo.setImage("O");
				}
				attachList.add(attachVo);

			}
		}

//	      log.info("productVo.getGoods_name() = " + productVo.getGoods_name());

		goodsService.addGoodsAndAttaches(goodsVo, attachList);

		return "redirect:/goods/productDetail";

	}

	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, AttachVo attachVo) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/"); // webapp 폴더의 실제경로
		log.info("realPath : " + realPath);

		String strDate = this.getFolder();

		File dir = new File(realPath + "/upload", strDate);
		log.info("dir : " + dir.getPath());

		if (!dir.exists()) { // 디렉토리가 존재하지 않으면
			dir.mkdirs(); // 생성
		}

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) { // getSize가 0보다 큰지, getName이 공백인지 검사
				if (file.getContentType().toLowerCase().startsWith("image/")) { // file.getContentType()을 소문자로 바꿔주고 시작하는
																				// 타입이 image/인지 검사

					try {
						String realName = file.getOriginalFilename();

						int beginIndex = realName.lastIndexOf("\\") + 1;
						realName = realName.substring(beginIndex);

						String fileName = file.getName();

						UUID uuid = UUID.randomUUID();
						String strUuid = uuid.toString();

						String uploadFilename = strUuid + "_" + realName;

						String realSaveFile = dir + "\\" + uploadFilename;

						File saveFile = new File(realSaveFile);

						byte[] bytes = file.getBytes();
						String uploadPath = request.getServletContext().getRealPath("/img");

						uploadPath = uploadPath + "/" + fileName;
						log.info("uploadPath = " + uploadPath);
						out = new FileOutputStream(saveFile);
						out.write(bytes);

						printWriter = response.getWriter();
						response.setContentType("text/html");
						log.info("request.getContextPath() = " + request.getContextPath());

						String fileUrl = "/upload/" + strDate + "\\" + uploadFilename;
						log.info("fileUrl " + fileUrl);

						attachVo.setUuid(strUuid);
						attachVo.setFilename1(realName);
						attachVo.setUploadpath(strDate);

						if (isImage(realName)) {
							attachVo.setImage("I");

						} else {
							attachVo.setImage("O");
						}

						// json 데이터로 등록
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// 이런 형태로 리턴이 나가야함.
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);

						printWriter.println(json);

					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		goodsService.ckUpload(attachVo);

		return null;
	}

}
