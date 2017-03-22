package com.fh.service.trainingmanage.video;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.FileUtil;
import com.fh.util.PageData;

/** 
 * 说明： 视频表接口
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
public interface VideoManager{

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
	 * 通过LessonId删除item
	 * @throws Exception
	 */
	public void deleteByLessonIdArray(String[] ArrayDATA_IDS) throws Exception;
	
	/**
	 * 删除视频与图片
	 * @param id
	 * @throws Exception
	 */
	public void deleteVideoByLessonIdArray(String[] ArrayDATA_IDS) throws Exception;
	
	/**
	 * 通过LessonId查找
	 * @param LessonId
	 * @throws Exception
	 */
	public List<PageData> findByLessonIdArray(String[] ArrayDATA_IDS) throws Exception;
	
	/**
	 * 通过LESSON_ID查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByLessonId(PageData pd)throws Exception;
	
}

