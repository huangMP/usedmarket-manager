package com.fh.service.trainingmanage.lesson.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.trainingmanage.lesson.LessonManager;
import com.fh.service.trainingmanage.studydocument.StudyDocumentManager;
import com.fh.service.trainingmanage.video.VideoManager;

/** 
 * 说明： 课时管理
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
@Service("lessonService")
public class LessonService implements LessonManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="videoService")
	private VideoManager videoService;
	@Resource(name="studydocumentService")
	private StudyDocumentManager studydocumentService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("LessonMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		if(pd == null)
			return;
		String[] ArrayDATA_ID = new String[1];
		ArrayDATA_ID[0] = new String(pd.getString("LESSON_ID"));
		videoService.deleteByLessonIdArray(ArrayDATA_ID);
		studydocumentService.deleteByLessonIdArray(ArrayDATA_ID);
		dao.delete("LessonMapper.delete", pd);
	}
	
	/**删除 重载方法
	 * @param pd
	 * @throws Exception
	 */
	public void delete(List<PageData> pds)throws Exception{
		if(pds == null)
			return;
		
		String[] lesson_ids = new String[pds.size()];
		if(pds.size() != 0) {
			for (int i = 0; i < pds.size(); i++) {
				lesson_ids[i] = new String(pds.get(i).getString("LESSON_ID"));
			}
		}
		
		this.deleteAll(lesson_ids);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("LessonMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("LessonMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("LessonMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("LessonMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		if(ArrayDATA_IDS == null || ArrayDATA_IDS.length <=0)
			return;
		
		videoService.deleteByLessonIdArray(ArrayDATA_IDS);
		studydocumentService.deleteByLessonIdArray(ArrayDATA_IDS);
		dao.delete("LessonMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 通过ChapterIdArray查找
	 * @param LessonId
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String[] findByChapterIdArray(String[] ArrayDATA_IDS) throws Exception {
		List<PageData> findForList = (List<PageData>) dao.findForList("LessonMapper.findByChapterIdArray", ArrayDATA_IDS);
		if(findForList.size() != 0) {
			String[] lesson_ids = new String[findForList.size()];
			for (int i = 0; i < findForList.size(); i++) {
				lesson_ids[i] = new String(findForList.get(i).getString("LESSON_ID"));
			}
			return lesson_ids;
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
		return (List<PageData>)dao.findForList("LessonMapper.findByChapterId", pd);
	}
	
	/**
	 * 通过ChapterId查找
	 * @param LessonId
	 * @throws Exception
	 */
	public List<PageData> findLessonsByChapterId(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("LessonMapper.findLessonsByChapterId", pd);
	}
}

