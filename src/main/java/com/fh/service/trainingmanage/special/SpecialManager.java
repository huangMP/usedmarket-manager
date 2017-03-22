package com.fh.service.trainingmanage.special;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 专题管理接口
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
public interface SpecialManager{

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
	 * 查找专题名称
	 */
	public List<PageData> findTitle()throws Exception;
	
	/**
	 * 将 ORIGINAL_PAPER置为空
	 */
	public void editOriginalPaperToNull(String[] ArrayDATA_IDS)throws Exception;
	
	/**
	 * 将 AnotherPaper置为空
	 */
	public void editAnotherPaperToNull(String[] ArrayDATA_IDS)throws Exception;
	
}

