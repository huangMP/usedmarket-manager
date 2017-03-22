package com.fh.controller.trainingmanage.traininguser;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.controller.system.appuser.AppuserController;
import com.fh.entity.Page;
import com.fh.entity.system.Role;
import com.fh.service.system.role.RoleManager;
import com.fh.service.trainingmanage.traininguser.TraininguserManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.MD5;
import com.fh.util.PageData;
import com.fh.util.Tools;



/** 
 * 说明：培训用户表
 * 创建人：shunc
 * 创建时间：2016-08-24
 */
@Controller
@RequestMapping(value="/traininguser")
public class TraininguserController extends BaseController {

	
	String menuUrl = "traininguser/list.do"; //菜单地址(权限用)
	@Resource(name="traininguserService")
	private TraininguserManager traininguserService;
	@Resource(name="roleService")
	private RoleManager roleService;
	
	/**显示用户列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView listUsers(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String keywords = pd.getString("keywords");							//检索条件 关键词
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
			page.setPd(pd);
			List<PageData>	userList = traininguserService.listPdPageUser(page);		//列出会员列表
			pd.put("ROLE_ID", "2");
			List<Role> roleList = roleService.listAllRolesByPId(pd);			//列出会员组角色
			mv.setViewName("trainingmanage/traininguser/traininguser_list");
			mv.addObject("userList", userList);
			mv.addObject("roleList", roleList);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增学员");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_ID", this.get32UUID());	//ID
		pd.put("RIGHTS", "");					
		pd.put("LAST_LOGIN", "");				//最后登录时间
		pd.put("IP", "");						//IP
		
		pd.put("ROLE_ID", "1b67fc82ce89457a8347ae53e43a347e"); //将角色固定为初级会员
		pd.put("PASSWORD", MD5.md5(pd.getString("PASSWORD")));
		if(null == traininguserService.findByUsername(pd)){
			traininguserService.saveU(pd);			//判断新增权限
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**自动添加信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/firstAdd")
	public void add(HttpServletResponse response) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增学员信息");

		PageData pd = new PageData();
		JSONObject json =new JSONObject();
		pd = traininguserService.getAppUserNameMax();
		String username = pd.getString("USERNAME");
		//System.out.println(username);
		String year = username.substring(0,4);
		//自动填写账号
		if(year.equals(new SimpleDateFormat("yyyy").format(new Date()))){
			Integer newUserName = Integer.parseInt(username)+1;
			//System.out.println(newUserName);
			json.put("USERNAME", newUserName.toString());//账号
			
		}else{
			json.put("USERNAME", year + String.format("%05d", 1));//账号
		}
		//自动填写密码
		json.put("PASSWORD", "123");//密码为：123
		String newYear = (Integer.parseInt(year)+1)+"-"+ new SimpleDateFormat("MM-dd").format(new Date());
		//自动填写到期时间
		json.put("END_TIME", newYear);//到期时间为一年
		json.put("YEARS", 1);//到期时间为一年
		//out.write("success");
		
		//设置格式为text/json    
	     response.setContentType("text/json"); 
	    //设置字符集为'UTF-8'
	    response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print(json);
		out.close();
	}
	
	/**判断用户名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(traininguserService.findByUsername(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断邮箱是否存在
	 * @return
	 */
	@RequestMapping(value="/hasE")
	@ResponseBody
	public Object hasE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(traininguserService.findByEmail(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasN")
	@ResponseBody
	public Object hasN(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(traininguserService.findByNumber(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**删除用户
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除会员");

		PageData pd = new PageData();
		pd = this.getPageData();
		traininguserService.deleteU(pd);
		out.write("success");
		out.close();
		
	}
	
	/**修改用户
	 * @param out
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView editU(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改学员");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("PASSWORD") != null && !"".equals(pd.getString("PASSWORD"))){
			pd.put("PASSWORD", MD5.md5(pd.getString("PASSWORD")));
		}
		pd.put("ROLE_ID", "1b67fc82ce89457a8347ae53e43a347e"); //将角色固定为初级会员
		traininguserService.editU(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**批量删除
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAllU() {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除会员");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String USER_IDS = pd.getString("USER_IDS");
			if(null != USER_IDS && !"".equals(USER_IDS)){
				String ArrayUSER_IDS[] = USER_IDS.split(",");
				traininguserService.deleteAllU(ArrayUSER_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAddU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		/*PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ROLE_ID", "2");
		List<Role> roleList = roleService.listAllRolesByPId(pd);			//列出会员组角色
		 */		
		
		mv.setViewName("trainingmanage/traininguser/traininguser_add");
		mv.addObject("msg", "save");
//		mv.addObject("pd", pd);
//		mv.addObject("roleList", roleList);
		return mv;
	}
	
	
	/**去修改用户页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEditU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd = traininguserService.findByUiId(pd);//根据ID读取
		mv.setViewName("trainingmanage/traininguser/traininguser_edit");
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
		pd = traininguserService.findByUiId(pd);//根据ID读取
		mv.setViewName("trainingmanage/traininguser/traininguser_details");
		
		mv.addObject("pd", pd);
		return mv;
	}	
}
