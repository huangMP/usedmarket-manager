package com.fh.service.pagemanage.photoalbum.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.pagemanage.photoalbum.PhotoAlbumManager;

/** 
 * 说明： 图集介绍
 * 创建人：liangzhilin
 * 创建时间：2016-08-18
 * @version
 */
@Service("photoalbumService")
public class PhotoAlbumService implements PhotoAlbumManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PhotoAlbumMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PhotoAlbumMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PhotoAlbumMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PhotoAlbumMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PhotoAlbumMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PhotoAlbumMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PhotoAlbumMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 获取优先数最大的数
	 */
	public Integer getMaxSort() throws Exception {
		Integer maxSort = (Integer)dao.findForObject("PhotoAlbumMapper.getMaxSort", null);
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

