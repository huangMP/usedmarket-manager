package com.fh.service.information.pictures.impl;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.information.pictures.PicturesManager;
import com.fh.util.Const;
import com.fh.util.DelAllFile;
import com.fh.util.PageData;
import com.fh.util.PathUtil;


/** 图片管理
 * @author liangzhilin
 * 修改时间：2015.11.2
 */
@Service("picturesService")
public class PicturesService implements PicturesManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PicturesMapper.datalistPage", page);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PicturesMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PicturesMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PicturesMapper.edit", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PicturesMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PicturesMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**批量获取
	 * @param ArrayDATA_IDS
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getAllById(String[] ArrayDATA_IDS)throws Exception{
		return (List<PageData>)dao.findForList("PicturesMapper.getAllById", ArrayDATA_IDS);
	}
	
	/**删除图片
	 * @param pd
	 * @throws Exception
	 */
	public void delTp(PageData pd)throws Exception{
		dao.update("PicturesMapper.delTp", pd);
	}
	
	/**通过图片的缩略图路径，删除图片和缩略图,并删除磁盘上的图片和缩略图
	 * @param path 缩略图路径
	 * @throws Exception
	 */
	public void delTpByPath(String path)throws Exception{						
		String originalPATH = path.replaceAll("_.jpg", ".jpg")
				.replaceAll("_.png", ".png")
				.replaceAll("_.gif", ".gif")
				.replaceAll("_.jpeg", ".jpeg")
				.replaceAll("_.bmp", ".bmp");    //原图片路径
		DelAllFile.delFolder( path ); 	           //删除缩略图
		DelAllFile.delFolder( originalPATH ); 	   //删除原图
		dao.update("PicturesMapper.delTpByPath", path);                                          //删除tb_picture表中的信息
	}
	
}

