package com.fh.service.pagemanage.documenttrends.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.pagemanage.documenttrends.DocumentTrendsManager;

/** 
 * 说明： 档案动态
 * 创建人：liangzhilin
 * 创建时间：2016-08-18
 * @version
 */
@Service("documenttrendsService")
public class DocumentTrendsService implements DocumentTrendsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		Integer sort = this.getMaxSort();
		if(sort != null)
			pd.put("SORT", sort+1);
		else 
			pd.put("SORT", 1);
		dao.save("DocumentTrendsMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("DocumentTrendsMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("DocumentTrendsMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("DocumentTrendsMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DocumentTrendsMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DocumentTrendsMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("DocumentTrendsMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 置顶
	 */
	public void editMaxSort(PageData pd) throws Exception {
		pd = this.findById(pd);
		Integer sort = this.getMaxSort();
		if((Integer) pd.get("SORT") != sort) {
			pd.put("SORT", sort+1);
			this.edit(pd);;	//根据ID读取
		}
	}
	
	/**
	 * 获取优先数最大的数
	 */
	public Integer getMaxSort() throws Exception {
		return (Integer)dao.findForObject("DocumentTrendsMapper.getMaxSort", null);
	}

	/**
	 * 特殊展示列表
	 */
	public List<PageData> listSpecial(PageData pd) throws Exception {
		
		return (List<PageData>)dao.findForList("DocumentTrendsMapper.listSpecial", pd);
	}

	/**
	 * 获取SPECIAL的总数 
	 */
	public Integer getCountSpecial() throws Exception {
		return (Integer)dao.findForObject("DocumentTrendsMapper.getCountSpecial", null);
	}

	/**修改特殊展示
	 * @param pd
	 * @throws Exception
	 */
	public void editSpecial(PageData pd) throws Exception {
		dao.update("DocumentTrendsMapper.editSpecial", pd);
		
	}	
	
	
}

