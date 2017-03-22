package com.fh.service.trainingmanage.lesson;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 课时管理接口
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
public interface LessonManager{

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
	
	/**
	 * 通过ChapterId查找
	 * @param LessonId
	 * @throws Exception
	 */
	public List<PageData> findLessonsByChapterId(PageData pd) throws Exception;
	
}

