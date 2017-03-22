package com.fh.service.trainingmanage.special.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.trainingmanage.chapter.ChapterManager;
import com.fh.service.trainingmanage.paper.PaperManager;
import com.fh.service.trainingmanage.special.SpecialManager;

/** 
 * 说明： 专题管理
 * 创建人：peixuan
 * 创建时间：2016-08-24
 * @version
 */
@Service("specialService")
public class SpecialService implements SpecialManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="chapterService")
	private ChapterManager chapterService;
	@Resource(name="paperService")
	private PaperManager paperService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("SpecialMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		if(pd == null)
			return;
		//删除站内推荐
		dao.delete("InsiderecommendedMapper.deleteBySpecialId", pd.getString("SPECIAL_ID"));
		//删除试卷
		paperService.delete(paperService.findBySpecialId(pd));
		//删除章节
		chapterService.delete(chapterService.findBySpecialId(pd));
		//删除讨论区
		dao.delete("DiscussionMapper.deleteBySpecialId", pd.getString("SPECIAL_ID"));
		//删除人员与专题
		dao.delete("UserAndSpecialMapper.deleteBySpecialId", pd.getString("SPECIAL_ID"));
		//删除班级与专题
		dao.delete("ClassAndSpecialMapper.deleteBySpecialId", pd.getString("SPECIAL_ID"));
		//删除专题
		dao.delete("SpecialMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("SpecialMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SpecialMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SpecialMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SpecialMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		if(ArrayDATA_IDS == null || ArrayDATA_IDS.length <=0)
			return;
		
		chapterService.deleteAll(chapterService.findBySpecialIdArray(ArrayDATA_IDS));
		dao.delete("InsiderecommendedMapper.deleteAllBySpecialIds", ArrayDATA_IDS);
		paperService.deleteAll(paperService.findAllBySpecialIds(ArrayDATA_IDS));
		dao.delete("DiscussionMapper.deleteAllBySpecialIds", ArrayDATA_IDS);
		//删除人员与专题
		dao.delete("UserAndSpecialMapper.deleteAllBySpecialIds", ArrayDATA_IDS);
		//删除班级与专题
		dao.delete("ClassAndSpecialMapper.deleteAllBySpecialIds", ArrayDATA_IDS);
		dao.delete("SpecialMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 查找专题名称
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findTitle()throws Exception{
		return (List<PageData>)dao.findForList("SpecialMapper.findTitle", null);
	}
	
	/**
	 * 将 ORIGINAL_PAPER置为空
	 */
	public void editOriginalPaperToNull(String[] ArrayDATA_IDS)throws Exception{
		if(ArrayDATA_IDS == null || ArrayDATA_IDS.length <=0)
			return;
		dao.update("SpecialMapper.editOriginalPaperToNull", ArrayDATA_IDS);
	}
	
	/**
	 * 将 AnotherPaper置为空
	 */
	public void editAnotherPaperToNull(String[] ArrayDATA_IDS)throws Exception{
		if(ArrayDATA_IDS == null || ArrayDATA_IDS.length <=0)
			return;
		dao.update("SpecialMapper.editAnotherPaperToNull", ArrayDATA_IDS);
	}
	
}

