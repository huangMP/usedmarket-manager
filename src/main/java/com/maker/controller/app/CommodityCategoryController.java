package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.dto.QueryCondition;
import com.maker.service.CommodityCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by huangMP on 2016/11/24.
 * decription : controller
 */
@Controller
@RequestMapping("/AppCommodityCategory")
public class CommodityCategoryController extends BaseController{

    @Resource(name = "commodityCategoryService")
    CommodityCategoryService commodityCategoryService;

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    @RequestMapping(value = "/findByQueryCondition")
    @ResponseBody
    public HttpResult findByQueryCondition(QueryCondition queryCondition) {
        return getHttpResult(this.OPERATION_SUCCESS,commodityCategoryService.findByQueryCondition(queryCondition));
    }


}
