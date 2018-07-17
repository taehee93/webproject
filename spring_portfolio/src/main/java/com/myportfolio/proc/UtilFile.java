package com.myportfolio.proc;

import java.io.File;
import java.io.IOException;

import org.springframework.util.FileCopyUtils;

public class UtilFile {
	String uploadPath="C:\\Users\\smat-501\\git\\webproject\\spring_portfolio\\src\\main\\webapp\\file_room";
	
	public String create(String originalName, byte[] fileData) throws IOException {
		File target = new File(uploadPath, originalName);
		FileCopyUtils.copy(fileData, target);
		return originalName;
	}
}
