package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.entity.SubjectHead;
import com.maker.service.SubjectHeadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Description：标题头controller
 * Created by Peivxuan on 2016/11/29.
 */
@Controller
@RequestMapping("/AppSubjectHead")
public class SubjectHeadController extends BaseController{

	@Resource(name = "subjectHeadService")
	private SubjectHeadService subjectHeadService;

	@RequestMapping("/getHead")
	@ResponseBody
	public HttpResult selectAll() {
		return this.getHttpResult("",subjectHeadService.selectAll());
	}

	@RequestMapping("/insert")
	@ResponseBody
	public HttpResult insert(SubjectHead subjectHead) {
		subjectHead.setSubjectHeadId(this.get32UUID());
		subjectHead.setAddDate(new Date());
		subjectHead.setAddUser("tester");
		return this.getFrequentlyUsedReturnResultByBool(this.subjectHeadService.insert(subjectHead));
	}

	@RequestMapping("/delete")
	@ResponseBody
	public HttpResult deleteBySubjectHeadId(String subjectHeadId) {
		return this.getFrequentlyUsedReturnResultByBool(this.subjectHeadService.deleteBySubjectHeadId(subjectHeadId));
	}

	@RequestMapping("/update")
	@ResponseBody
	public HttpResult updateBySubjectHeadId(SubjectHead subjectHead) {
		return this.getFrequentlyUsedReturnResultByBool(this.subjectHeadService.updateBySubjectHeadId(subjectHead));
	}

}
