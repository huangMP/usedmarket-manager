package com.fh.controller.trainingmanage.userandspecial;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.service.trainingmanage.traininguser.TraininguserManager;
import com.fh.service.trainingmanage.userandspecial.UserAndSpecialManager;

/** 
 * 说明：人员专题
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/userandspecial")
public class UserAndSpecialController extends BaseController {
	
	String menuUrl = "userandspecial/list.do"; //菜单地址(权限用)
	@Resource(name="userandspecialService")
	private UserAndSpecialManager userandspecialService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	@Resource(name="traininguserService")
	private TraininguserManager traininguserService;
	
	

	
	/**
	 * 给于补考
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/setStatus")
	public void setStatus(PrintWriter out) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = userandspecialService.findById(pd);
		pd.put("STATUS", 4);
		userandspecialService.edit(pd);
		out.write("success");
		out.close();
	}
	

	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表UserAndSpecial");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = userandspecialService.list(page);	//列出UserAndSpecial列表
		/*通过查询出来的SPECIAL_ID去查找所属的专题名称，并设置到vaiList中*/
		for(int i=0;i<varList.size();i++){
			String special_id = varList.get(i).getString("SPECIAL_ID");
			String user_id = varList.get(i).getString("USER_ID");
			PageData specialPD = new PageData();
			PageData userPD = new PageData();
			specialPD.put("SPECIAL_ID", special_id);
			userPD.put("USER_ID", user_id);
			specialPD = specialService.findById(specialPD);		//通过SPECIAL_ID查询
			userPD = traininguserService.findByUiId(userPD);	//通过USER_ID查询
			if(specialPD!=null){
				varList.get(i).put("SPECIAL_TITLE", specialPD.getString("TITLE"));
			}
			if(userPD!=null){
				varList.get(i).put("USERNAME", userPD.getString("USERNAME"));
			}
			Integer status = (Integer) varList.get(i).get("STATUS");
			String status_show = judgeStatus(status);
			if(status_show!=null&&status_show!=""){
				varList.get(i).put("STATUS_SHOW", status_show);
			}
			
		}
		List<PageData> specialList = specialService.findTitle();
		mv.setViewName("trainingmanage/userandspecial/userandspecial_list");
		mv.addObject("specialList", specialList);
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 
	 */
	private String judgeStatus(Integer status){
		String status_show = null;
		if(status!=null){
			switch (status) {
			case 0:
				status_show = "未考试";
				break;
			case 1:
				status_show = "考试已完成，未审批";
				break;
			case 2:
				status_show = "考试已通过";
				break;
			case 3:
				status_show = "考试未通过";
				break;
			case 4:
				status_show = "补考未进行";
				break;
			case 5:
				status_show = "补考已完成，未审批";
				break;
			case 6:
				status_show = "补考已通过";
				break;
			case 7:
				status_show = "补考未通过";
				break;
				
			default:
				break;
			}
		}
		return status_show;
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
		pd = userandspecialService.findById(pd);	//根据ID读取
		
		String special_id = pd.getString("SPECIAL_ID");		//获取SPECIAL_ID
		String user_id = pd.getString("USER_ID");			//获取USER_ID
		
		PageData specialPD = new PageData();
		PageData userPD = new PageData();
		
		specialPD.put("SPECIAL_ID", special_id);
		userPD.put("USER_ID", user_id);
		
		specialPD = specialService.findById(specialPD);		//根据SPECIAL_ID查找
		userPD = traininguserService.findByUiId(userPD);	//根据USER_ID查找
		
		pd.put("SPECAIL_TITLE", specialPD.getString("TITLE"));
		pd.put("USERNAME", userPD.getString("USERNAME"));
		
		Integer status = (Integer) pd.get("STATUS");
		String status_show = judgeStatus(status);
		if(status_show!=null&&status_show!=""){
			pd.put("STATUS_SHOW", status_show);
		}
		
		mv.setViewName("trainingmanage/userandspecial/userandspecial_detail");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	

	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出UserAndSpecial到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("人员专题表ID");	//1
		titles.add("用户ID");	//2
		titles.add("专题ID");	//3
		titles.add("选择题答案");	//4
		titles.add("选择题分数");	//5
		titles.add("填空题答案");	//6
		titles.add("填空题分数");	//7
		titles.add("主观题答案");	//8
		titles.add("主观题分数");	//9
		titles.add("总分");	//10
		titles.add("情况");	//11
		titles.add("提交时间");	//12
		dataMap.put("titles", titles);
		List<PageData> varOList = userandspecialService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var2", varOList.get(i).getString("USER_ID"));	//2
			vpd.put("var3", varOList.get(i).getString("SPECIAL_ID"));	//3
			vpd.put("var4", varOList.get(i).getString("CHOICE_ANSWER"));	//4
			vpd.put("var5", varOList.get(i).getString("CHOICE_GRADE"));	//5
			vpd.put("var6", varOList.get(i).getString("FILL_ANSWER"));	//6
			vpd.put("var7", varOList.get(i).getString("FILL_GRADE"));	//7
			vpd.put("var8", varOList.get(i).getString("SUBJECTIVE_ANSWER"));	//8
			vpd.put("var9", varOList.get(i).getString("SUBJECTIVE_GRADE"));	//9
			vpd.put("var10", varOList.get(i).getString("TOTLE_GRADE"));	//10
			vpd.put("var11", varOList.get(i).get("STATUS").toString());	//11
			vpd.put("var12", varOList.get(i).getString("SUBMIT_TIME"));	//12
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
