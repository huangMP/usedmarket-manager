package com.fh.controller.app.frontpage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.PageBean;
import com.fh.service.pagemanage.businesstraining.BusinessTrainingManager;
import com.fh.service.pagemanage.document.DocumentManager;
import com.fh.util.PageData;

/**
 * 业务培训前台controller
 * @author WangZK
 *
 */
@Controller
@RequestMapping(value="/app_businesstraining")
public class AppBusinessTrainingController extends BaseController {

	@Resource(name="businesstrainingService")
	private BusinessTrainingManager businesstrainingService;
	
	/**
	 * 页面跳转
	 * 
	 */
	@RequestMapping(value="/goPage")
	public ModelAndView goLink(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("frontpage/demo/businesstraining_list");
		return mv;
	}
	
	/**
	 * 查找全部返回到前台页面（需要进行分页，每页14条）
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public @ResponseBody PageBean list(PageBean pageBean ,HttpServletRequest request) throws Exception{
		
		PageData pd = new PageData();
		pd = this.getPageData();
		pageBean.setPd(pd);
		List<PageData> varList = businesstrainingService.list(pageBean);	//列出Link列表
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		for(int i=0;i < varList.size();i++) {
			varList.get(i).put("IMG_PATH", basePath+varList.get(i).getString("IMG_PATH"));
			varList.get(i).put("ADDTIME", new SimpleDateFormat("yyyy/MM/dd").format(varList.get(i).get("ADDTIME")));
		}
		pageBean.setPds(varList);
		return pageBean;
	}
	
	/**去细阅页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail(HttpServletRequest request)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = businesstrainingService.findById(pd);	//根据ID读取
		pd.put("ADDTIME", new SimpleDateFormat("yyyy/MM/dd").format(pd.get("ADDTIME")));
		mv.setViewName("frontpage/BusinessGuidance/BusinessTraining_detail");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
