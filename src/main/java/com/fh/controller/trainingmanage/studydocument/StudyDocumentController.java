package com.fh.controller.trainingmanage.studydocument;

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
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

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
import com.fh.util.FileUpload;
import com.fh.util.FileUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.trainingmanage.chapter.ChapterManager;
import com.fh.service.trainingmanage.lesson.LessonManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.service.trainingmanage.studydocument.StudyDocumentManager;

/** 
 * 说明：文档表
 * 创建人：liangzhilin
 * 创建时间：2016-08-25
 */
@Controller
@RequestMapping(value="/studydocument")
public class StudyDocumentController extends BaseController {
	
	String menuUrl = "studydocument/list.do"; //菜单地址(权限用)
	@Resource(name="studydocumentService")
	private StudyDocumentManager studydocumentService;
	@Resource(name="lessonService")
	private LessonManager lessonService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	@Resource(name="chapterService")
	private ChapterManager chapterService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			HttpServletRequest request,
			@RequestParam(value="TITLE",required=false) String TITLE,		//文档标题
			@RequestParam(value="File",required=false) MultipartFile file,		//上传的文件
			@RequestParam(value="LESSON_ID",required=false) String LESSON_ID	//所属课时ID
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增StudyDocument");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//获取存放文件的文件夹位置
		String papersUploadPath = "/static/studydocument";
		String realPapersUploadPath = request.getSession().getServletContext().getRealPath(papersUploadPath);  
		//获取文件的新文件名
		String newName = this.get32UUID();
		//调用FileUpload类中的fileUp方法，上传文件
		String newFileName = FileUpload.fileUp(file, realPapersUploadPath, newName);
		
		pd.put("FILE_PATH", "/static/studydocument/"+newFileName);	//试卷的文件路径
		pd.put("TITLE", TITLE);		//试卷标题
		pd.put("LESSON_ID", LESSON_ID);	//所属专题ID
		pd.put("ADD_USER", Jurisdiction.getUsername());	//添加人
		pd.put("ADD_TIME", new Date());					//添加时间
		pd.put("STUDYDOCUMENT_ID", this.get32UUID());	//主键
		studydocumentService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除StudyDocument");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd = studydocumentService.findById(pd);
		//删除文件
		if(pd.getString("FILE_PATH")!=null){
			//获取文件的真实路径
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.getString("FILE_PATH");
			//调用FileUtil的delFile方法删除文件
			FileUtil.delFile(realPath);

			//同时删除对应的html文件
			String htmlRealPath = realPath.replaceAll(".docx", ".html");
			FileUtil.delFile(htmlRealPath);
			//同时删除对应的img文件
			String htmlImgRealPath = realPath.replaceAll(".docx", "");
			FileUtil.deleteFile(htmlImgRealPath);
		}
		
		studydocumentService.delete(pd);
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
			@RequestParam(value="STUDYDOCUMENT_ID",required=false) String STUDYDOCUMENT_ID,		//文档ID
			@RequestParam(value="TITLE",required=false) String TITLE,		//文档标题
			@RequestParam(value="File",required=false) MultipartFile file,		//上传的文件
			@RequestParam(value="fileChange",required=false) String fileChange,		//
			@RequestParam(value="LESSON_ID",required=false) String LESSON_ID	//所属课时ID
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改StudyDocument");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STUDYDOCUMENT_ID", STUDYDOCUMENT_ID);
		pd = studydocumentService.findById(pd);
		
		if(fileChange!=null){
			//删除原来的文件
			if(pd.getString("FILE_PATH")!=null){
				String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.getString("FILE_PATH");
				FileUtil.delFile(realPath);

			}
			
			//获取存放文件的文件夹位置
			String papersUploadPath = "/static/studydocument";
			String realPapersUploadPath = request.getSession().getServletContext().getRealPath(papersUploadPath);  
			//获取文件的新文件名
			String newName = this.get32UUID();
			//调用FileUpload类中的fileUp方法，上传文件
			String newFileName = FileUpload.fileUp(file, realPapersUploadPath, newName);
			pd.put("FILE_PATH", "/static/studydocument/"+newFileName);	//试卷的文件路径
		}
		
		pd.put("TITLE", TITLE);		//文档标题
		pd.put("LESSON_ID", LESSON_ID);	//所属专题ID
		studydocumentService.edit(pd);
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
	
	/**通过章节id查找所属的课时
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/findLessonListByChapterId")
	public void findLessonListByChapterId(HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");//改编码格式

		PageData chapter = new PageData();
		chapter = this.getPageData();
		
		List<PageData> lessonList = (List<PageData>) lessonService.findLessonsByChapterId(chapter);
		
		JSONArray jsonArray = JSONArray.fromObject(lessonList);
		String dataString = jsonArray.toString();
		response.getWriter().write(dataString);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表StudyDocument");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = studydocumentService.list(page);	//列出StudyDocument列表
		
		/*通过查询出来的LESSON_ID去查找所属的专题名称，并设置到vaiList中*/
		for(int i=0;i<varList.size();i++){
			String lesson_id = varList.get(i).getString("LESSON_ID");
			PageData lessonPD = new PageData();
			lessonPD.put("LESSON_ID", lesson_id);
			lessonPD = lessonService.findById(lessonPD);
			if(lessonPD!=null){
				varList.get(i).put("LESSON_TITLE", lessonPD.getString("TITLE"));
				String chapter_id = lessonPD.getString("CHAPTER_ID");
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
		}
		
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		mv.setViewName("trainingmanage/studydocument/studydocument_list");
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
		
		mv.setViewName("trainingmanage/studydocument/studydocument_edit");
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
		pd = studydocumentService.findById(pd);	//根据ID读取
		
		//查询所有的专题
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		//利用 Lesson_ID 找到课时的Title属性的值
		PageData lesson = new PageData();
		lesson.put("LESSON_ID", pd.get("LESSON_ID") );
		lesson = lessonService.findById(lesson);
		pd.put( "LESSON_TITLE" , lesson.get("TITLE") );
		
		mv.setViewName("trainingmanage/studydocument/studydocument_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除StudyDocument");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			//遍历要删除的数据的id
			for (String id : ArrayDATA_IDS) {
				PageData eachpd = new PageData();
				eachpd.put("STUDYDOCUMENT_ID", id);
				//查询id所属的数据
				eachpd = studydocumentService.findById(eachpd);
				//删除文件
				if(eachpd.getString("FILE_PATH")!=null){
					//获取文件的真实路径
					String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+eachpd.getString("FILE_PATH");
					//调用FileUtil的delFile方法删除文件
					FileUtil.delFile(realPath);
					
					//同时删除对应的html文件
					String htmlRealPath = realPath.replaceAll(".docx", ".html");
					FileUtil.delFile(htmlRealPath);
					//同时删除对应的img文件
					String htmlImgRealPath = realPath.replaceAll(".docx", "");
					FileUtil.deleteFile(htmlImgRealPath);
				}
			}
			
			studydocumentService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出StudyDocument到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("课时id");	//1
		titles.add("文件路径");	//2
		titles.add("标题");	//3
		titles.add("添加人");	//4
		titles.add("添加时间");	//5
		dataMap.put("titles", titles);
		List<PageData> varOList = studydocumentService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("LESSON_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("FILE_PATH"));	//2
			vpd.put("var3", varOList.get(i).getString("TITLE"));	//3
			vpd.put("var4", varOList.get(i).getString("ADD_USER"));	//4
			vpd.put("var5", varOList.get(i).getString("ADD_TIME"));	//5
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
