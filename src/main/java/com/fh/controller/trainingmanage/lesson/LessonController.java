package com.fh.controller.trainingmanage.lesson;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

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
import com.fh.service.trainingmanage.chapter.ChapterManager;
import com.fh.service.trainingmanage.lesson.LessonManager;
import com.fh.service.trainingmanage.special.SpecialManager;

/** 
 * 说明：课时管理
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/lesson")
public class LessonController extends BaseController {
	
	String menuUrl = "lesson/list.do"; //菜单地址(权限用)
	@Resource(name="lessonService")
	private LessonManager lessonService;
	@Resource(name="chapterService")
	private ChapterManager chapterService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Lesson");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ADD_TIME", new Date());
		pd.put("ADD_USER", Jurisdiction.getUsername());
		pd.put("LESSON_ID", this.get32UUID());	//主键
		lessonService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Lesson");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		lessonService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Lesson");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		lessonService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Lesson");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = lessonService.list(page);	//列出Lesson列表
		
		/*通过查询出来的LESSON_ID去查找所属的专题名称，并设置到vaiList中*/
		for(int i=0;i<varList.size();i++){
			String chapter_id = varList.get(i).getString("CHAPTER_ID");
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
		
		
		mv.setViewName("trainingmanage/lesson/lesson_list");
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
		
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		mv.setViewName("trainingmanage/lesson/lesson_edit");
		mv.addObject("specialList", specialList);
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
		pd = lessonService.findById(pd);	//根据ID读取
		
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		//利用 CHAPTER_ID 找到章节的Title属性的值
		String CHAPTER_ID = (String) pd.get("CHAPTER_ID"); 
		pd.put("CHAPTER_ID",CHAPTER_ID.trim()); 
		String CHAPTER_TITLE = chapterService.selectTitleById( CHAPTER_ID );
		pd.put( "CHAPTER_TITLE" , CHAPTER_TITLE.trim() );
		
		System.out.println(CHAPTER_TITLE+"--------------------------");
		
		mv.setViewName("trainingmanage/lesson/lesson_edit");
		mv.addObject("specialList", specialList);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Lesson");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			lessonService.deleteAll(ArrayDATA_IDS);
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
