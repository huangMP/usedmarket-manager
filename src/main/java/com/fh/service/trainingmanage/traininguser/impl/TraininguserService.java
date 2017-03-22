package com.fh.service.trainingmanage.traininguser.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.system.appuser.impl.AppuserService;
import com.fh.service.trainingmanage.traininguser.TraininguserManager;
import com.fh.util.PageData;

/** 
 * 说明： 培训用户表
 * 创建人：shunc
 * 创建时间：2016-08-25
 * @version
 */
@Service("traininguserService")
public class TraininguserService extends AppuserService implements TraininguserManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取username最大值
	 */
	public PageData getAppUserNameMax() throws Exception {
		
		return (PageData) dao.findForObject("TraininguserMapper.getAppUserNameMax", null);
	}

	/**学员列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listAddClass(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TraininguserMapper.listAddClassPage", page);
	}
	
	/**学员列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listNotAddClass(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TraininguserMapper.listNotAddClassPage", page);
	}
	
	/**添加班级 -- bz
	 * @param pd
	 * @throws Exception
	 */
	public void editBz(PageData pd)throws Exception{
		dao.update("TraininguserMapper.editBz", pd);
	}
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TraininguserMapper.getUserInfo", pd);
	}
	
	/**修改登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("TraininguserMapper.updateLastLogin", pd);
	}
	
	/**修改密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePassword(PageData pd)throws Exception{
		dao.update("TraininguserMapper.updatePassword", pd);
	}

}
