package com.fh.controller.pagemanage.documenttrends;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

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
import com.fh.service.pagemanage.document.DocumentManager;
import com.fh.service.pagemanage.documenttrends.DocumentTrendsManager;
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Tools;

/** 
 * 说明：档案动态
 * 创建人：liangzhilin
 * 创建时间：2016-08-18
 */
@Controller
@RequestMapping(value="/documenttrends")
public class DocumentTrendsController extends BaseController {
	
	String menuUrl = "documenttrends/list.do"; //菜单地址(权限用)
	@Resource(name="documenttrendsService")
	private DocumentTrendsManager documenttrendsService;
	@Resource(name="documentService")
	private DocumentManager documentService;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,HttpSession session,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="ORIGIN",required=false) String ORIGIN,
			@RequestParam(value="TEXT",required=false) String TEXT,
			@RequestParam(value="TYPE",required=false) int TYPE
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增DocumentTrends");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		String imageUrl = null;
		if(image!=null){
			if(image.getSize()>0){
	        String uploadPath ="/static/images";		
			String realUploadPath = session.getServletContext().getRealPath(uploadPath);
			imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
			session.removeAttribute("image");
			}
		}
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("IMG_PATH", imageUrl);
		pd.put("TITLE", TITLE);
		pd.put("ORIGIN", ORIGIN);
		pd.put("TEXT", TEXT);
		pd.put("TYPE", TYPE);
		pd.put("SPECIAL",0);
		pd.put("BROWSING_TIMES",0);
		pd.put("DOCUMENT_ID", this.get32UUID());	//主键
		pd.put("ADD_TIME", Tools.date2Str(new Date()));	//添加时间
		pd.put("ADD_USER",Jurisdiction.getUsername());
		documenttrendsService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除DocumentTrends");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = documenttrendsService.findById(pd);
		if(pd.get("IMG_PATH")!=null){
			String folderPath ="/images";		
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
			singleImgService.delete(realPath);
		}
		documenttrendsService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,HttpSession session,
			@RequestParam(value="imgChange",required=false) String imgChange,
			@RequestParam(value="DOCUMENT_ID",required=false) String DOCUMENT_ID,
			@RequestParam(value="TYPE",required=false) Integer TYPE,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="ORIGIN",required=false) String ORIGIN,
			@RequestParam(value="TEXT",required=false) String TEXT
			) throws Exception{
		
		
		
		logBefore(logger, Jurisdiction.getUsername()+"修改DocumentTrends");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("DOCUMENT_ID", DOCUMENT_ID);
		pd = documenttrendsService.findById(pd);//拿到原文档对象
		pd.put("TYPE", TYPE);
		pd.put("TITLE", TITLE);
		pd.put("ORIGIN", ORIGIN);
		pd.put("TEXT", TEXT);
		
		//图片更新
		String imageUrl = null;
		if(image!=null){
			if(image.getSize()>0){
		        String uploadPath ="/static/images";		
				String realUploadPath = session.getServletContext().getRealPath(uploadPath);
				imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
				pd.put("IMG_PATH", imageUrl);//覆盖
				session.removeAttribute("image");
			}else {
				if(imgChange!=null){//前台页面点击了重新选择图片，只是没有选图片
					pd.put("IMG_PATH", null);//覆盖
				}
			}
		}
		documentService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	

	/**修改特殊展示
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editSpecial")
	public ModelAndView editSpecial(@RequestParam(value="DOCUMENT_ID",required=false) String DOCUMENT_ID) throws Exception{
		
		logBefore(logger, Jurisdiction.getUsername()+"修改DocumentTrends");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println(DOCUMENT_ID);
		pd.put("DOCUMENT_ID", DOCUMENT_ID);
		pd = documenttrendsService.findById(pd);//拿到原文档对象
		
		pd.put("SPECIAL", 1);
		
		documenttrendsService.editSpecial(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除特殊展示
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/delSpecial")
	public ModelAndView delSpecial(
			@RequestParam(value="DOCUMENT_ID",required=false) String DOCUMENT_ID,
			HttpServletResponse response) throws Exception{
		
		logBefore(logger, Jurisdiction.getUsername()+"删除特殊展示DocumentTrends");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView(); 
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println(DOCUMENT_ID);
		pd.put("DOCUMENT_ID", DOCUMENT_ID);
		pd = documenttrendsService.findById(pd);//拿到原文档对象
		pd.put("SPECIAL", 0);
		documenttrendsService.editSpecial(pd);
		//mv.addObject("msg","success");
		
		List<PageData>	varList = documenttrendsService.listSpecial(pd);	//列出DocumentTrends列表
		
		mv.setViewName("pagemanage/documenttrends/documenttrends_special");
		mv.addObject("msg", "editSpecial");
		mv.addObject("varList", varList);
		return mv;
	}
	
	/**
	 * 置顶
	 */
	@RequestMapping(value="/setTop")
	public void setTop(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"置顶DocumentTrends");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		documenttrendsService.editMaxSort(pd);
		out.write("success");
		System.out.println("success");
		out.close();
	}
	
	/**
	 * 获取特殊展示总数
	 */
	@RequestMapping(value="/setSpecial")
	public void setSpecial(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"特殊展示DocumentTrends");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Integer specail = documenttrendsService.getCountSpecial();
		System.out.println(specail);
		JSONObject json =new JSONObject();
		json.put("specail", specail);
		//out.write("success");
		
		//设置格式为text/json    
	     response.setContentType("text/json"); 
	    //设置字符集为'UTF-8'
	    response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print(json);
		out.close();
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表DocumentTrends");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		//System.out.print(keywords);
		if(null != keywords && !"".equals(keywords) && !"all".equals(keywords)){
			pd.put("keywords", keywords.trim());
			
			//判断是否特殊展示
			if(Integer.parseInt(keywords)==7){
				//System.out.println(keywords);
				mv.addObject("sp", 1);
			}
		} else {
			/*对应业务的类型：
			 * 类型（1.领导班子、2.机构职能、3.查档服务指南、4.法规、5.标准、6.相关文件、7.工作动态、
             *     8.通知公告、9.他山之石、10.业务指南、11.电子档案、12.开放目录、13.利用实例）
			 * */
			List<Integer> types = new ArrayList<Integer>();
			types.add(7);
			pd.put("types", types);
			//System.out.println("excute");
			
			
		}
		page.setPd(pd);
		
		
		List<PageData>	varList = documenttrendsService.list(page);	//列出DocumentTrends列表
		
		/*
		 * 在列表中将正文内容长度超过15的只显示15个字符
		 */
		Pattern p_space = Pattern.compile(Const.REGEX_SPACE, Pattern.CASE_INSENSITIVE);  
		Pattern p_html = Pattern.compile(Const.REGEX_HTML, Pattern.CASE_INSENSITIVE);  
		for(int i = 0; i < varList.size();i++ ) {
			String htmlStr = varList.get(i).getString("TEXT");
			Matcher m_html = p_html.matcher(htmlStr);  
			htmlStr = m_html.replaceAll(""); // 过滤html标签 
			Matcher m_space = p_space.matcher(htmlStr);  
			htmlStr = m_space.replaceAll("").trim(); // 过滤空格回车标签
			
			htmlStr = htmlStr.replaceAll("&nbsp;","");
			
			if(htmlStr.length()>15)
			{
				String text = htmlStr.substring(0, 15)+"......";
				//System.out.println(text);
				varList.get(i).put("TEXT", text);
			}
		}
		
		
		mv.setViewName("pagemanage/documenttrends/documenttrends_list");
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
		mv.setViewName("pagemanage/documenttrends/documenttrends_edit");
		mv.addObject("choice", 0);
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
		pd = documenttrendsService.findById(pd);	//根据ID读取
		mv.setViewName("pagemanage/documenttrends/documenttrends_edit");
		mv.addObject("choice", 1);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去细阅页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetails")
	public ModelAndView goDetails()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = documenttrendsService.findById(pd);	//根据ID读取
		mv.setViewName("pagemanage/documenttrends/documenttrends_detail");
		mv.addObject("choice", -1);
		
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去特殊展示页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goSpecial")
	public ModelAndView goSpecial(HttpServletResponse response)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = documenttrendsService.findById(pd);	//根据ID读取
		if(pd.getString("IMG_PATH")==null){
			mv.setViewName("pagemanage/documenttrends/documenttrends_add_img");
			mv.addObject("msg", "goAddImg");
			mv.addObject("pd", pd);
		}else{

			List<PageData>	varList = documenttrendsService.listSpecial(pd);	//列出DocumentTrends列表
			
			
			mv.setViewName("pagemanage/documenttrends/documenttrends_special");
			mv.addObject("msg", "editSpecial");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		}
		
		mv.addObject("choice", 1);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}	
	
	/**去添加图片页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddImg")
	public ModelAndView goAddImg(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,HttpSession session,
			@RequestParam(value="imgChange",required=false) String imgChange
			)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("SPECIAL", 0);
		
		pd = documenttrendsService.findById(pd);	//根据ID读取
		//System.out.println(pd.getString("IMG_PATH"));
		
		//图片更新
		String imageUrl = null;
		if(image.getSize()>0){
	        String uploadPath ="/static/images";		
			String realUploadPath = session.getServletContext().getRealPath(uploadPath);
			imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
			pd.put("IMG_PATH", imageUrl);//覆盖
			session.removeAttribute("image");
		}else {
			System.out.println(imgChange);
			if(imgChange!=null){//前台页面点击了重新选择图片，只是没有选图片
				pd.put("IMG_PATH", null);//覆盖
			}
		}
		documenttrendsService.editSpecial(pd);
		
		List<PageData>	varList = documenttrendsService.listSpecial(pd);	//列出DocumentTrends列表
		
		mv.addObject("varList", varList);
		
		mv.setViewName("pagemanage/documenttrends/documenttrends_special");
		mv.addObject("choice", 1);
		mv.addObject("msg", "editSpecial");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除DocumentTrends");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			
			
			documenttrendsService.deleteAll(ArrayDATA_IDS);
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
