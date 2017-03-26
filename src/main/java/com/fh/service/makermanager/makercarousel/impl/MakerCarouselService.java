package com.fh.service.makermanager.makercarousel.impl;

import java.util.List;
import javax.annotation.Resource;

import com.fh.util.Const;
import com.fh.util.PathUtil;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.makermanager.makercarousel.MakerCarouselManager;

/** 
 * 说明： 首页图片管理
 * 创建人：chengpeng
 * 创建时间：2017-03-25
 * @version
 */
@Service("makercarouselService")
public class MakerCarouselService implements MakerCarouselManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("MakerCarouselMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("MakerCarouselMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("MakerCarouselMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MakerCarouselMapper.datalistPage", page);
	}

	/**列表
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> selectTop5() throws Exception{
		List<PageData> pd = (List<PageData>)dao.findForList("MakerCarouselMapper.selectTop5", null);
		for ( PageData var : pd) {
			List<PageData> IMG_PD = (List<PageData>)dao.findForList("Picture_Used_DetailsMapper.selectPicturesByContentId", var.getString("CAROUSEL_ID"));
			String IMG_PATH = IMG_PD.get(0).getString("PATH");
			var.put("IMG_PATH", PathUtil.getClasspath() + Const.FILEPATHIMG + IMG_PATH);
		}
		return pd;
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MakerCarouselMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MakerCarouselMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MakerCarouselMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

