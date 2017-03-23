package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.dto.QueryCondition;
import com.maker.entity.Dynamics;
import com.maker.service.DynamicsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by huangMP on 2016/11/18.
 * decription : 动态信息 controller
 */
@Controller("DynamicsController")
@RequestMapping("/AppDynamics")
public class DynamicsController extends BaseController{

    @Resource(name = "dynamicsService")
    DynamicsService dynamicsService;

    /**
     * 通过dynamicsId跳转到展示页面
     * @param dynamicsId
     * @return Dynamics
     */
    @RequestMapping(value = "/displaySchool")
    @ResponseBody
    public ModelAndView displaySchool(String dynamicsId){
        Dynamics dynamics = dynamicsService.findByDynamicsId(dynamicsId);
        if(null != dynamics){
            return getModelAndView("app/dynamics/display" ,"dynamics", dynamics);
        }
        return null;
    }

    /**
     * 通过dynamicsId跳转到展示页面
     * @param dynamicsId
     * @return Dynamics
     */
    @RequestMapping(value = "/displayDonation")
    @ResponseBody
    public ModelAndView displayDonation(String dynamicsId){
        Dynamics dynamics = dynamicsService.findByDynamicsId(dynamicsId);
        if(null != dynamics){
            return getModelAndView("donationdynamics/donationdynamics_display" ,"dynamics", dynamics);
        }
        return null;
    }

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    @RequestMapping(value = "/findDynamicsByQueryCondition")
    @ResponseBody
    public HttpResult findDynamicsByQueryCondition(QueryCondition queryCondition) {
        return getHttpResult(this.OPERATION_SUCCESS,dynamicsService.findDynamicsByQueryCondition(queryCondition));
    }

    /**
     * 创建modelAndView、填充数据、设置视图
     * @param viewName
     * @param objectKey
     * @param objectValue
     * @return
     */
    ModelAndView getModelAndView(String viewName, String objectKey, Dynamics objectValue){
        ModelAndView modelAndView = new ModelAndView();
        if( !"".equals(objectKey) ){
            modelAndView.addObject(objectKey, objectValue);
        }
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
