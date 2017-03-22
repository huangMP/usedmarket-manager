package com.fh.service.trainingmanage.lowandstandard.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.trainingmanage.lowandstandard.LowandstandardManager;

/** 
 * 说明： 政策与标准
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
@Service("lowandstandardService")
public class LowandstandardService implements LowandstandardManager{

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
		dao.save("LowandstandardMapper.save", pd);
	}
	
	/**
	 * 获取最大的优先数
	 * @return
	 * @throws Exception
	 */
	public Integer getMaxSort() throws Exception {
		return (Integer)dao.findForObject("LowandstandardMapper.getMaxSort", null);
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
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("LowandstandardMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("LowandstandardMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("LowandstandardMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("LowandstandardMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("LowandstandardMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("LowandstandardMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

