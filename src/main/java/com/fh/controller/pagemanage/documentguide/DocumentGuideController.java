package com.fh.controller.pagemanage.documentguide;

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

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.pagemanage.document.DocumentManager;

/** 
 * 说明：查档服务指南
 * 创建人：chengpeng
 * 创建时间：2016-08-16
 */
@Controller
@RequestMapping(value="/documentguide")
public class DocumentGuideController extends BaseController {
	
	String menuUrl = "documentguide/list.do"; //菜单地址(权限用)
	@Resource(name="documentService")
	private DocumentManager documentService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增DocumentGuide");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ADD_TIME", new Date());
		pd.put("ADD_USER", Jurisdiction.getUsername());
		pd.put("BROWSING_TIMES", 0);
		pd.put("TYPE", 3);
		pd.put("DOCUMENT_ID", this.get32UUID());	//主键
		documentService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除DocumentGuide");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		documentService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改DocumentGuide");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		documentService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表DocumentGuide");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/*对应业务的类型：
		 * 类型（1.领导班子、2.机构职能、3.查档服务指南、4.法规、5.标准、6.相关文件、7.工作动态、
         *     8.通知公告、9.他山之石、10.业务指南、11.电子档案、12.开放目录、13.利用实例）
		 * 
		 */
		List<Integer> types = new ArrayList<Integer>();
		types.add(3);
		pd.put("types", types);
		//System.out.println("excute");
		page.setPd(pd);
		List<PageData>	varList = documentService.list(page);	//列出DocumentGuide列表
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
		mv.setViewName("pagemanage/documentguide/documentguide_list");
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
		mv.setViewName("pagemanage/documentguide/documentguide_edit");
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
		pd = documentService.findById(pd);	//根据ID读取
		mv.setViewName("pagemanage/documentguide/documentguide_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去细阅页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println(pd);
		pd = documentService.findById(pd);	//根据ID读取
		mv.setViewName("pagemanage/documentguide/documentguide_detail");
		mv.addObject("msg", "detail");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 置顶
	 */
	@RequestMapping(value="/setTop")
	public void setTop(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"置顶DocumentGuide");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		documentService.editMaxSort(pd);
		out.write("success");
		out.close();
	}

	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除DocumentGuide");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			documentService.deleteAll(ArrayDATA_IDS);
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
