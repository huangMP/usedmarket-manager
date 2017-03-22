package com.fh.service.trainingmanage.practice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fh.entity.Page;
import com.fh.util.DocAndDocxToHtml;
import com.fh.util.FileUpload;
import com.fh.util.FileUtil;
import com.fh.util.PageData;

/** 
 * 说明： 练习表接口
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
public interface PracticeManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**删除 重载方法
	 * @param pd
	 * @throws Exception
	 */
	public void delete(List<PageData> pds)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	/**通过 CHAPTER_ID 获取数据
	 * @param CHAPTER_ID
	 * @throws Exception
	 */
	public PageData findByCHAPTER_ID(String CHAPTER_ID)throws Exception;
	
	/**通过 CHAPTER_ID 删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByCHAPTER_ID(String CHAPTER_ID)throws Exception;
	
	/**通过 CHAPTER_ID 批量删除
	 * @param CHAPTER_IDS
	 * @throws Exception
	 */
	public void deleteByCHAPTER_IDS(String[] CHAPTER_IDS)throws Exception;

	/**通过 CHAPTER_ID 批量获取数据
	 * @param CHAPTER_IDS
	 * @throws Exception
	 */
	public void selectByCHAPTER_IDS(String[] CHAPTER_IDS)throws Exception;
	
	/**
	 * 删除docx和html
	 *  
	 * docx和html和htmlImg放在同一个目录下
	 * 且命名有如下规律：
	 * mmmm.docx	docx文件
	 * mmmm.html	html文件
	 * mmmm			htmlImg文件夹
	 * 
	 * @param realPathAndName docx真实路径+文件名+后缀
	 * @throws Exception
	 * @author  huangMP
	 * @date    2016年8月29日
	 */
	public void deleteDocxAndHtmlAndHtmlImg(String realPathAndName) throws Exception;
	
	
	/**
	 * 上传docx并生成html
	 * 
	 * docx和html和htmlImg放在同一个目录下
	 * 且命名有如下规律：
	 * mmmm.docx	docx文件
	 * mmmm.html	html文件
	 * mmmm			htmlImg文件夹
	 * 
	 * @param file docx文件
	 * @param realPath docx真实路径
	 * @param docxFileName docx文件名
	 * @throws Exception
	 * @return String docx文件名+后缀
	 * @author  huangMP
	 * @date    2016年8月29日
	 */
	public String uploadDocxAndHtmlAndHtmlImg(MultipartFile file, String realPapersUploadPath, String fileName);
	
	/**
	 * 通过ChapterIdArray查找
	 * @param LessonId
	 * @throws Exception
	 */
	public String[] findByChapterIdArray(String[] ArrayDATA_IDS) throws Exception;
	
	/**
	 * 通过ChapterId查找
	 * @param LessonId
	 * @throws Exception
	 */
	public List<PageData> findByChapterId(PageData pd) throws Exception;
	
	
}

