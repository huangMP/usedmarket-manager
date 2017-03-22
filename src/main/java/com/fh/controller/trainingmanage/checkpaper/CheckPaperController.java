package com.fh.controller.trainingmanage.checkpaper;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.DecimalFormat;
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
import com.fh.service.trainingmanage.chapter.ChapterManager;
import com.fh.service.trainingmanage.paper.PaperManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.service.trainingmanage.traininguser.TraininguserManager;
import com.fh.service.trainingmanage.userandspecial.UserAndSpecialManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 
 * 考卷审核
 * @author Peivxuan
 *
 */
@Controller
@RequestMapping(value="/checkpaper")
public class CheckPaperController extends BaseController{
	
	String menuUrl = "checkpaper/list.do"; //菜单地址(权限用)
	@Resource(name="userandspecialService")
	private UserAndSpecialManager userandspecialService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	@Resource(name="traininguserService")
	private TraininguserManager traininguserService;
	@Resource(name="paperService")
	private PaperManager paperService;
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/check")
	public ModelAndView check() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改CheckPaper");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println("check-running!--------------------------------------------------------------");
		
		//数据格式化器
		DecimalFormat decimalFormat = new DecimalFormat(".00");
		//选择题分数
		float choiceGrade = Float.parseFloat(pd.getString("CHOICE_GRADE"));
		//填空题分数
		float fillGrade = Float.parseFloat(pd.getString("FILL_GRADE"));
		//填空题总分
		float standardFillGrade = Float.parseFloat(pd.getString("STANDARD_FILL_GRADE"));
		//主观题分数
		float subjectiveGrade = Float.parseFloat(pd.getString("SUBJECTIVE_GRADE"));
		//主观题总分
		float standardSubjectiveGrade = Float.parseFloat(pd.getString("STANDARD_SUBJECTIVE_GRADE"));
		//试卷总分
		float paperTotleGrade = Float.parseFloat(pd.getString("TOTLE_GRADE"));
		
		/*-start-判断得分情况是否超过总分或者小于零分*/
			//超过此项目总分，得分设为项目总分,小于零分则设置为零分
		fillGrade = fillGrade >= standardFillGrade ? standardFillGrade : (fillGrade >= 0 ? fillGrade : 0); 
			//超过此项目总分，得分设为项目总分,小于零分则设置为零分
		subjectiveGrade = subjectiveGrade >= standardSubjectiveGrade ? standardSubjectiveGrade : (subjectiveGrade >= 0 ? subjectiveGrade : 0); 
		/*-end-判断得分情况是否超过总分或者小于零分*/
		
		//总分
		String totleGrade = decimalFormat.format(choiceGrade + fillGrade + subjectiveGrade);
		
		/*-start-设置数据*/
		pd.put("FILL_GRADE", fillGrade <= 0 ? fillGrade : decimalFormat.format(fillGrade));
		pd.put("SUBJECTIVE_GRADE", subjectiveGrade <= 0 ? subjectiveGrade : decimalFormat.format(subjectiveGrade));
		pd.put("TOTLE_GRADE", totleGrade);
		//增量
		int incre = 1; 
		if(Float.parseFloat(totleGrade) < (paperTotleGrade*0.6)) {
			++incre;
		}
		int status = Integer.parseInt(pd.getString("STATUS")) + incre;
		
		//情况不对，则不修改状态
		if(status != 0 && status != 1 && status != 4 && status !=5)
			pd.put("STATUS", status); //修改状态
		/*-end-设置数据*/
		
