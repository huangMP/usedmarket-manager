package com.fh.controller.trainingmanage.practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.PageBean;
import com.fh.service.trainingmanage.chapter.ChapterManager;
import com.fh.service.trainingmanage.practice.PracticeManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.PathUtil;

/** 
 * 说明：练习表
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/practice")
public class PracticeController extends BaseController {
	
	String menuUrl = "practice/list.do"; //菜单地址(权限用)
	@Resource(name="practiceService")
	private PracticeManager practiceService;
	@Resource(name="chapterService")
	private ChapterManager chapterService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			@RequestParam(value="practiceFile",required=false) MultipartFile practiceFile,	//上传的练习
			@RequestParam(value="answerFile",required=false) MultipartFile answerFile,		//上传的答案
			@RequestParam(value="PRACTICE_ID",required=false) String PRACTICE_ID,		//练习ID
			@RequestParam(value="CHAPTER_ID",required=false) String CHAPTER_ID,			//章节ID
			@RequestParam(value="FILE_PATH",required=false) String FILE_PATH,			//练习路径
			@RequestParam(value="ANSWER_PATH",required=false) String ANSWER_PATH,		//答案路径
			@RequestParam(value="CHOICE_NUM",required=false) String CHOICE_NUM		//选择题个数
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Practice");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PRACTICE_ID", this.get32UUID());	//主键
		
		//获取存放文件的文件夹位置
		String realPapersUploadPath = getRealPapersUploadPath();
		//获取文件的新文件名
		String newPracticeName = this.get32UUID() ;
		String newPracticeFileName = practiceService.uploadDocxAndHtmlAndHtmlImg( practiceFile , realPapersUploadPath, newPracticeName);
		
		//获取文件的新文件名
		String newAnswerName = this.get32UUID() ;
		String newAnswerFileName =  practiceService.uploadDocxAndHtmlAndHtmlImg( answerFile , realPapersUploadPath, newAnswerName);
		
		pd.put("CHAPTER_ID", CHAPTER_ID);								//所属章节
		pd.put("FILE_PATH", "static/practices/"+newPracticeFileName);	//试卷的文件路径
		pd.put("ANSWER_PATH", "static/practices/"+newAnswerFileName);	//答案的文件路径
		pd.put("ADD_USER", Jurisdiction.getUsername());	//添加人
		pd.put("ADD_TIME", new Date());					//添加时间
		
		pd.put("CHOICE_NUM", CHOICE_NUM);		//单选题个数
		
		practiceService.save(pd);
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
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = practiceService.findById(pd);
		practiceService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			@RequestParam(value="practiceFile",required=false) MultipartFile practiceFile,	//上传的练习
			@RequestParam(value="answerFile",required=false) MultipartFile answerFile,		//上传的答案
			@RequestParam(value="practiceFileChange",required=false) String practiceFileChange,		//是否修改练习
			@RequestParam(value="answerFileChange",required=false) String answerFileChange,		    //是否修改答案
			@RequestParam(value="PRACTICE_ID",required=false) String PRACTICE_ID,		//练习ID
			@RequestParam(value="CHAPTER_ID",required=false) String CHAPTER_ID,			//章节ID
			@RequestParam(value="FILE_PATH",required=false) String FILE_PATH,			//练习路径
			@RequestParam(value="ANSWER_PATH",required=false) String ANSWER_PATH,		//答案路径
			@RequestParam(value="CHOICE_NUM",required=false) String CHOICE_NUM	//选择题个数
			) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PRACTICE_ID", PRACTICE_ID);
		pd = practiceService.findById(pd);
		
		//获取存放文件的文件夹位置
		String realPapersUploadPath = getRealPapersUploadPath();

		//获取文件的新文件名
		String newPracticeName = "" ;
		String newPracticeFileName = "";
		if(practiceFileChange!=null){
			//删除练习
			if(pd.getString("FILE_PATH")!=null){
				String realPath =  PathUtil.getClasspath() + pd.getString("FILE_PATH");
				practiceService.deleteDocxAndHtmlAndHtmlImg(realPath);
			}

			//获取文件的新文件名
			newPracticeName = this.get32UUID();
			newPracticeFileName = practiceService.uploadDocxAndHtmlAndHtmlImg( practiceFile , realPapersUploadPath, newPracticeName);

			pd.put("FILE_PATH", "static/practices/"+newPracticeFileName);	//试卷的文件路径
		}

		//获取文件的新文件名
		String newAnswerName = "" ;
		String newAnswerFileName = "";	
		if(answerFileChange!=null){
			//删除答案
			if(pd.getString("ANSWER_PATH")!=null){
				String realPath = PathUtil.getClasspath() + pd.getString("ANSWER_PATH");
				practiceService.deleteDocxAndHtmlAndHtmlImg(realPath);
			}

			//获取文件的新文件名
			newAnswerName = this.get32UUID();
			newAnswerFileName = practiceService.uploadDocxAndHtmlAndHtmlImg( answerFile , realPapersUploadPath, newAnswerName );
			
			pd.put("ANSWER_PATH", "static/practices/"+newAnswerFileName);	//答案的文件路径
		}
		
		pd.put("CHAPTER_ID", CHAPTER_ID);								//所属章节
		pd.put("ADD_USER", Jurisdiction.getUsername());	//添加人
		pd.put("ADD_TIME", new Date());		
		

		pd.put("CHOICE_NUM", CHOICE_NUM);		//单选题个数
		
		practiceService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**通过专题id查找所属的章节
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/findChapterBySpecialId")
	public void findChapterBySpecialId(HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");//改编码格式

		PageData special = new PageData();
		special = this.getPageData();
		
		//保存现在查找的专题Id
		//session.setAttribute("lastSelectSpecialId", special.get( "SPECIAL_ID" ) );
		
		
		List<PageData> chapterList = (List<PageData>) chapterService.findChaptersBySpecialId(special);
		
		JSONArray jsonArray = JSONArray.fromObject(chapterList);
		String dataString = jsonArray.toString();
		response.getWriter().write(dataString);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Practice");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		
		page.setPd(pd);
		List<PageData>	varList = practiceService.list(page);	//列出Practice列表
		
		for(int i=0;i<varList.size();i++){ //利用 CHAPTER_ID 找到章节的Title属性的值
			String chapter_id =  varList.get(i).getString("CHAPTER_ID");
			PageData chapterPD = new PageData();
			chapterPD.put("CHAPTER_ID", chapter_id);
			chapterPD = chapterService.findById(chapterPD);
			if(chapterPD!=null){
				varList.get(i).put("CHAPTER_TITLE", chapterPD.getString("TITLE"));
				PageData specialPD = new PageData();
				String special_id = chapterPD.getString("SPECIAL_ID");
				specialPD.put("SPECIAL_ID", special_id);
				specialPD = specialService.findById(specialPD);
				if(specialPD!=null){
					varList.get(i).put("SPECIAL_TITLE", specialPD.getString("TITLE"));
				}
			}
		}
		
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		mv.setViewName("trainingmanage/practice/practice_list");
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
		
		//查询所有的专题
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		mv.setViewName("trainingmanage/practice/practice_edit");
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
		pd = practiceService.findById(pd);	//根据ID读取
		
		//查询所有的专题
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		//利用 CHAPTER_ID 找到章节的Title属性的值
		String CHAPTER_ID = (String) pd.get("CHAPTER_ID"); 
		String CHAPTER_TITLE = chapterService.selectTitleById( CHAPTER_ID );
		pd.put( "CHAPTER_TITLE" , CHAPTER_TITLE );
		
		mv.setViewName("trainingmanage/practice/practice_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Practice");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			practiceService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 获取存放文件的文件夹位置
	 * @return 存放文件的文件夹位置
	 */
	private String getRealPapersUploadPath(){
		return PathUtil.getClasspath() + "static/practices";
	}

}
