package com.fh.service.trainingmanage.video.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.FileUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.service.trainingmanage.video.VideoManager;

/** 
 * 说明： 视频表
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
@Service("videoService")
public class VideoService implements VideoManager,ServletContextAware{

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
		dao.save("VideoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("VideoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("VideoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("VideoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("VideoMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("VideoMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("VideoMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 通过LessonId删除item
	 * @throws Exception
	 */
	public void deleteByLessonIdArray(String[] ArrayDATA_IDS) throws Exception {
		if(ArrayDATA_IDS != null) {
			this.deleteVideoByLessonIdArray(ArrayDATA_IDS);
			dao.delete("VideoMapper.deleteByLessonIdArray", ArrayDATA_IDS);
		}
	}
	
	/**
	 * 删除视频与文档
	 * @param id
	 * @throws Exception
	 */
	public void deleteVideoByLessonIdArray(String[] ArrayDATA_IDS) throws Exception {
		List<PageData> list = this.findByLessonIdArray(ArrayDATA_IDS);
		for (PageData pageData : list) {
			//删除视频
			if(pageData.getString("FILE_PATH")!=null){
				String realPath = servletContext.getRealPath("/")+pageData.get("FILE_PATH");
				FileUtil.delFile(realPath);
			}
			//删除图片
			if(pageData.get("IMG_PATH")!=null){
				String realPath = servletContext.getRealPath("/")+pageData.get("IMG_PATH");
				singleImgService.delete(realPath);
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
		return (List<PageData>) dao.findForList("VideoMapper.findByLessonIdArray", ArrayDATA_IDS);
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByLessonId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("VideoMapper.findByLessonId", pd);
	}
	
	
}