		userandspecialService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表UserAndSpecial");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		//设置要显示的情况
		List<Integer> types = new ArrayList<Integer>();
		//显示考试已完成，未审批
		types.add(1);
		//显示补考已完成，未审批
		types.add(5);
		//加入pd中
		pd.put("types", types);
		
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
		mv.setViewName("trainingmanage/checkpaper/checkpaper_list");
		mv.addObject("specialList", specialList);
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	 /**去审查页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goCheck")
	public ModelAndView goCheck()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = userandspecialService.findById(pd);	//根据ID读取
		PageData paperPd = new PageData();
		paperPd = paperService.findById(pd);
		
		/*-start-通过查询出来的SPECIAL_ID和USER_ID去查找所属的专题名称与用户名称，并设置到pd中*/
		String special_id = pd.getString("SPECIAL_ID");
		String user_id = pd.getString("USER_ID");
		PageData specialPD = new PageData();
		PageData userPD = new PageData();
		specialPD.put("SPECIAL_ID", special_id);
		userPD.put("USER_ID", user_id);
		specialPD = specialService.findById(specialPD);		//通过SPECIAL_ID查询
		userPD = traininguserService.findByUiId(userPD);	//通过USER_ID查询
		if(specialPD!=null){
			pd.put("SPECIAL_TITLE", specialPD.getString("TITLE"));
		}
		if(userPD!=null){
			pd.put("USERNAME", userPD.getString("USERNAME"));
		}
		/*-end-通过查询出来的SPECIAL_ID和USER_ID去查找所属的专题名称与用户名称，并设置到pd中*/
		
		/*-start-查找填空题与主观题的标准答案与考生答案并作分割*/
		String fillAnswerStrByStandard = (String) paperPd.get("FILL_ANSWER"); //填空题标准答案
		String fillAnswerStrByUser = (String) pd.get("FILL_ANSWER"); //填空题考生答案
		String[] standardFillAnswers = fillAnswerStrByStandard.split("\\|");
		String[] userFillAnswers = fillAnswerStrByUser.split("\\|");
		
		String subjectiveAnswerStrByStandard = (String) paperPd.get("SUBJECTIVE_ANSWER");
		String subjectiveAnswerStrByUser = (String) pd.get("SUBJECTIVE_ANSWER");
		String[] standardSubjectiveAnswers = subjectiveAnswerStrByStandard.split("\\|");
		String[] userSubjectiveAnswers = subjectiveAnswerStrByUser.split("\\|");
		/*-end-查找填空题与主观题的标准答案与考生答案并作分割*/
		
		/*-start-设置答案个数*/
		int fillNum = (Integer) paperPd.get("FILL_NUM");
		int subjectiveNum = (Integer) paperPd.get("SUBJECTIVE_NUM");
		/*-end-设置答案个数*/
		
		/*-start-填空题与主观题分数*/
		String eachFillGrade = (String) paperPd.get("FILL_GRADE");
		int fillGrade =  Integer.parseInt(eachFillGrade) * fillNum;
		String eachSubjectiveGrade = (String) paperPd.get("SUBJECTIVE_GRADE");
		int subjectiveGrade = Integer.parseInt(eachSubjectiveGrade) * subjectiveNum;
		/*-end-填空题与主观题分数*/
		
		/*-start-设置modelandview*/
		mv.setViewName("trainingmanage/checkpaper/checkpaper_check");
		mv.addObject("msg", "check");
		mv.addObject("pd", pd);
		mv.addObject("paperTotleGrade", paperPd.getString("TOTLE_GRADE"));
		mv.addObject("fillGrade", fillGrade);
		mv.addObject("eachFillGrade", eachFillGrade);
		mv.addObject("subjectiveGrade", subjectiveGrade);
		mv.addObject("eachSubjectiveGrade", eachSubjectiveGrade);
		mv.addObject("fillNum", fillNum);
		mv.addObject("subjectiveNum", subjectiveNum);
		mv.addObject("standardFillAnswers", standardFillAnswers);
		mv.addObject("userFillAnswers", userFillAnswers);
		mv.addObject("standardSubjectiveAnswers", standardSubjectiveAnswers);
		mv.addObject("userSubjectiveAnswers", userSubjectiveAnswers);
		/*-end-设置modelandview*/
		
		return mv;
	}	
	
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
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
