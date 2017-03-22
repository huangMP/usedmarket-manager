package com.fh.controller.app.frontpage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.pagemanage.reservation.ReservationManager;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.Tools;


/** 
 * 说明：服务预约(前台专用controller)
 * 创建人：caishun
 * 创建时间：2016-08-19
 */
@Controller
@RequestMapping(value="/app_reservation")
public class AppReservationController extends BaseController {
	
	@Resource(name="reservationService")
	private ReservationManager reservationService;
	
	@RequestMapping(value="/goPage")
	public ModelAndView goReservation(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("frontpage/demo/reservation");
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 *  var PERSON_NAME = $("#name").val();
          var PHONE_NUMBER = $("#phone").val();
          var MAILBOX = $("#email").val();
          var ID_TYPE = $("#type").val();
          var ID_NUMBER = $("#ID").val();
          var TEXT = $("#text_box").val();
	 */
	@RequestMapping(value="/save")
	public void save(
			HttpServletResponse response,
			String PERSON_NAME,
			String PHONE_NUMBER,
			String MAILBOX,
			String ID_TYPE,
			String ID_NUMBER,
			String TEXT
			) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"新增Reservation");
		response.setContentType("text/html;charset=UTF-8");//改编码格式
		
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("RESERVATION_ID", this.get32UUID());	//主键
		pd.put("ADD_TIME", Tools.date2Str(new Date()));	//提交时间
		pd.put("HANDLED", "否");	//是否已处理
		pd.put("PERSON_NAME", PERSON_NAME);	
		pd.put("PHONE_NUMBER", PHONE_NUMBER);	
		pd.put("MAILBOX", MAILBOX);	
		pd.put("ID_TYPE", ID_TYPE);	
		pd.put("ID_NUMBER", ID_NUMBER);	
		pd.put("TEXT", TEXT);	
		pd.put("HANDLE_PERSON", "--");	//处理人
		reservationService.save(pd);
		response.getWriter().write("success");
//		logAfter(Logger.getLogger("新增Reservation-->success"));
		
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
