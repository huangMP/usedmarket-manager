package com.fh.service.pagemanage.exhibition.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.pagemanage.exhibition.ExhibitionManager;

/** 
 * 说明： 网上展厅
 * 创建人：liangzhilin
 * 创建时间：2016-08-19
 * @version
 */
@Service("exhibitionService")
public class ExhibitionService implements ExhibitionManager{

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
		dao.save("ExhibitionMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ExhibitionMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ExhibitionMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ExhibitionMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ExhibitionMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ExhibitionMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ExhibitionMapper.deleteAll", ArrayDATA_IDS);
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
		return (Integer)dao.findForObject("ExhibitionMapper.getMaxSort", null);
	}	
	
}

