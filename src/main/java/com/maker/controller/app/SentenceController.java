package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.dto.SentenceQueryCondition;
import com.maker.entity.SentenceBean;
import com.maker.service.SentenceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Description：单文字的controller（跑马条、推荐）
 * Created by Peivxuan on 2016/11/27.
 */
@Controller
@RequestMapping("/AppSentence")
public class SentenceController extends BaseController {

	@Resource(name = "sentenceService")
	private SentenceService sentenceService;

	@RequestMapping(value = "/select")
	@ResponseBody
	public HttpResult selectSentencesByCondition(SentenceQueryCondition sentenceQueryCondition) {
		return this.getHttpResult("", sentenceService.selectSentencesByCondition(sentenceQueryCondition));
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public HttpResult insert(SentenceBean sentenceBean) {
		System.out.println(sentenceBean.toString());
		sentenceBean.setSentenceId(this.get32UUID());
		sentenceBean.setAddDate(new Date());
		return this.getFrequentlyUsedReturnResultByBool(sentenceService.insert(sentenceBean));
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	public HttpResult delete(String sentenceId) {
		return this.getFrequentlyUsedReturnResultByBool(sentenceService.deleteBySentenceId(sentenceId));
	}

	@RequestMapping(value = "/update")
	@ResponseBody
	public HttpResult update(SentenceBean sentenceBean) {
		return this.getFrequentlyUsedReturnResultByBool(sentenceService.updateBySentenceId(sentenceBean));
	}

}
