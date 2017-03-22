package com.fh.controller.base;


import javax.servlet.http.HttpServletRequest;

import com.maker.dto.HttpResult;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fh.entity.Page;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

/**
 * @author liangzhilin
 * 修改时间：2015、12、11
 */
public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;
	
	/** new PageData对象
	 * @return
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**得到ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**得到request对象
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	/**得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	/**得到分页列表的信息
	 * @return
	 */
	public Page getPage(){
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}


	/**
	 * 操作成功
	 */
	protected static final String OPERATION_SUCCESS = "操作成功";

	/**
	 * 操作失败
	 */
	protected static final String OPERATION_FAILED = "操作失败";

	/**
	 * 操作重复
	 */
	protected  static final String OPERATION_REPETITION = "操作重复";

	/**
	 * 返回HttpResult
	 * @param resultCenter 回显信息
	 * @param data 数据
	 * @param <T> 泛型
	 * @return
	 */
	protected  <T> HttpResult getHttpResult(String resultCenter, T data) {
		return new HttpResult<T>(resultCenter,data);
	}

	/**
	 * 常用结果
	 * @param b 控制
	 * @return
	 */
	protected HttpResult getFrequentlyUsedReturnResultByBool(Boolean b) {
		return b ?
				this.getHttpResult(BaseController.OPERATION_SUCCESS,"") : this.getHttpResult(BaseController.OPERATION_FAILED,"");
	}
	
}
