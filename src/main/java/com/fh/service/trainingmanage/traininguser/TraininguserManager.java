package com.fh.service.trainingmanage.traininguser;

import java.util.List;

import com.fh.entity.Page;
import com.fh.service.system.appuser.AppuserManager;
import com.fh.util.PageData;

/** 
 * 说明： 培训用户接口
 * 创建人：chunc
 * 创建时间：2016-08-25
 * @version
 */
public interface TraininguserManager extends AppuserManager{

	/**
	 * 获取username最大值
	 */
	public PageData getAppUserNameMax() throws Exception;
	
	/**学员列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listAddClass(Page page)throws Exception;
	
	/**学员列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listNotAddClass(Page page) throws Exception;

	/**添加班级 -- bz
	 * @param pd
	 * @throws Exception
	 */
	public void editBz(PageData pd)throws Exception;
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByNameAndPwd(PageData pd)throws Exception;
	
	/**修改登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLogin(PageData pd)throws Exception;
	
	/**修改密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePassword(PageData pd)throws Exception;
}
