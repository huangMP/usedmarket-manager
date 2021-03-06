package com.fh.service.trainingmanage.homepagepics.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.trainingmanage.homepagepics.HomepagepicsManager;

/** 
 * 说明： 首页轮播图
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
@Service("homepagepicsService")
public class HomepagepicsService implements HomepagepicsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("HomepagepicsMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("HomepagepicsMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("HomepagepicsMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("HomepagepicsMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("HomepagepicsMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HomepagepicsMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("HomepagepicsMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 获取优先数最大的数
	 */
	public Integer getMaxSort() throws Exception {
		Integer maxSort = (Integer)dao.findForObject("HomepagepicsMapper.getMaxSort", null);
		if( null == maxSort ){
			return 0;
		}
		return maxSort;
	}
	
	/**
	 * 置顶
	 */
	public PageData setTop(PageData pd) throws Exception{
		int maxSort = getMaxSort();
		int currentSort = (Integer) pd.get("SORT");
		if( maxSort != currentSort){
			pd.put("SORT", maxSort+1);
		}
		return pd;
	}
	
}

