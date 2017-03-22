package com.fh.service.pagemanage.singleImg.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.util.NarrowImage;
/**
 * 单张图片处理
 * **/
@Service("singleImgService")
public class SingleImgService implements SingleImgManager{
    /*
     * 上传图片
     */
	public String uploadImage(CommonsMultipartFile file, String uploadPath,
			String realUploadPath,String newImgName) {
		InputStream is = null;
		OutputStream os = null;
		String prefix = null;
		try {//判断路径是否存在，不存在则创建
		   if (!(new File(realUploadPath).isDirectory())) {
		    new File(realUploadPath).mkdir();
	       }
	    } catch (SecurityException e) {
	      e.printStackTrace();
	    }
		try{
			String oleName = file.getOriginalFilename();
			prefix = oleName.substring(oleName.lastIndexOf(".")+1);
//			prefix = file.getOriginalFilename().substring(fileName.lastIndexOf(".")+1);;
			is=file.getInputStream();
//			String des = realUploadPath + "/" +file.getOriginalFilename();
			String des = realUploadPath + "/" +newImgName+"."+prefix;
			
			os = new FileOutputStream(des);
			
			byte[] buffer = new byte[1024];
			int len = 0;
			while((len = is.read(buffer))>0){
				os.write(buffer);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(is!=null){
				try{
					is.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
			}
			if(os!=null){
				try{
					os.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
			}
		}
		System.out.println(realUploadPath);
		//压缩图片
		NarrowImage ni = new NarrowImage();
		ni.imageNarrow(realUploadPath, newImgName+"_."+prefix, newImgName+"."+prefix);
		
		return uploadPath + "/"+newImgName+"_."+prefix;
	}
	
	public void delete(String imgPath){
		File file = new File(imgPath);
		if(file.exists()){
			file.delete();
			imgPath = imgPath.replace("_.", ".");
			File narrowfile = new File(imgPath);
			if(narrowfile.exists()) {
				narrowfile.delete();
			}
		}
		
	}
}
