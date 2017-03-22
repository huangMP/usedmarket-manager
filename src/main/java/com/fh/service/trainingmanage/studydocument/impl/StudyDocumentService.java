package com.fh.service.trainingmanage.studydocument.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.FileUtil;
import com.fh.util.PageData;
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.service.trainingmanage.studydocument.StudyDocumentManager;

/** 
 * 说明： 文档表
 * 创建人：liangzhilin
 * 创建时间：2016-08-25
 * @version
 */
@Service("studydocumentService")
public class StudyDocumentService implements StudyDocumentManager, ServletContextAware{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
	
	private ServletContext servletContext;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("StudyDocumentMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("StudyDocumentMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("StudyDocumentMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("StudyDocumentMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StudyDocumentMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StudyDocumentMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StudyDocumentMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 通过LessonId删除item
	 * @throws Exception
	 */
	public void deleteByLessonIdArray(String[] ArrayDATA_IDS) throws Exception {
		if( ArrayDATA_IDS != null ) {
			this.deleteDocByLessonIdArray(ArrayDATA_IDS);
			dao.delete("StudyDocumentMapper.deleteByLessonIdArray", ArrayDATA_IDS);
		}
	}
	
	/**
	 * 删除图片与文档
	 * @param id
	 * @throws Exception
	 */
	public void deleteDocByLessonIdArray(String[] ArrayDATA_IDS) throws Exception {
		List<PageData> list = this.findByLessonIdArray(ArrayDATA_IDS);
		for (PageData pageData : list) {
			//删除文件
			if(pageData.getString("FILE_PATH")!=null){
				//获取文件的真实路径
				String realPath = servletContext.getRealPath("/")+pageData.getString("FILE_PATH");
				//调用FileUtil的delFile方法删除文件
				FileUtil.delFile(realPath);
				
				//同时删除对应的html文件
				String htmlRealPath = realPath.replaceAll(".docx", ".html");
				FileUtil.delFile(htmlRealPath);
				//同时删除对应的img文件
				String htmlImgRealPath = realPath.replaceAll(".docx", "");
				FileUtil.deleteFile(htmlImgRealPath);
			}
		}
	}
	
	/**
	 * 通过LessonId查找
	 * @param LessonId
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findByLessonIdArray(String[] ArrayDATA_IDS) throws Exception {
		return (List<PageData>) dao.findForList("StudyDocumentMapper.findByLessonIdArray", ArrayDATA_IDS);
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	/**通过LESSON_ID获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByLessonId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StudyDocumentMapper.findByLessonId", pd);
	}
	
}

