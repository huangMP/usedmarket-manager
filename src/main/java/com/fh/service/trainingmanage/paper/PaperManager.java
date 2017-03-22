package com.fh.service.trainingmanage.paper;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.FileUtil;
import com.fh.util.PageData;

/** 
 * 说明： 试卷表接口
 * 创建人：liangzhilin
 * 创建时间：2016-08-25
 * @version
 */
public interface PaperManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**删除 重载方法
	 * @param pd
	 * @throws Exception
	 */
	public void delete(List<PageData> pds)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**查找试卷名称与id
	 * @throws Exception
	 */
	public List<PageData> findPaperNamesAndID(PageData pd) throws Exception;
	
	/**
	 * 通过SPECIAL_ID删除item
	 */
	public List<PageData> findBySpecialId(PageData pd) throws Exception;
	
	/**
	 * 通过SPECIAL_ID数组批量删除item
	 */
	public String[] findAllBySpecialIds(String[] ids) throws Exception;
	
	/**
	 * 删除docx和html
	 *  
	 * docx和html和htmlImg放在同一个目录下
	 * 且命名有如下规律：
	 * mmmm.docx	docx文件
	 * mmmm.html	html文件
	 * mmmm			htmlImg文件夹
	 * 
	 * @param realPathAndName docx真实路径+文件名+后缀
	 * @throws Exception
	 * @author  huangMP
	 * @date    2016年8月29日
	 */
	public void deleteDocxAndHtmlAndHtmlImg(String realPathAndName) throws Exception;
	
}

