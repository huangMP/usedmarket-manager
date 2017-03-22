package com.fh.service.pagemanage.documenttrends;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 档案动态接口
 * 创建人：liangzhilin
 * 创建时间：2016-08-18
 * @version
 */
public interface DocumentTrendsManager{

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
	 * 置顶
	 */
	public void editMaxSort(PageData pd) throws Exception;
	
	/**
	 * 获取优先数最大的数
	 */
	public Integer getMaxSort() throws Exception;
	
	/**
	 * 特殊展示列表
	 */
	public List<PageData> listSpecial(PageData pd) throws Exception;
	
	/**
	 * 获取SPECIAL的总数 
	 */
	public Integer getCountSpecial() throws Exception;
	
	
	/**修改特殊展示
	 * @param pd
	 * @throws Exception
	 */
	public void editSpecial(PageData pd)throws Exception;
}

