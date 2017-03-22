package com.fh.service.trainingmanage.userandspecial.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.trainingmanage.userandspecial.UserAndSpecialManager;

/** 
 * 说明： 人员专题
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
@Service("userandspecialService")
public class UserAndSpecialService implements UserAndSpecialManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("UserAndSpecialMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("UserAndSpecialMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("UserAndSpecialMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("UserAndSpecialMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("UserAndSpecialMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserAndSpecialMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("UserAndSpecialMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 通过USER_ID
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findByUserId(Page page)throws Exception{
		return (List<PageData>)dao.findForList("UserAndSpecialMapper.datalistPageByUserId", page);
	}

	/**
	 * 通过USER_ID和SPECIAL_ID查询
	 */
	public PageData findByUserIdAndSpecialId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserAndSpecialMapper.findByUserIdAndSpecialId", pd);
	}
	
	
}

