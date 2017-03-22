package com.fh.service.trainingmanage.paper.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.FileUtil;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.service.trainingmanage.paper.PaperManager;

/** 
 * 说明： 试卷表
 * 创建人：liangzhilin
 * 创建时间：2016-08-25
 * @version
 */
@Service("paperService")
public class PaperService implements PaperManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PaperMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		if( pd == null )
			return;
		//删除文件
		if(pd.getString("FILE_PATH")!=null){
			String realPath = PathUtil.getClasspath() + pd.getString("FILE_PATH");
			deleteDocxAndHtmlAndHtmlImg(realPath);
		}
		dao.delete("PaperMapper.delete", pd);
	}
	
	/**删除 重载方法
	 * @param pd
	 * @throws Exception
	 */
	public void delete(List<PageData> pds)throws Exception{
		if(pds == null)
			return;
		
		String[] paper_ids = new String[pds.size()];
		if(pds.size() != 0) {
			for (int i = 0; i < pds.size(); i++) {
				paper_ids[i] = new String(pds.get(i).getString("PAPER_ID"));
			}
		}
		
		this.deleteAll(paper_ids);
	}
	
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
	public void deleteDocxAndHtmlAndHtmlImg(String realPathAndName) throws Exception{
		//同时删除对应的docx文件
		FileUtil.delFile(realPathAndName);
		//同时删除对应的html文件
		String htmlRealPath = realPathAndName.replaceAll(".docx", ".html").replaceAll(".doc", ".html");
		FileUtil.delFile(htmlRealPath);
		//同时删除对应的img文件
		String htmlImgRealPath = realPathAndName.replaceAll(".docx", "").replaceAll(".doc", "");
		FileUtil.deleteFile(htmlImgRealPath);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PaperMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PaperMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PaperMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PaperMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		if(ArrayDATA_IDS == null || ArrayDATA_IDS.length <=0)
			return;
		//遍历要删除的数据的id
		for (String id : ArrayDATA_IDS) {
			PageData eachpd = new PageData();
			eachpd.put("PAPER_ID", id);
			//查询id所属的数据
			eachpd = this.findById(eachpd);
			//删除文件
			if(eachpd.getString("FILE_PATH")!=null){
				//获取文件的真实路径
				String realPath = PathUtil.getClasspath() + eachpd.getString("FILE_PATH");
				deleteDocxAndHtmlAndHtmlImg(realPath);
			}
		}
		dao.delete("PaperMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 查找试卷名称与id
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findPaperNamesAndID(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("PaperMapper.findPaperNamesAndID", pd);
	}
	
	/**
	 * 通过SPECIAL_ID查找item
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findBySpecialId(PageData specialId) throws Exception {
		return (List<PageData>) dao.findForList("PaperMapper.findBySpecialId", specialId);
	}
	
	/**
	 * 通过SPECIAL_ID数组查找item
	 */
	@SuppressWarnings("unchecked")
	public String[] findAllBySpecialIds(String[] ids) throws Exception {
		List<PageData> findForList = (List<PageData>) dao.findForList("PaperMapper.findAllBySpecialIds", ids);
		if(findForList.size() != 0) {
			String[] paper_ids = new String[findForList.size()];
			for (int i = 0; i < findForList.size(); i++) {
				paper_ids[i] = new String(findForList.get(i).getString("PAPER_ID"));
			}
			return paper_ids;
		}
		return null;
	}
	
}

