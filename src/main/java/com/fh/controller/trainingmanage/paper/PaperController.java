package com.fh.controller.trainingmanage.paper;

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

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.DocAndDocxToHtml;
import com.fh.util.FileUpload;
import com.fh.util.FileUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.service.trainingmanage.paper.PaperManager;
import com.fh.service.trainingmanage.special.SpecialManager;

/** 
 * 说明：试卷表
 * 创建人：liangzhilin
 * 创建时间：2016-08-25
 */
@Controller
@RequestMapping(value="/paper")
public class PaperController extends BaseController {
	
	String menuUrl = "paper/list.do"; //菜单地址(权限用)
	@Resource(name="paperService")
	private PaperManager paperService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			HttpServletRequest request,
			@RequestParam(value="File",required=false) MultipartFile file,		//上传的文件
			@RequestParam(value="TITLE",required=false) String TITLE,		//试卷标题
			@RequestParam(value="SPECIAL_ID",required=false) String SPECIAL_ID,		//所属专题ID
			@RequestParam(value="CHOICE_NUM",required=false) String CHOICE_NUM,		//选择题个数
			@RequestParam(value="CHOICE_GRADE",required=false) String CHOICE_GRADE,	//选择题分数
			@RequestParam(value="CHOICE_ANSWER",required=false) String CHOICE_ANSWER,	//选择题答案
			@RequestParam(value="CHOICE_DOUBLE_NUM",required=false) String CHOICE_DOUBLE_NUM,		//多选题个数
			@RequestParam(value="CHOICE_DOUBLE_GRADE",required=false) String CHOICE_DOUBLE_GRADE,	//多选题分数
			@RequestParam(value="CHOICE_DOUBLE_ANSWER",required=false) String CHOICE_DOUBLE_ANSWER,	//多选题答案
			@RequestParam(value="FILL_NUM",required=false) String FILL_NUM,				//填空题个数
			@RequestParam(value="FILL_ANSWER",required=false) String FILL_ANSWER,		//填空题答案
			@RequestParam(value="FILL_GRADE",required=false) String FILL_GRADE,			//填空题分数
			@RequestParam(value="SUBJECTIVE_NUM",required=false) String SUBJECTIVE_NUM,	//主观题个数
			@RequestParam(value="SUBJECTIVE_ANSWER",required=false) String SUBJECTIVE_ANSWER,	//主观题答案
			@RequestParam(value="SUBJECTIVE_GRADE",required=false) String SUBJECTIVE_GRADE		//主观题分数
			) throws Exception{

		logBefore(logger, Jurisdiction.getUsername()+"新增Paper");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//获取存放文件的文件夹位置
		String realPapersUploadPath = getRealPapersUploadPath();
		//获取文件的新文件名
		String newName = this.get32UUID();
		
		String newFileName = uploadDocxAndHtmlAndHtmlImg(file, realPapersUploadPath, newName);
		
		System.out.println(CHOICE_ANSWER+"--------------------");
		
		int total = Integer.parseInt(CHOICE_NUM)*Integer.parseInt(CHOICE_GRADE)
				+Integer.parseInt(CHOICE_DOUBLE_NUM)*Integer.parseInt(CHOICE_DOUBLE_GRADE)
				+Integer.parseInt(FILL_NUM)*Integer.parseInt(FILL_GRADE)
				+Integer.parseInt(SUBJECTIVE_NUM)*Integer.parseInt(SUBJECTIVE_GRADE);
		
		pd.put("FILE_PATH", "/static/papers/"+newFileName);	//试卷的文件路径
		pd.put("TITLE", TITLE);		//试卷标题
		pd.put("SPECIAL_ID", SPECIAL_ID);	//所属专题ID
		pd.put("CHOICE_NUM", CHOICE_NUM);	//选择题个数
		pd.put("CHOICE_GRADE", CHOICE_GRADE);	//选择题分数
		pd.put("CHOICE_ANSWER", CHOICE_ANSWER);	//选择题答案
		pd.put("CHOICE_DOUBLE_NUM", CHOICE_DOUBLE_NUM);		//多选题个数
		pd.put("CHOICE_DOUBLE_GRADE", CHOICE_DOUBLE_GRADE);		//多选题分数
		pd.put("CHOICE_DOUBLE_ANSWER", CHOICE_DOUBLE_ANSWER);	//多选题答案
		pd.put("FILL_NUM", FILL_NUM);			//填空题个数
		pd.put("FILL_ANSWER", FILL_ANSWER);		//填空题答案
		pd.put("FILL_GRADE", FILL_GRADE);		//填空题分数
		pd.put("SUBJECTIVE_NUM", SUBJECTIVE_NUM);	//主观题个数
		pd.put("SUBJECTIVE_ANSWER", SUBJECTIVE_ANSWER);		//主观题答案
		pd.put("SUBJECTIVE_GRADE", SUBJECTIVE_GRADE);	//主观题分数
		pd.put("TOTLE_GRADE", total+"");		//总分
		pd.put("PAPER_ID", this.get32UUID());	//主键
		pd.put("ADD_USER", Jurisdiction.getUsername());	//添加人
		pd.put("ADD_TIME", new Date());					//添加时间
		//调用存储方法
		paperService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Paper");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = paperService.findById(pd);
		String[] paperid = new String[1];
		paperid[0] = pd.getString("PAPER_ID");
		specialService.editOriginalPaperToNull(paperid);
		specialService.editAnotherPaperToNull(paperid);
		paperService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			HttpServletRequest request,
			@RequestParam(value="File",required=false) MultipartFile file,		//上传的文件
			@RequestParam(value="fileChange",required=false) String fileChange,		//
			@RequestParam(value="PAPER_ID",required=false) String PAPER_ID,		//试卷ID
			@RequestParam(value="TITLE",required=false) String TITLE,		//试卷标题
			@RequestParam(value="SPECIAL_ID",required=false) String SPECIAL_ID,		//所属专题ID
			@RequestParam(value="CHOICE_NUM",required=false) String CHOICE_NUM,		//选择题个数
			@RequestParam(value="CHOICE_GRADE",required=false) String CHOICE_GRADE,	//选择题分数
			@RequestParam(value="CHOICE_ANSWER",required=false) String CHOICE_ANSWER,	//选择题答案
			@RequestParam(value="CHOICE_DOUBLE_NUM",required=false) String CHOICE_DOUBLE_NUM,		//多选题个数
			@RequestParam(value="CHOICE_DOUBLE_GRADE",required=false) String CHOICE_DOUBLE_GRADE,	//多选题分数
			@RequestParam(value="CHOICE_DOUBLE_ANSWER",required=false) String CHOICE_DOUBLE_ANSWER,	//多选题答案
			@RequestParam(value="FILL_NUM",required=false) String FILL_NUM,				//填空题个数
			@RequestParam(value="FILL_ANSWER",required=false) String FILL_ANSWER,		//填空题答案
			@RequestParam(value="FILL_GRADE",required=false) String FILL_GRADE,			//填空题分数
			@RequestParam(value="SUBJECTIVE_NUM",required=false) String SUBJECTIVE_NUM,	//主观题个数
			@RequestParam(value="SUBJECTIVE_ANSWER",required=false) String SUBJECTIVE_ANSWER,	//主观题答案
			@RequestParam(value="SUBJECTIVE_GRADE",required=false) String SUBJECTIVE_GRADE		//主观题分数
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Paper");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PAPER_ID", PAPER_ID);
		pd = paperService.findById(pd);
		
		/*--start---如果修改了所属专题之后，需要将之前被设置的专题试卷置空--peixuan--*/
		
		String original_special_id = pd.getString("SPECIAL_ID");
		if(!original_special_id.equals(SPECIAL_ID)) {
			
			 PageData special = new PageData();
			 special.put("SPECIAL_ID", original_special_id);
			 special = specialService.findById(special);
			 String original_paper_id = special.getString("ORIGINAL_PAPER");
			 String another_paper_id = special.getString("ANOTHER_PAPER");
			 if(PAPER_ID.equals(original_paper_id)) {
				 special.put("ORIGINAL_PAPER", "");
			 }
			 if(PAPER_ID.equals(another_paper_id)) {
				 special.put("ANOTHER_PAPER", "");
			 }
			 specialService.edit(special);
		}
		
		/*--end---如果修改了所属专题之后，需要将之前被设置的专题试卷置空-*/
		
		if(fileChange!=null){
			//删除原来的文件
			if(pd.getString("FILE_PATH")!=null){
				String realPath = PathUtil.getClasspath() + pd.getString("FILE_PATH");
				paperService.deleteDocxAndHtmlAndHtmlImg(realPath);
			}
			
			//获取存放文件的文件夹位置
			String realPapersUploadPath = getRealPapersUploadPath();
			//获取文件的新文件名
			String newName = this.get32UUID();
			
			String newFileName = uploadDocxAndHtmlAndHtmlImg(file, realPapersUploadPath, newName);
			
			pd.put("FILE_PATH", "/static/papers/"+newFileName);	//试卷的文件路径
		}
		
		int total = Integer.parseInt(CHOICE_NUM)*Integer.parseInt(CHOICE_GRADE)
				+Integer.parseInt(CHOICE_DOUBLE_NUM)*Integer.parseInt(CHOICE_DOUBLE_GRADE)
				+Integer.parseInt(FILL_NUM)*Integer.parseInt(FILL_GRADE)
				+Integer.parseInt(SUBJECTIVE_NUM)*Integer.parseInt(SUBJECTIVE_GRADE);
		
		pd.put("TITLE", TITLE);		//试卷标题
		pd.put("SPECIAL_ID", SPECIAL_ID);	//所属专题ID
		pd.put("CHOICE_NUM", CHOICE_NUM);	//选择题个数
		pd.put("CHOICE_GRADE", CHOICE_GRADE);	//选择题分数
		pd.put("CHOICE_ANSWER", CHOICE_ANSWER);	//选择题答案
		pd.put("CHOICE_DOUBLE_NUM", CHOICE_DOUBLE_NUM);		//多选题个数
		pd.put("CHOICE_DOUBLE_GRADE", CHOICE_DOUBLE_GRADE);		//多选题分数
		pd.put("CHOICE_DOUBLE_ANSWER", CHOICE_DOUBLE_ANSWER);	//多选题答案
		pd.put("FILL_NUM", FILL_NUM);			//填空题个数
		pd.put("FILL_ANSWER", FILL_ANSWER);		//填空题答案
		pd.put("FILL_GRADE", FILL_GRADE);		//填空题分数
		pd.put("SUBJECTIVE_NUM", SUBJECTIVE_NUM);	//主观题个数
		pd.put("SUBJECTIVE_ANSWER", SUBJECTIVE_ANSWER);		//主观题答案
		pd.put("SUBJECTIVE_GRADE", SUBJECTIVE_GRADE);	//主观题分数
		pd.put("TOTLE_GRADE", total+"");		//总分
		paperService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Paper");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = paperService.list(page);	//列出Paper列表
		/*通过查询出来的SPECIAL_ID去查找所属的专题名称，并设置到vaiList中*/
		for(int i=0;i<varList.size();i++){
			String special_id = varList.get(i).getString("SPECIAL_ID");
			PageData specialPD = new PageData();
			specialPD.put("SPECIAL_ID", special_id);
			specialPD = specialService.findById(specialPD);
			if(specialPD!=null){
				varList.get(i).put("SPECIAL_TITLE", specialPD.getString("TITLE"));
			}
		}
		List<PageData> specialList = specialService.findTitle();
		mv.setViewName("trainingmanage/paper/paper_list");
		mv.addObject("specialList", specialList);
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
		//查询所有的专题名称
		List<PageData> specialList = specialService.findTitle();
		mv.setViewName("trainingmanage/paper/paper_save");
		mv.addObject("specialList", specialList);
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
		pd = paperService.findById(pd);	//根据ID读取
		//查询所有的专题名称
		List<PageData> specialList = specialService.findTitle();
		
		
		//获取单选题数组
		String[] choice_str = division(pd.getString("CHOICE_ANSWER"));
		
		//获取多选题个数
		String[] choice_double_str = division(pd.getString("CHOICE_DOUBLE_ANSWER"));
		//获取填空题个数
		String[] fill_str = division(pd.getString("FILL_ANSWER"));
		//获取主观题个数
		String[] subjective_str = division(pd.getString("SUBJECTIVE_ANSWER"));
		
		
		mv.setViewName("trainingmanage/paper/paper_edit");
		mv.addObject("specialList", specialList);
		mv.addObject("choice_answer", choice_str);
		mv.addObject("choice_double_answer", choice_double_str);
		mv.addObject("fill_answer", fill_str);
		mv.addObject("subjective_answer", subjective_str);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Paper");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			specialService.editOriginalPaperToNull(ArrayDATA_IDS);
			specialService.editAnotherPaperToNull(ArrayDATA_IDS);
			paperService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Paper到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("专题ID");	//2
		titles.add("文件路径");	//3
		titles.add("选择题个数");	//4
		titles.add("选择题分数");	//5
		titles.add("选择题答案");	//6
		titles.add("多选题个数");	//4
		titles.add("多选题分数");	//5
		titles.add("多选题答案");	//6
		titles.add("填空题个数");	//7
		titles.add("填空题答案");	//8
		titles.add("填空题分数");	//9
		titles.add("主观题个数");	//10
		titles.add("主观题答案");	//11
		titles.add("主观题分数");	//12
		titles.add("总分");	//13
		titles.add("添加人");	//14
		titles.add("添加时间");	//15
		titles.add("试卷名称");	//16
		dataMap.put("titles", titles);
		List<PageData> varOList = paperService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var2", varOList.get(i).getString("SPECIAL_ID"));	//2
			vpd.put("var3", varOList.get(i).getString("FILE_PATH"));	//3
			vpd.put("var4", varOList.get(i).get("CHOICE_NUM").toString());	//4
			vpd.put("var5", varOList.get(i).getString("CHOICE_GRADE"));	//5
			vpd.put("var6", varOList.get(i).getString("CHOICE_ANSWER"));	//6
			vpd.put("var4", varOList.get(i).get("CHOICE_DOUBLE_NUM").toString());	//4
			vpd.put("var5", varOList.get(i).getString("CHOICE_DOUBLE_GRADE"));	//5
			vpd.put("var6", varOList.get(i).getString("CHOICE_DOUBLE_ANSWER"));	//6
			vpd.put("var7", varOList.get(i).get("FILL_NUM").toString());	//7
			vpd.put("var8", varOList.get(i).getString("FILL_ANSWER"));	//8
			vpd.put("var9", varOList.get(i).getString("FILL_GRADE"));	//9
			vpd.put("var10", varOList.get(i).get("SUBJECTIVE_NUM").toString());	//10
			vpd.put("var11", varOList.get(i).getString("SUBJECTIVE_ANSWER"));	//11
			vpd.put("var12", varOList.get(i).getString("SUBJECTIVE_GRADE"));	//12
			vpd.put("var13", varOList.get(i).getString("TOTLE_GRADE"));	//13
			vpd.put("var14", varOList.get(i).getString("ADD_USER"));	//14
			vpd.put("var15", varOList.get(i).getString("ADD_TIME"));	//15
			vpd.put("var16", varOList.get(i).getString("TITLE"));	//16
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
	
	/**
	 * 上传docx并生成html
	 * 
	 * docx和html和htmlImg放在同一个目录下
	 * 且命名有如下规律：
	 * mmmm.docx	docx文件
	 * mmmm.html	html文件
	 * mmmm			htmlImg文件夹
	 * 
	 * @param file docx文件
	 * @param realPath docx真实路径
	 * @param docxFileName docx文件名
	 * @throws Exception
	 * @return String docx文件名+后缀
	 * @author  huangMP
	 * @date    2016年8月29日
	 */
	private String uploadDocxAndHtmlAndHtmlImg( MultipartFile file ,String realPapersUploadPath ,String fileName){

		//调用FileUpload类中的fileUp方法，上传文件
		String newAnswerFileName = FileUpload.fileUp( file , realPapersUploadPath, fileName);
		String newAnswerHtmlName = newAnswerFileName.replaceAll(".docx", ".html").replaceAll(".doc", ".html");
		//为该文档生成html文件
		try {
			DocAndDocxToHtml.docOrDocxToHtml(realPapersUploadPath + "/" + newAnswerFileName , realPapersUploadPath + "/" + newAnswerHtmlName , realPapersUploadPath + "/" + fileName );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newAnswerFileName;
	}
	
	/**
	 * 获取存放文件的文件夹位置
	 * @return 存放文件的文件夹位置
	 * @author  huangMP
	 * @date    2016年8月29日
	 */
	private String getRealPapersUploadPath(){
		return PathUtil.getClasspath() + "static/papers";
	}
	
	//将字符串分割之后放入数组
	private String[] division(String answer){
		
		int num = 0;
		for (int i = 0; i < answer.length(); i++) {
			if(answer.charAt(i) == '|'){
				num++;
			}
		}
		
		int i = 0;
		String[] choice_answer = new String[num];
		while(answer.length()>0){
			int index = answer.indexOf("|");
			choice_answer[i] = answer.substring(0, index);
			answer = answer.substring(index+1, answer.length());
			i++;
		}
		
		return choice_answer;
	}
}
