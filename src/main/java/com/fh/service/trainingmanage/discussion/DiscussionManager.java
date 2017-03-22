package com.fh.service.trainingmanage.discussion;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 讨论区接口
 * 创建人：liangzhilin
 * 创建时间：2016-08-29
 * @version
 */
public interface DiscussionManager{

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
	 * 通过SPECIAL_ID删除item
	 */
	public void deleteBySpecialId(String specialId) throws Exception;
	
	/**
	 * 通过SPECIAL_IDS删除item
	 */
	public void deleteAllBySpecialIds(String[] ids) throws Exception;
	
	/**修改点赞数
	 * @param pd
	 * @throws Exception
	 */
	public void editNum(PageData pd)throws Exception;
}

