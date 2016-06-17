package com.study.fileUpLoader;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	
	@Resource(name="uploadPath") 
	private String uploadPath;
	
	@RequestMapping(value = "/uploader", method = RequestMethod.GET)
	public String uploader(Locale locale, Model model) {
		
		return "uploadForm";
		
	}
	
	@RequestMapping(value = "/uploader", method = RequestMethod.POST)
	public String upload(MultipartFile file,Model model) throws IOException {
		
		String fileName = fileUpload(file.getOriginalFilename(),file.getBytes());
		model.addAttribute("filename",fileName);
		return "result";	
	}
	
	private String fileUpload(String oldName,byte[] file) throws IOException{
		
		UUID uid = UUID.randomUUID();
		String filename = uid.toString() + "_" + oldName;
		File target = new File(uploadPath,filename);
		FileCopyUtils.copy(file, target);
	
		return filename;
	}
}
