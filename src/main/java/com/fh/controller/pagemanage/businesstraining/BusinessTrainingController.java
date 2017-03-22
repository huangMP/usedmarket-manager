package com.fh.controller.pagemanage.businesstraining;

import java.io.File;
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
import javax.servlet.http.HttpSession;

import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.fh.util.AppUtil;
import com.fh.util.FileUpload;
import com.fh.util.FileUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.pagemanage.businesstraining.BusinessTrainingManager;
import com.fh.service.pagemanage.singleImg.SingleImgManager;

/** 
 * 说明：业务培训
 * 创建人：liangzhilin
 * 创建时间：2016-08-18
 */
@Controller
@RequestMapping(value="/businesstraining")
public class BusinessTrainingController extends BaseController {
	
	String menuUrl = "businesstraining/list.do"; //菜单地址(权限用)
	@Resource(name="businesstrainingService")
	private BusinessTrainingManager businesstrainingService;
	@Resource(name="singleImgService")
	private SingleImgManager singleImgService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			HttpServletRequest request,
			@RequestParam(value="image",required=false) CommonsMultipartFile image,
			@RequestParam(value = "PATH", required = false)MultipartFile file,
			@RequestParam(value="TITLE",required=false) String TITLE
			) throws Exception{
		
		String imageUrl = null;
		if(image!=null){
			if(image.getSize()>0){
		        String uploadPath ="/static/images";	
				String realUploadPath = request.getSession().getServletContext().getRealPath(uploadPath);
				imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
				request.getSession().removeAttribute("image");
			}
		}
		
        logBefore(logger, Jurisdiction.getUsername()+"新增BusinessTraining");
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
		String newFileName = FileUpload.fileUp(file, realPapersUploadPath, newName);
		
		pd.put("PATH", "/static/videos/"+newFileName);	//视频的文件路径
        pd.put("TITLE", TITLE);
        pd.put("IMG_PATH", imageUrl);
        pd.put("ADDUSER", Jurisdiction.getUsername());	//添加人
		pd.put("ADDTIME", new Date());			//添加时间
		pd.put("VIDEO_ID", this.get32UUID());	//主键
		businesstrainingService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除BusinessTraining");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		//查找要删除的数据
		pd = businesstrainingService.findById(pd);
		//删除视频
		if(pd.getString("PATH")!=null){
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("PATH");
			//调用FileUtil的delFile方法删除文件
			FileUtil.delFile(realPath);
		}
		//删除图片
		if(pd.get("IMG_PATH")!=null){
			
			String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
			System.out.println(realPath);
			singleImgService.delete(realPath);
		}
		
		businesstrainingService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			@RequestParam(value="image",required=false) CommonsMultipartFile image,
			@RequestParam(value="imgChange",required=false) String imgChange,
			@RequestParam(value = "PATH", required = false)MultipartFile file,HttpServletRequest request,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="VIDEO_ID",required=false) String VIDEO_ID,
			@RequestParam(value="videoChange",required=false) String videoChange,
			@RequestParam(value="ADDTIME",required=false) Date ADDTIME,
			@RequestParam(value="ADDUSER",required=false) String ADDUSER,
			@RequestParam(value="SORT",required=false) Integer SORT
			) throws Exception{
		
		logBefore(logger, Jurisdiction.getUsername()+"修改BusinessTraining");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("VIDEO_ID", VIDEO_ID);
		pd = businesstrainingService.findById(pd);
		
		if(videoChange!=null){
			
			//删除视频
			if(pd.getString("PATH")!=null){
				String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("PATH");
				//调用FileUtil的delFile方法删除文件
				FileUtil.delFile(realPath);
			}
			
			//获取存放文件的文件夹位置
			String papersUploadPath = "/static/videos";
			String realPapersUploadPath = request.getSession().getServletContext().getRealPath(papersUploadPath);  
			//获取文件的新文件名
			String newName = this.get32UUID();
			//调用FileUpload类中的fileUp方法，上传文件
			String newFileName = FileUpload.fileUp(file, realPapersUploadPath, newName);
			pd.put("PATH", "/static/videos/"+newFileName);	//视频的文件路径
		}
		//图片更新
		String imageUrl = null;
		if(image!=null){
			//删除原来的图片
			if(pd.get("IMG_PATH")!=null){
				String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+pd.get("IMG_PATH");
				singleImgService.delete(realPath);
			}
			if(image.getSize()>0){
		        String uploadPath ="/static/images";		
				String realUploadPath = request.getSession().getServletContext().getRealPath(uploadPath);
				imageUrl = singleImgService.uploadImage(image, uploadPath, realUploadPath,this.get32UUID());
				pd.put("IMG_PATH", imageUrl);//覆盖
				request.getSession().removeAttribute("image");
			}else {
				if(imgChange!=null){//前台页面点击了重新选择图片，只是没有选图片
					pd.put("IMG_PATH", null);//覆盖
				}
			}
		}
		
		pd.put("TITLE", TITLE);
        pd.put("ADDUSER", ADDUSER);	//添加人
		pd.put("ADDTIME", ADDTIME);			//添加时间
		pd.put("VIDEO_ID", VIDEO_ID);	//主键
		pd.put("SORT", SORT);
		businesstrainingService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表BusinessTraining");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	varList = businesstrainingService.list(page);	//列出BusinessTraining列表
		mv.setViewName("pagemanage/businesstraining/businesstraining_list");
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
		mv.setViewName("pagemanage/businesstraining/businesstraining_edit");
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
		pd = businesstrainingService.findById(pd);	//根据ID读取
		mv.setViewName("pagemanage/businesstraining/businesstraining_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除BusinessTraining");
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
				eachpd = businesstrainingService.findById(eachpd);
				
				//删除视频
				if(eachpd.getString("PATH")!=null){
					String realPath = this.getRequest().getSession().getServletContext().getRealPath("/")+eachpd.get("PATH");
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
			businesstrainingService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 
	
	/**去播放页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail(HttpServletRequest request)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = businesstrainingService.findById(pd);	//根据ID读取
		mv.setViewName("pagemanage/businesstraining/businesstraining_detail");
		mv.addObject("msg", "detail");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 置顶
	 */
	@RequestMapping(value="/setTop")
	public void setTop(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"置顶DocumentGuide");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		businesstrainingService.editMaxSort(pd);
		out.write("success");
		out.close();
	}

	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
