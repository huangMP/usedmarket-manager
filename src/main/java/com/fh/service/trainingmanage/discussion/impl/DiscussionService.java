package com.fh.service.trainingmanage.discussion.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.trainingmanage.discussion.DiscussionManager;

/** 
 * 说明： 讨论区
 * 创建人：liangzhilin
 * 创建时间：2016-08-29
 * @version
 */
@Service("discussionService")
public class DiscussionService implements DiscussionManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("DiscussionMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("DiscussionMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("DiscussionMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("DiscussionMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DiscussionMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DiscussionMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("DiscussionMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 通过SPECIAL_ID删除item
	 */
	public void deleteBySpecialId(String specialId) throws Exception {
		dao.delete("DiscussionMapper.deleteBySpecialId", specialId);
	}
	
	/**
	 * 通过SPECIAL_IDS删除item
	 */
	public void deleteAllBySpecialIds(String[] ids) throws Exception {
		dao.delete("DiscussionMapper.deleteBySpecialId", ids);
	}
	
	/**修改点赞数
	 * @param pd
	 * @throws Exception
	 */
	public void editNum(PageData pd)throws Exception{
		dao.update("DiscussionMapper.editNum", pd);
	}
	
}

