package com.fh.service.pagemanage.businesstraining.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.pagemanage.businesstraining.BusinessTrainingManager;

/** 
 * 说明： 业务培训
 * 创建人：liangzhilin
 * 创建时间：2016-08-18
 * @version
 */
@Service("businesstrainingService")
public class BusinessTrainingService implements BusinessTrainingManager{

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
		dao.save("BusinessTrainingMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BusinessTrainingMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("BusinessTrainingMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BusinessTrainingMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BusinessTrainingMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BusinessTrainingMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BusinessTrainingMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 置顶
	 */
	public void editMaxSort(PageData pd) throws Exception {
		pd = this.findById(pd);
		Integer sort = this.getMaxSort();
		if( (Integer)pd.get("SORT") != sort) {
			pd.put("SORT", sort+1);
			this.edit(pd);;	//根据ID读取
		}
	}
	
	/**
	 * 获取优先数最大的数
	 */
	public Integer getMaxSort() throws Exception {
		return (Integer)dao.findForObject("BusinessTrainingMapper.getMaxSort", null);
	}	
	
}

