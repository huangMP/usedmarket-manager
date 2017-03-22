package com.fh.controller.trainingmanage.classdetail;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.trainingmanage.classandspecial.ClassAndSpecialManager;
import com.fh.service.trainingmanage.classdetail.ClassDetailManager;
import com.fh.service.trainingmanage.special.SpecialManager;
import com.fh.service.trainingmanage.traininguser.TraininguserManager;
import com.fh.service.trainingmanage.userandspecial.impl.UserAndSpecialService;

/** 
 * 说明：班级管理
 * 创建人：liangzhilin
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/classdetail")
public class ClassDetailController extends BaseController {
	
	String menuUrl = "classdetail/list.do"; //菜单地址(权限用)
	@Resource(name="classdetailService")
	private ClassDetailManager classdetailService;
	@Resource(name="specialService")
	private SpecialManager specialService;
	@Resource(name="classandspecialService")
	private ClassAndSpecialManager classAndSpecialService;
	@Resource(name="traininguserService")
	private TraininguserManager traininguserService;
	@Resource(name="userandspecialService")
	private UserAndSpecialService userAndSpecialService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ClassDetail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CLASSDETAIL_ID", this.get32UUID());	//主键
		classdetailService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**添加专题
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/addSpecial")
	public ModelAndView addSpecial(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加专题");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//添加班级专题
		pd.put("CLASSANDSPECIAL_ID", this.get32UUID());	//主键
		classAndSpecialService.save(pd);
		
		//添加学员专题
		pd.put("BZ", CLASSDETAIL_ID);
		page.setPd(pd);
		List<PageData>	userList = traininguserService.listNotAddClass(page);//找已添加的学员
		for(int i = 0;i<userList.size();i++){
			pd = this.getPageData();
			pd.put("USERANDSPECIAL_ID", this.get32UUID());	//主键
			pd.put("USER_ID",userList.get(i).getString("USER_ID"));
			pd.put("SPECIAL_ID",pd.getString("SPECIAL_ID"));
			pd.put("STATUS", 0);	//设置人员为未考试状态
			userAndSpecialService.save(pd);
		}
		
		//跳转显示信息
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);//添加CLASSDETAIL_ID
		page.setPd(pd);
		List<PageData>	varList = classAndSpecialService.listNotAddSpecial(page);//找未添加的专题
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy-MM-dd").format(varList.get(i).get("ADD_TIME")));
			
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		mv.setViewName("trainingmanage/classdetail/classdetail_special");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**添加学员
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/addUser")
	public ModelAndView addUser(Page page,
			@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID,
			@RequestParam(value="USER_ID",required=false) String USER_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加学员");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//添加学员专题
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);//添加CLASSDETAIL_ID
		page.setPd(pd);
		List<PageData>	varList = classAndSpecialService.listAddSpecial(page);//找已添加的专题
		for(int i = 0;i<varList.size();i++){
			pd = this.getPageData();
			pd.put("USERANDSPECIAL_ID", this.get32UUID());	//主键
			pd.put("USER_ID",USER_ID);
			pd.put("SPECIAL_ID",varList.get(i).getString("SPECIAL_ID"));
			pd.put("STATUS", 0);	//设置人员为未考试状态
			userAndSpecialService.save(pd);
		}
		
		//添加班级学员
		pd = this.getPageData();
		pd.put("BZ", CLASSDETAIL_ID);
		pd.put("USER_ID",USER_ID);
		traininguserService.editBz(pd);//将备注添加为班级id
		
		mv.setViewName("trainingmanage/classdetail/classdetail_user");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out,Page page,
			@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除ClassDetail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//移除学员专题及班级专题及学员班级
		pd.put("BZ", CLASSDETAIL_ID);
		page.setPd(pd);
		List<PageData>	userList = traininguserService.listNotAddClass(page);//找已添加的学员
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		page.setPd(pd);
		List<PageData>	varList = classAndSpecialService.listAddSpecial(page);//找已添加的专题
		for(int i=0;i<userList.size();i++){
			pd = this.getPageData();
			
			for(int j = 0; j<varList.size();j++){
				pd.put("USER_ID",userList.get(i).getString("USER_ID"));
				pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
				pd.put("SPECIAL_ID",varList.get(j).getString("SPECIAL_ID"));
				
				//移除学员专题
				userAndSpecialService.delete(pd);

				//移除班级专题
				classAndSpecialService.delete(pd);
			}
			
			//移除学员班级
			pd.put("USER_ID",userList.get(i).getString("USER_ID"));
			pd.put("BZ", "");
			traininguserService.editBz(pd);//将备注添加为班级id --- 置空
			
		}
		
		//删除班级
		pd = this.getPageData();
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		classdetailService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**移除专题
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/delSpecial")
	public ModelAndView delSpecial(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"移除专题");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		//移除学员专题
		pd.put("BZ", CLASSDETAIL_ID);
		page.setPd(pd);
		List<PageData>	userList = traininguserService.listNotAddClass(page);//找已添加的学员
		for(int i=0;i<userList.size();i++){
			pd = this.getPageData();
			pd.put("USER_ID",userList.get(i).getString("USER_ID"));
			pd.put("SPECIAL_ID",pd.getString("SPECIAL_ID"));
			userAndSpecialService.delete(pd);
		}
		
		//移除班级专题
		classAndSpecialService.delete(pd);
		
		//跳转信息
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);//添加CLASSDETAIL_ID
		page.setPd(pd);
		List<PageData>	varList = classAndSpecialService.listAddSpecial(page);//找已添加的专题
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy-MM-dd").format(varList.get(i).get("ADD_TIME")));
			
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		mv.setViewName("trainingmanage/classdetail/classdetail_special_edit");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**移除学员
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/delUser")
	public ModelAndView delUser(Page page,
			@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID,
			@RequestParam(value="USER_ID",required=false) String USER_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"移除学员");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//移除学员专题
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		page.setPd(pd);
		List<PageData>	varList = classAndSpecialService.listAddSpecial(page);//找已添加的专题
		for(int i = 0;i<varList.size();i++){
			pd = this.getPageData();
			pd.put("USER_ID",USER_ID);
			pd.put("SPECIAL_ID",varList.get(i).getString("SPECIAL_ID"));
			
			userAndSpecialService.delete(pd);
		}
		
		//移除学员班级
		pd.put("BZ", "");
		traininguserService.editBz(pd);//将备注添加为班级id --- 置空
		
		mv.setViewName("trainingmanage/classdetail/classdetail_user_edit");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ClassDetail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		classdetailService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表ClassDetail");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = classdetailService.list(page);	//列出ClassDetail列表
		
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy-MM-dd").format(varList.get(i).get("ADD_TIME")));
			
		}
		mv.setViewName("trainingmanage/classdetail/classdetail_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**专题列表（测试）
	 * goto 删除
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listSpecial")
	public ModelAndView listSpecial(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"专题列表");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);//添加CLASSDETAIL_ID
		page.setPd(pd);
		List<PageData>	varList = classAndSpecialService.listNotAddSpecial(page);//找未添加的专题
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy-MM-dd").format(varList.get(i).get("ADD_TIME")));
			
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		mv.setViewName("trainingmanage/classdetail/classdetail_special");
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
		mv.setViewName("trainingmanage/classdetail/classdetail_edit");
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
		pd = classdetailService.findById(pd);	//根据ID读取
		pd.put("ADD_TIME",new SimpleDateFormat("yyyy-MM-dd").format(pd.get("ADD_TIME")));//时间格式
		mv.setViewName("trainingmanage/classdetail/classdetail_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去细阅页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetails")
	public ModelAndView goDetails()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = classdetailService.findById(pd);	//根据ID读取
		pd.put("ADD_TIME",new SimpleDateFormat("yyyy-MM-dd").format(pd.get("ADD_TIME")));//时间格式
		mv.setViewName("trainingmanage/classdetail/classdetail_details");
		
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去添加专题页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goSpecial")
	public ModelAndView goSpecial(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);//添加CLASSDETAIL_ID
		page.setPd(pd);
		List<PageData>	varList = classAndSpecialService.listNotAddSpecial(page);//找未添加的专题
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy-MM-dd").format(varList.get(i).get("ADD_TIME")));
			
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		mv.setViewName("trainingmanage/classdetail/classdetail_special");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		return mv;
	}	
	
	/**去移除专题页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goSpecialEdit")
	public ModelAndView goSpecialEdit(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		page.setPd(pd);
		List<PageData>	varList = classAndSpecialService.listAddSpecial(page);//找已添加的专题
		//处理时间
		for(int i = 0; i < varList.size();i++ ) {
			varList.get(i).put("ADD_TIME",
					new SimpleDateFormat("yyyy-MM-dd").format(varList.get(i).get("ADD_TIME")));
			
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		mv.setViewName("trainingmanage/classdetail/classdetail_special_edit");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		return mv;
	}	
	
	/**去添加学员页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goUser")
	public ModelAndView goUser(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);//添加CLASSDETAIL_ID
		page.setPd(pd);
		List<PageData>	varList = traininguserService.listAddClass(page);//找未添加的学员
		
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		mv.setViewName("trainingmanage/classdetail/classdetail_user");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		return mv;
	}	
	
	/**去移除学员页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goUserEdit")
	public ModelAndView goUserEdit(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("BZ", CLASSDETAIL_ID);
		
		page.setPd(pd);
		List<PageData>	varList = traininguserService.listNotAddClass(page);//找已添加的学员
		
		pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
		mv.setViewName("trainingmanage/classdetail/classdetail_user_edit");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ClassDetail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			
			//移除学员专题及班级专题及学员班级
			for(int c = 0 ;c<ArrayDATA_IDS.length;c++){
				pd = this.getPageData();
				String bz = ArrayDATA_IDS[c];
				System.out.println(bz);
				
				pd.put("BZ", bz);
				page.setPd(pd);
				List<PageData>	userList = traininguserService.listNotAddClass(page);//找已添加的学员
				pd.put("CLASSDETAIL_ID", bz);
				page.setPd(pd);
				List<PageData>	varList = classAndSpecialService.listAddSpecial(page);//找已添加的专题
				for(int i=0;i<userList.size();i++){
					pd = this.getPageData();
					
					for(int j = 0; j<varList.size();j++){
						pd.put("USER_ID",userList.get(i).getString("USER_ID"));
						pd.put("CLASSDETAIL_ID", bz);
						pd.put("SPECIAL_ID",varList.get(j).getString("SPECIAL_ID"));
						
						//移除学员专题
						userAndSpecialService.delete(pd);

						//移除班级专题
						classAndSpecialService.delete(pd);
					}
					
					//移除学员班级
					pd.put("USER_ID",userList.get(i).getString("USER_ID"));
					pd.put("BZ", "");
					traininguserService.editBz(pd);//将备注添加为班级id --- 置空
					
				}
			}

			//删除班级
			pd = this.getPageData();
			
			classdetailService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**批量添加专题
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/addSpecialAll")
	@ResponseBody
	public Object addSpecialAll(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量添加专题");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			//添加班级专题
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				pd = this.getPageData();
				pd.put("CLASSANDSPECIAL_ID", this.get32UUID());	//主键
				pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
				pd.put("SPECIAL_ID", ArrayDATA_IDS[i]);
				classAndSpecialService.save(pd);	
			}
			
			//添加专题学员
			pd.put("BZ", CLASSDETAIL_ID);
			page.setPd(pd);
			List<PageData>	userList = traininguserService.listNotAddClass(page);//找已添加的学员
			for(int i = 0;i<userList.size();i++){
				for(int j=0;j<ArrayDATA_IDS.length;j++){
					pd = this.getPageData();
					pd.put("USERANDSPECIAL_ID", this.get32UUID());	//主键
					pd.put("USER_ID",userList.get(i).getString("USER_ID"));
					pd.put("SPECIAL_ID", ArrayDATA_IDS[j]);
					pd.put("STATUS", 0);	//设置人员为未考试状态
					userAndSpecialService.save(pd);
				}
			}
			
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**批量移除专题
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/delSpecialAll")
	@ResponseBody
	public Object delSpecialAll(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量移除专题");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			//移除学员专题表
			pd.put("BZ", CLASSDETAIL_ID);
			page.setPd(pd);
			List<PageData>	userList = traininguserService.listNotAddClass(page);//找已添加的学员	
			for(int i=0;i<userList.size();i++){
				for(int j = 0;j<ArrayDATA_IDS.length;j++){
					pd = this.getPageData();
					pd.put("USER_ID",userList.get(i).getString("USER_ID"));
					pd.put("SPECIAL_ID",ArrayDATA_IDS[j]);
					userAndSpecialService.delete(pd);
				}
			}
			
			//移除班级专题
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				pd = this.getPageData();
				pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);
				pd.put("SPECIAL_ID", ArrayDATA_IDS[i]);
				classAndSpecialService.delete(pd);	
			}
			
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**批量添加学员
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/addUserAll")
	@ResponseBody
	public Object addUserAll(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量添加学员");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");

			pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);//添加CLASSDETAIL_ID
			page.setPd(pd);
			List<PageData>	varList = classAndSpecialService.listAddSpecial(page);//找已添加的专题
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				
				//添加学员专题
				for(int j = 0;j<varList.size();j++){
					pd = this.getPageData();
					pd.put("USERANDSPECIAL_ID", this.get32UUID());	//主键
					pd.put("USER_ID",ArrayDATA_IDS[i]);
					pd.put("SPECIAL_ID",varList.get(j).getString("SPECIAL_ID"));
					pd.put("STATUS", 0);	//设置人员为未考试状态
					userAndSpecialService.save(pd);
				}
				
				//添加班级学员
				pd = this.getPageData();
				pd.put("BZ", CLASSDETAIL_ID);
				pd.put("USER_ID",ArrayDATA_IDS[i]);
				traininguserService.editBz(pd);//将备注添加为班级id
				
			}
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**批量移除学员
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/delUserAll")
	@ResponseBody
	public Object delUserAll(Page page,@RequestParam(value="CLASSDETAIL_ID",required=false) String CLASSDETAIL_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量移除学员");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			
			pd.put("CLASSDETAIL_ID", CLASSDETAIL_ID);//添加CLASSDETAIL_ID
			page.setPd(pd);
			List<PageData>	varList = classAndSpecialService.listAddSpecial(page);//找已添加的专题
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				
				//移除学员专题
				for(int j = 0;j<varList.size();j++){
					pd = this.getPageData();
					pd.put("USER_ID",ArrayDATA_IDS[i]);
					pd.put("SPECIAL_ID",varList.get(j).getString("SPECIAL_ID"));
					userAndSpecialService.delete(pd);
				}
				
				//移除学员班级
				pd = this.getPageData();
				pd.put("BZ", "");//置空
				pd.put("USER_ID",ArrayDATA_IDS[i]);
				traininguserService.editBz(pd);//将备注添加为班级id
				
			}
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
		logBefore(logger, Jurisdiction.getUsername()+"导出ClassDetail到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("姓名");	//1
		titles.add("添加人");	//2
		titles.add("添加时间");	//3
		dataMap.put("titles", titles);
		List<PageData> varOList = classdetailService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("ADD_USER"));	//2
			vpd.put("var3", varOList.get(i).getString("ADD_TIME"));	//3
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
