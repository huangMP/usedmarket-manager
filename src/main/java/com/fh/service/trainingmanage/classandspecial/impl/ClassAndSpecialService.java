package com.fh.service.trainingmanage.classandspecial.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.trainingmanage.classandspecial.ClassAndSpecialManager;

/** 
 * 说明： 班级专题
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 * @version
 */
@Service("classandspecialService")
public class ClassAndSpecialService implements ClassAndSpecialManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ClassAndSpecialMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ClassAndSpecialMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ClassAndSpecialMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ClassAndSpecialMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ClassAndSpecialMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ClassAndSpecialMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ClassAndSpecialMapper.deleteAll", ArrayDATA_IDS);
	}

	/**已添加专题列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAddSpecial(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ClassAndSpecialMapper.listAddSpecialPage", page);
	}
	
	/**未添加专题列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listNotAddSpecial(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ClassAndSpecialMapper.listNotAddSpecialPage", page);
	}
	
}

