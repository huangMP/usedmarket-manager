package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.dto.QueryCondition;
import com.maker.service.CrowdfundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by huangMP on 2016/11/26.
 * decription : Controller
 */
@Controller
@RequestMapping("/AppCrowdfunding")
public class CrowdfundingController extends BaseController{

    @Resource(name = "crowdfundingService")
    CrowdfundingService crowdfundingService;

    @RequestMapping(value = "/delete")
    @ResponseBody
    public HttpResult delete(String crowdfundingId) {
        return getFrequentlyUsedReturnResultByBool(crowdfundingService.delete(crowdfundingId));
    }

    @RequestMapping(value = "/findByQueryCondition")
    @ResponseBody
    public HttpResult findByQueryCondition(QueryCondition queryCondition){
        return getHttpResult(this.OPERATION_SUCCESS,crowdfundingService.findByQueryCondition(queryCondition) );
    }
}
