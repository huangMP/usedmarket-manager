package com.fh.service.trainingmanage.chapter;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 章节管理接口
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
public interface ChapterManager{

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
	
	/**删除
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

	/**通过id获取title属性的值
	 * @param CHAPTER_ID
	 * @throws Exception
	 */
	public String selectTitleById(String CHAPTER_ID)throws Exception;
	
	/**
	 * 通过SpecialId查找
	 * @param LessonId
	 * @throws Exception
	 */
	public List<PageData> findBySpecialId(PageData pd) throws Exception;
	
	/**
	 * 通过SpecialId查找所属章节
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findChaptersBySpecialId(PageData pd) throws Exception;
	
	/**
	 * 通过SpecialIdArray查找
	 * @param LessonId
	 * @throws Exception
	 */
	public String[] findBySpecialIdArray(String[] ArrayDATA_IDS) throws Exception;
	
	
}

