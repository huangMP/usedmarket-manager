package com.fh.controller.trainingmanage.lowandstandard;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.service.trainingmanage.lowandstandard.LowandstandardManager;

/** 
 * 说明：政策与标准
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/lowandstandard")
public class LowandstandardController extends BaseController {
	
	String menuUrl = "lowandstandard/list.do"; //菜单地址(权限用)
	@Resource(name="lowandstandardService")
	private LowandstandardManager lowandstandardService;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,
			HttpServletRequest request,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="TEXT",required=false) String TEXT
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Lowandstandard");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String imageUrl = null;
		if(image.getSize()>0){
	        String uploadPath ="/static/images";		
			String realUploadPath = request.getSession().getServletContext().getRealPath(uploadPath);
			imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
			request.getSession().removeAttribute("image");
		}
		pd.put("TITLE",TITLE);
		pd.put("TEXT", TEXT);
		pd.put("IMG_PATH", imageUrl);
		pd.put("LOWANDSTANDARD_ID", this.get32UUID());	//主键
		pd.put("ADD_USER", Jurisdiction.getUsername());	//添加人
		pd.put("ADD_TIME", new Date());					//添加时间
		lowandstandardService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Lowandstandard");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		//查找要删除的数据
		pd = lowandstandardService.findById(pd);
		//删除图片
		if(pd.get("IMG_PATH")!=null){
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
			System.out.println(realPath);
			singleImgService.delete(realPath);
		}
		
		lowandstandardService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,HttpServletRequest request,
			@RequestParam(value="LOWANDSTANDARD_ID",required=false) String LOWANDSTANDARD_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="imgChange",required=false) String imgChange,
			@RequestParam(value="TEXT",required=false) String TEXT,
			@RequestParam(value="ADD_TIME",required=false) Date ADD_TIME,
			@RequestParam(value="ADD_USER",required=false) String ADD_USER,
			@RequestParam(value="SORT",required=false) Integer SORT
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Lowandstandard");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("LOWANDSTANDARD_ID", LOWANDSTANDARD_ID);
		pd = lowandstandardService.findById(pd);//拿到原文档对象
		
		//图片更新
		String imageUrl = null;
		if(image!=null){
			//删除原来的图片
			if(pd.get("IMG_PATH")!=null){
				String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
				System.out.println(realPath);
				singleImgService.delete(realPath);
			}
			
	        String uploadPath ="/static/images";		
			String realUploadPath = request.getSession().getServletContext().getRealPath(uploadPath);
			imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
			pd.put("IMG_PATH", imageUrl);//覆盖
			request.getSession().removeAttribute("image");
		}else {
			if(imgChange!=null){//前台页面点击了重新选择图片，只是没有选图片
				pd.put("IMG_PATH", null);//覆盖
			}
		}
		pd.put("TITLE", TITLE);
		pd.put("TEXT", TEXT);
		
		lowandstandardService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Lowandstandard");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = lowandstandardService.list(page);	//列出Lowandstandard列表
		
		/*
		 * 在列表中将正文内容长度超过15的只显示15个字符
		 */
		for(int i = 0; i < varList.size();i++ ) {
			if(varList.get(i).getString("TEXT")!=null && varList.get(i).getString("TEXT")!=""){
				if(varList.get(i).getString("TEXT").length()>15)
				{
					String text = varList.get(i).getString("TEXT").substring(0, 15)+"......";
					//System.out.println(text);
					varList.get(i).put("TEXT", text);
				}
			}
		}
		
		mv.setViewName("trainingmanage/lowandstandard/lowandstandard_list");
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
		mv.setViewName("trainingmanage/lowandstandard/lowandstandard_edit");
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
		pd = lowandstandardService.findById(pd);	//根据ID读取
		mv.setViewName("trainingmanage/lowandstandard/lowandstandard_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Lowandstandard");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		System.out.println(DATA_IDS);
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for (String id : ArrayDATA_IDS) {
				PageData eachpd = new PageData();
				eachpd.put("LOWANDSTANDARD_ID", id);
				eachpd = lowandstandardService.findById(eachpd);
				if(eachpd.getString("IMG_PATH") != null){
					System.out.println(eachpd.getString("IMG_PATH"));
					String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+eachpd.getString("IMG_PATH");
					System.out.println(realPath);
					singleImgService.delete(realPath);
				}
			}
			lowandstandardService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 去细阅页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println(pd);
		pd = lowandstandardService.findById(pd);	//根据ID读取
		mv.setViewName("trainingmanage/lowandstandard/lowandstandard_detail");
		mv.addObject("msg", "detail");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 置顶
	 */
	@RequestMapping(value="/setTop")
	public void setTop(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"置顶Lowandstandard");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		lowandstandardService.editMaxSort(pd);
		out.write("success");
		out.close();
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Lowandstandard到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("正文");	//1
		titles.add("图片路径");	//2
		titles.add("标题");	//3
		titles.add("优先数");	//4
		titles.add("添加人");	//5
		titles.add("添加时间");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = lowandstandardService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TEXT"));	//1
			vpd.put("var2", varOList.get(i).getString("IMG_PATH"));	//2
			vpd.put("var3", varOList.get(i).getString("TITLE"));	//3
			vpd.put("var4", varOList.get(i).get("SORT").toString());	//4
			vpd.put("var5", varOList.get(i).getString("ADD_USER"));	//5
			vpd.put("var6", varOList.get(i).getString("ADD_TIME"));	//6
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
