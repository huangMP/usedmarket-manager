package com.fh.controller.trainingmanage.video;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.pagemanage.singleImg.SingleImgManager;
import com.fh.service.trainingmanage.chapter.ChapterManager;
import com.fh.service.trainingmanage.lesson.LessonManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.service.trainingmanage.video.VideoManager;
import com.fh.util.AppUtil;
import com.fh.util.FileUpload;
import com.fh.util.FileUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 说明：视频表
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/video")
public class VideoController extends BaseController {
	
	String menuUrl = "video/list.do"; //菜单地址(权限用)
	@Resource(name="videoService")
	private VideoManager videoService;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
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
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="LESSON_ID",required=false) String LESSON_ID,
			@RequestParam(value = "video", required = false)MultipartFile videoFile,
			@RequestParam(value="image",required=false) CommonsMultipartFile imageFile
			) throws Exception{
		
		logBefore(logger, Jurisdiction.getUsername()+"新增Video");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//获取存放文件的文件夹位置
		String papersUploadPath = "/static/videos";
		String realPapersUploadPath = request.getSession().getServletContext().getRealPath(papersUploadPath);  
		//获取文件的新文件名
		String newName = this.get32UUID();
		//调用FileUpload类中的fileUp方法，上传文件
		String newFileName = FileUpload.fileUp(videoFile, realPapersUploadPath, newName);
		
		//处理图片
		String imageUrl = null;
		if(imageFile!=null){
			if(imageFile.getSize()>0){
		        String uploadPath ="/static/images";	
				String realUploadPath = request.getSession().getServletContext().getRealPath(uploadPath);
				imageUrl = singleImgService.uploadImage(imageFile, uploadPath, realUploadPath,this.get32UUID());
				request.getSession().removeAttribute("image");
			}
		}
		
		pd.put("TITLE", TITLE);
		pd.put("LESSON_ID", LESSON_ID);
		pd.put("FILE_PATH", "/static/videos/"+newFileName);	//试卷的文件路径
		pd.put("IMG_PATH", imageUrl);
		pd.put("VIDEO_ID", this.get32UUID());	//主键
		pd.put("ADD_TIME", new Date());			//添加时间
		pd.put("ADD_USER", Jurisdiction.getUsername());	//添加人
		videoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Video");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//查找要删除的数据
		pd = videoService.findById(pd);
		//删除视频
		if(pd.getString("FILE_PATH")!=null){
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("FILE_PATH");
			FileUtil.delFile(realPath);
		}
		//删除图片
		if(pd.get("IMG_PATH")!=null){
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
			singleImgService.delete(realPath);
		}
				
		videoService.delete(pd);
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
			@RequestParam(value="VIDEO_ID",required=false) String VIDEO_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="LESSON_ID",required=false) String LESSON_ID,
			@RequestParam(value = "video", required = false)MultipartFile videoFile,
			@RequestParam(value="videoChange",required=false) String videoChange,		
			@RequestParam(value="image",required=false) CommonsMultipartFile imageFile,
			@RequestParam(value="imgChange",required=false) String imgChange		
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Video");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		System.out.println(pd.get("LESSON_ID"));
		
		//查找需要进行修改的数据
		pd.put("VIDEO_ID",VIDEO_ID);
		pd = videoService.findById(pd);
		
		
		//如果修改了视频
		if(videoChange!=null){
			
			//需要删除原来的视频
			if(pd.getString("FILE_PATH")!=null){
				String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("FILE_PATH");
				FileUtil.delFile(realPath);
			}

			//获取存放文件的文件夹位置
			String papersUploadPath = "/static/videos";
			String realPapersUploadPath = request.getSession().getServletContext().getRealPath(papersUploadPath);  
			//获取文件的新文件名
			String newName = this.get32UUID();
			//调用FileUpload类中的fileUp方法，上传文件
			String newFileName = FileUpload.fileUp(videoFile, realPapersUploadPath, newName);
			
			pd.put("FILE_PATH", "/static/videos/"+newFileName);	//试卷的文件路径
		}
		
		//如果修改了图片
		if(imgChange!=null){
			
			//需要删除原来的图片
			if(pd.get("IMG_PATH")!=null){
				String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
				singleImgService.delete(realPath);
			}
			
			//处理新图片
			String imageUrl = null;
			if(imageFile!=null){
				if(imageFile.getSize()>0){
			        String uploadPath ="/static/images";	
					String realUploadPath = request.getSession().getServletContext().getRealPath(uploadPath);
					imageUrl = singleImgService.uploadImage(imageFile, uploadPath, realUploadPath,this.get32UUID());
					request.getSession().removeAttribute("image");
				}
			}
			pd.put("IMG_PATH", imageUrl);
		}

		pd.put("TITLE", TITLE);		//文档标题
		pd.put("LESSON_ID", LESSON_ID);	//所属专题ID
		videoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Video");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("selectValue");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = videoService.list(page);	//列出Video列表
		
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
		
		//查询所有的专题
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		mv.setViewName("trainingmanage/video/video_list");
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
		
		mv.setViewName("trainingmanage/video/video_edit");
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
		pd = videoService.findById(pd);	//根据ID读取
		
		//查询所有的专题
		PageData special = new PageData();
		List<PageData> specialList = specialService.listAll(special);
		mv.addObject("specialList", specialList);
		
		//利用 Lesson_ID 找到课时的Title属性的值
		PageData lesson = new PageData();
		lesson.put("LESSON_ID", pd.get("LESSON_ID") );
		lesson = lessonService.findById(lesson);
		pd.put( "LESSON_TITLE" , lesson.get("TITLE") );
		
		mv.setViewName("trainingmanage/video/video_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Video");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			
			//删除选中的选项的视频和图片
			for (String id : ArrayDATA_IDS) {
				PageData eachpd = new PageData();
				eachpd.put("VIDEO_ID", id);
				eachpd = videoService.findById(eachpd);
				
				//删除视频
				if(eachpd.getString("FILE_PATH")!=null){
					String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+eachpd.getString("FILE_PATH");
					//调用FileUtil的delFile方法删除文件
					FileUtil.delFile(realPath);
				}
				
				//删除图片
				if(eachpd.getString("IMG_PATH") != null){
					String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+eachpd.getString("IMG_PATH");
					singleImgService.delete(realPath);
				}
				
			}
			
			//删除数据库数据
			videoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Video到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("课时id");	//1
		titles.add("文件路径");	//2
		titles.add("标题");	//3
		titles.add("图片路径");	//4
		titles.add("添加人");	//5
		titles.add("添加时间");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = videoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("LESSON_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("FILE_PATH"));	//2
			vpd.put("var3", varOList.get(i).getString("TITLE"));	//3
			vpd.put("var4", varOList.get(i).getString("IMG_PATH"));	//4
			vpd.put("var5", varOList.get(i).getString("ADD_USER"));	//5
			vpd.put("var6", varOList.get(i).getString("ADD_TIME"));	//6
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
