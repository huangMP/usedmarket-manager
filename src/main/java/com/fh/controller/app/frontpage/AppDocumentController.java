package com.fh.controller.app.frontpage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.PageBean;
import com.fh.service.pagemanage.document.DocumentManager;
import com.fh.util.PageData;


/**
 * 
 * @author Peivxuan
 */
@RequestMapping(value="/app_doc")
@Controller
public class AppDocumentController extends BaseController {
	
	@Resource(name="documentService")
	private DocumentManager documentService;
	
	@RequestMapping("goSupportCenter")
	public String forword() {
		return "frontpage/demo/supportcenter";
	}
	
	@RequestMapping("goDocumentIntro")
	public String forword1() {
		return "frontpage/demo/docintro";
	}
	
	@RequestMapping("goLowAndStandard")
	public String forword2() {
		return "frontpage/demo/lowandstandard";
	}
	
	@RequestMapping("goBusinessManual")
	public String forword3() {
		return "frontpage/demo/businessmanual";
	}
	
	/**
	 * 获取文档正文
	 */
	@RequestMapping(value="/getDocText")
	@ResponseBody
	public ModelAndView getDocText(HttpServletResponse response, String id) throws Exception {
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("DOCUMENT_ID", id);
		PageData data = documentService.findById(pd);
		mv.setViewName("frontpage/text");
		mv.addObject("doc", data);
		int times = (Integer)data.get("BROWSING_TIMES");
		data.put("BROWSING_TIMES", times+1);
		documentService.edit(data);
		return mv;
	}
	
	/**
	 * 获取文档列表
	 */
	@RequestMapping(value="/getDocList")
	@ResponseBody
	public PageBean getDocList(HttpServletResponse response, String type, PageBean page) throws Exception {
		response.setContentType("text/html;charset=UTF-8");//一定要改编码
		PageData pd = new PageData();
		pd = this.getPageData();
		List<Integer> types = new ArrayList<Integer>();
		types.add(Integer.parseInt(type));
		pd.put("types", types);
		page.setPd(pd);
		List<PageData>	varList = documentService.list(page);	//列出Link列表
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy/MM/dd").format(varList.get(i).get("ADD_TIME")));
		}
		page.setPds(varList);
		return page;
	}
	

}
