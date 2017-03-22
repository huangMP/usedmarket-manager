package com.fh.controller.makermanager.crowdfunding;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.makermanager.crowdfunding.CrowdfundingManager;
import com.fh.service.makermanager.picture_used_details.Picture_Used_DetailsManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：爱心众筹管理
 * 创建人：chengpeng
 * 创建时间：2017-03-21
 */
@Controller
@RequestMapping(value="/MakerBenevolenceCrowdfunding")
public class MakerBenevolenceCrowdfundingController extends BaseController {
	
	String menuUrl = "MakerBenevolenceCrowdfunding/list.do"; //菜单地址(权限用)
	@Resource(name="WebCrowdfundingService")
	private CrowdfundingManager crowdfundingService;

	/**
	 * notes start
	 *
	 * decription : 用于图片详情的增删改查
	 * @Author huangMP
	 */
	@Resource(name="picture_used_detailsService")
	private Picture_Used_DetailsManager picture_used_detailsService;
	/**
	 * notes end
	 */

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Crowdfunding");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("CROWDFUNDING_ID", this.get32UUID());	//主键
		pd.put("ADD_DATE" , new Date() );    // 设置添加时间
		pd.put("ADD_USER" , Jurisdiction.getUsername() );    // 设置添加人
		pd.put("HAS_DYNAMICS" , 2 );    // 设置 是否有动态：2，没有；1有
		pd.put("DYNAMICS_ID" , "" );    // 设置 动态id
		pd.put("CROWDFUNDING_TYPE" , 2 );    // 设置 类别(1.创意众筹 2.爱心众筹)
		crowdfundingService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Crowdfunding");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();

		picture_used_detailsService.deleteUsedDetailsAndPictureByContentId( pd.getString("CROWDFUNDING_ID") );

		crowdfundingService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Crowdfunding");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		crowdfundingService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Crowdfunding");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CROWDFUNDING_TYPE" , 2 );    // 筛选创意众筹 类别(1.创意众筹 2.爱心众筹)
		page.setPd(pd);
		List<PageData>	varList = crowdfundingService.list(page);	//列出Crowdfunding列表

		for(PageData var : varList){
			String contentId = (String) var.get("CROWDFUNDING_ID");
			List<PageData> pictureList = picture_used_detailsService.selectPicturesByContentId(contentId);
			var.put("pictureList" , pictureList );
		}

		mv.setViewName("makermanager/crowdfunding/benevolence/list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		/**
		 * notes start
		 *
		 * decription :         跳转到新增页面前，把先把主键new出来，并传到前台 (原来是在保存时才new出主键)，需要去保存那里删除主键
		 * @param
		 * @Author huangMP
		 */
		pd.put("CROWDFUNDING_ID", this.get32UUID());	//主键
		/**
 		* notes end
 		*/

		mv.setViewName("makermanager/crowdfunding/benevolence/edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = crowdfundingService.findById(pd);	//根据ID读取
		mv.setViewName("makermanager/crowdfunding/benevolence/edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Crowdfunding");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");

			for (String id:ArrayDATA_IDS ) {
				picture_used_detailsService.deleteUsedDetailsAndPictureByContentId(id);
			}

			crowdfundingService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
