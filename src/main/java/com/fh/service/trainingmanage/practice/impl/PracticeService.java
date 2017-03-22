package com.fh.service.trainingmanage.practice.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.DocAndDocxToHtml;
import com.fh.util.FileUpload;
import com.fh.util.FileUtil;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.service.trainingmanage.practice.PracticeManager;

/** 
 * 说明： 练习表
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
@Service("practiceService")
public class PracticeService implements PracticeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PracticeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		if(pd == null)
			return;
		//删除练习
		if(pd.getString("FILE_PATH")!=null){
			//获取文件的真实路径
			String realPath = PathUtil.getClasspath() + pd.getString("FILE_PATH");
			this.deleteDocxAndHtmlAndHtmlImg(realPath);
		}
		//删除答案
		if(pd.getString("ANSWER_PATH")!=null){
			//获取文件的真实路径
			String realPath =PathUtil.getClasspath() + pd.getString("ANSWER_PATH"); 
			this.deleteDocxAndHtmlAndHtmlImg(realPath);
		}
		dao.delete("PracticeMapper.delete", pd);
	}
	
	/**删除 重载方法
	 * @param pd
	 * @throws Exception
	 */
	public void delete(List<PageData> pds)throws Exception{
		if(pds == null)
			return;
		
		String[] practice_ids = new String[pds.size()];
		if(pds.size() != 0) {
			for (int i = 0; i < pds.size(); i++) {
				practice_ids[i] = new String(pds.get(i).getString("PRACTICE_ID"));
			}
		}
		
		this.deleteAll(practice_ids);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PracticeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PracticeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PracticeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PracticeMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		if(ArrayDATA_IDS == null || ArrayDATA_IDS.length <=0)
			return;
		
		//遍历要删除的数据的id
		for (String id : ArrayDATA_IDS) {
			PageData eachpd = new PageData();
			eachpd.put("PRACTICE_ID", id);
			//查询id所属的数据
			eachpd = this.findById(eachpd);
			//删除练习
			if(eachpd.getString("FILE_PATH")!=null){
				//获取文件的真实路径
				String realPath = PathUtil.getClasspath() + eachpd.getString("FILE_PATH");
				this.deleteDocxAndHtmlAndHtmlImg(realPath);
			}
			//删除答案
			if(eachpd.getString("ANSWER_PATH")!=null){
				//获取文件的真实路径
				String realPath =PathUtil.getClasspath() + eachpd.getString("ANSWER_PATH");
				this.deleteDocxAndHtmlAndHtmlImg(realPath);
			}
		}
		dao.delete("PracticeMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**通过 CHAPTER_ID 获取数据
	 * @param CHAPTER_ID
	 * @throws Exception
	 */
	public PageData findByCHAPTER_ID(String CHAPTER_ID)throws Exception{
		return (PageData)dao.findForObject("PracticeMapper.findByCHAPTER_ID", CHAPTER_ID);
	}
	
	/**通过 CHAPTER_ID 删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByCHAPTER_ID(String CHAPTER_ID)throws Exception{
		dao.delete("PracticeMapper.deleteByCHAPTER_ID", CHAPTER_ID);
	} 
	
	/**通过 CHAPTER_ID 批量删除
	 * @param CHAPTER_IDS
	 * @throws Exception
	 */
	public void deleteByCHAPTER_IDS(String[] CHAPTER_IDS)throws Exception{
		dao.delete("PracticeMapper.deleteByCHAPTER_IDS", CHAPTER_IDS);
	}

	/**通过 CHAPTER_ID 批量获取数据
	 * @param CHAPTER_IDS
	 * @throws Exception
	 */
	public void selectByCHAPTER_IDS(String[] CHAPTER_IDS)throws Exception{
		dao.delete("PracticeMapper.selectByCHAPTER_IDS", CHAPTER_IDS);
	}
	
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
	public void deleteDocxAndHtmlAndHtmlImg(String realPathAndName) throws Exception{
		//同时删除对应的docx文件
		FileUtil.delFile(realPathAndName);
		//同时删除对应的html文件
		String htmlRealPath = realPathAndName.replaceAll(".docx", ".html").replaceAll(".doc", ".html");
		FileUtil.delFile(htmlRealPath);
		//同时删除对应的img文件
		String htmlImgRealPath = realPathAndName.replaceAll(".docx", "").replaceAll(".doc", "");
		FileUtil.deleteFile(htmlImgRealPath);
	}
	
	
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
	public String uploadDocxAndHtmlAndHtmlImg( MultipartFile file ,String realPapersUploadPath ,String fileName){

		//调用FileUpload类中的fileUp方法，上传文件
		String newAnswerFileName = FileUpload.fileUp( file , realPapersUploadPath, fileName);
		String newAnswerHtmlName = newAnswerFileName.replaceAll(".docx", ".html").replaceAll(".doc", ".html");
		//为该文档生成html文件
		try {
			DocAndDocxToHtml.docOrDocxToHtml(realPapersUploadPath + "/" + newAnswerFileName , realPapersUploadPath + "/" + newAnswerHtmlName , realPapersUploadPath + "/" + fileName );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newAnswerFileName;
	}
	
	/**
	 * 通过ChapterIdArray查找
	 * @param LessonId
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String[] findByChapterIdArray(String[] ArrayDATA_IDS) throws Exception {
		List<PageData> findForList = (List<PageData>) dao.findForList("PracticeMapper.findByChapterIdArray", ArrayDATA_IDS);
		if(findForList.size() != 0) {
			String[] practice_ids = new String[findForList.size()];
			for (int i = 0; i < findForList.size(); i++) {
				practice_ids[i] = new String(findForList.get(i).getString("PRACTICE_ID"));
			}
			return practice_ids;
		}
		return null;
	}
	
	/**
	 * 通过ChapterId查找
	 * @param LessonId
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findByChapterId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("PracticeMapper.findByChapterId", pd);
	}
	
}

