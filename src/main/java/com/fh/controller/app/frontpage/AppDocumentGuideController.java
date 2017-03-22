package com.fh.controller.app.frontpage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;



import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.PageBean;
import com.fh.service.pagemanage.document.DocumentManager;
import com.fh.util.PageData;

/**
 * 查档服务指南前台controller
 * @author WangZK
 *
 */
@Controller
@RequestMapping(value="/app_documentguide")
public class AppDocumentGuideController extends BaseController {

	@Resource(name="documentService")
	private DocumentManager documentService;
	
	/**
	 * 页面跳转
	 * 
	 */
	@RequestMapping(value="/goPage")
	public ModelAndView goLink(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("frontpage/demo/documentguide_list");
		return mv;
	}
	
	/**
	 * 查找全部返回到前台页面（需要进行分页，每页14条）
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public @ResponseBody PageBean list(String type,PageBean pageBean) throws Exception{
		
		PageData pd = new PageData();
		pd = this.getPageData();
		List<Integer> types = new ArrayList<Integer>();
		types.add(Integer.parseInt(type));
		pd.put("types", types);
		pageBean.setPd(pd);
		List<PageData> varList = documentService.list(pageBean);	//列出Link列表
		for(int i=0;i < varList.size();i++) {
			varList.get(i).put("ADD_TIME", new SimpleDateFormat("yyyy/MM/dd").format(varList.get(i).get("ADD_TIME")));
		}
		pageBean.setPds(varList);
		return pageBean;
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
		pd = documentService.findById(pd);	//根据ID读取
		Integer temp = (Integer) pd.get("BROWSING_TIMES");
		pd.put("BROWSING_TIMES",temp+1);
		documentService.edit(pd);
		pd.put("ADD_TIME", new SimpleDateFormat("yyyy/MM/dd").format(pd.get("ADD_TIME")));
		mv.setViewName("frontpage/demo/documentguide_detail");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
