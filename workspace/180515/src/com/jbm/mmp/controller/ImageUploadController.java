package com.jbm.mmp.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jbm.mmp.util.ResizeImageUtil;
import com.jbm.mmp.vo.Mania;

@RestController
public class ImageUploadController {

	/**
	 * 범용적으로 사용되는 파일업로드 컨트롤러
	 * @param width : 너비
	 * @param height : 높이
	 * @param size : 정사각형이면 size로
	 * @param folder : 리사이즈후 저장될 폴더명
	 * @param upload : 업로드될 파일
	 * @param request : request객체
	 * @return : json
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/upload", method = RequestMethod.POST)
	public String upload(
			@RequestParam(required = false) Integer width,
			@RequestParam(required = false) Integer height,
			@RequestParam(required = false) Integer size,
			@RequestParam String folder,
			MultipartFile upload,
			HttpServletRequest request)
	throws Exception {

		// 1) ServletContext얻기
		ServletContext sc = request.getServletContext();

		// 2) 기본경로 얻기
		String path = sc.getRealPath("");

		// 3) upload경로
		String uploadPath = path + "upload" + File.separator;

		// 4)  image경로
		String resizePath = path + folder + File.separator;

		// 5) 고유한 값을 위한 UUID
		UUID uuid = UUID.randomUUID();

		String ext = upload.getOriginalFilename();

		int dotIdx = ext.lastIndexOf(".");

		ext = ext.substring(dotIdx, ext.length());

		System.out.println(ext);

		String fileName = uuid + ext;

		// 6) 경로+파일이름
		String fullPath = uploadPath + fileName;

		// 7) 실제 생성될 파일
		File file = new File(fullPath);

		// 8) 파일 옮기기
		upload.transferTo(file);
		System.out.println("파일 생성 성공");
		// 9) 리사이징 (200x200)
		if(size!=null) {
			width = size;
			height = size;
		}
		
		ResizeImageUtil.resize(fullPath, resizePath + fileName, width, height);
	
		return "{\"name\":\"" + fileName + "\"}";

	}

}
