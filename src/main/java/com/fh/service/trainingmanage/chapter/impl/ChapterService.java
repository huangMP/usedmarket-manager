package com.fh.service.trainingmanage.chapter.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.trainingmanage.chapter.ChapterManager;
import com.fh.service.trainingmanage.lesson.LessonManager;
import com.fh.service.trainingmanage.practice.PracticeManager;

/** 
 * 说明： 章节管理
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
@Service("chapterService")
public class ChapterService implements ChapterManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="lessonService")
	private LessonManager lessonService;
	@Resource(name="practiceService")
	private PracticeManager practiceService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ChapterMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		if(pd == null)
			return;
		//删除课时
		lessonService.delete(lessonService.findByChapterId(pd));
		//删除练习题
		practiceService.delete(practiceService.findByChapterId(pd));
		dao.delete("ChapterMapper.delete", pd);
	}
	
	/**删除 重载方法
	 * @param pd
	 * @throws Exception
	 */
	public void delete(List<PageData> pds)throws Exception{
		if(pds == null)
			return;
		
		String[] chapter_ids = new String[pds.size()];
		if(pds.size() != 0) {
			for (int i = 0; i < pds.size(); i++) {
				chapter_ids[i] = new String(pds.get(i).getString("CHAPTER_ID"));
			}
		}
		
		this.deleteAll(chapter_ids);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ChapterMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ChapterMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ChapterMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ChapterMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		if(ArrayDATA_IDS == null || ArrayDATA_IDS.length <=0)
			return;
		
		lessonService.deleteAll(lessonService.findByChapterIdArray(ArrayDATA_IDS));
		practiceService.deleteAll(practiceService.findByChapterIdArray(ArrayDATA_IDS));
		dao.delete("ChapterMapper.deleteAll", ArrayDATA_IDS);
	}

	/**通过id获取title属性的值
	 * @param CHAPTER_ID
	 * @throws Exception
	 */
	public String selectTitleById(String CHAPTER_ID) throws Exception {
		return (String)dao.findForObject("ChapterMapper.selectTitleById", CHAPTER_ID);
	}
	
	/**
	 * 通过SpecialId查找
	 * @param LessonId
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findBySpecialId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("ChapterMapper.findBySpecialId", pd);
	}
	
	/**
	 * 通过SpecialIdArray查找
	 * @param LessonId
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String[] findBySpecialIdArray(String[] ArrayDATA_IDS) throws Exception {
		List<PageData> findForList = (List<PageData>) dao.findForList("ChapterMapper.findBySpecialIdArray", ArrayDATA_IDS);
		if(findForList.size() != 0) {
			String[] chapter_ids = new String[findForList.size()];
			for (int i = 0; i < findForList.size(); i++) {
				chapter_ids[i] = new String(findForList.get(i).getString("CHAPTER_ID"));
			}
			return chapter_ids;
		}
		return null;
	}
	/**
	 * 通过SpecialId查找所属章节
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findChaptersBySpecialId(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ChapterMapper.findChaptersBySpecialId", pd);
	}
	
	
}

