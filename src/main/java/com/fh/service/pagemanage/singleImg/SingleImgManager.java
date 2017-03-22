package com.fh.service.pagemanage.singleImg;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public interface SingleImgManager {
	public String uploadImage(CommonsMultipartFile file, String uploadPath, String realUploadPath, String newImgName);

	public void delete(String imgPath);
}
