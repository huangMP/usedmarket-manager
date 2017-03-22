package com.maker.controller.web;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.dto.QueryCondition;
import com.maker.entity.MakerRole;
import com.maker.service.MakerRoleService;
import com.maker.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by huangMP on 2016/11/22.
 * decription : 角色信息 controller
 */
@Controller
@RequestMapping("/WebRole")
public class WebRoleController extends BaseController{

    @Autowired
    MakerRoleService roleService;

    /**
     * 插入一条信息
     * @param role
     * @return 插入成功的数量
     */
    @RequestMapping(value = "/insert")
    @ResponseBody
    public HttpResult insert(MakerRole role) {
        role.setRoleId(UuidUtil.get32UUID());
        if( roleService.insert(role) ){
            return getHttpResult(this.OPERATION_SUCCESS,role);
        }
        return getHttpResult(this.OPERATION_FAILED,role);
    }

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    @RequestMapping(value = "/findByQueryCondition")
    @ResponseBody
    public HttpResult findByQueryCondition(QueryCondition queryCondition){
        return getHttpResult(this.OPERATION_SUCCESS,roleService.findByQueryCondition(queryCondition) );
    }



    /**
     * 修改
     * @param role
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public HttpResult update(MakerRole role){
        return getFrequentlyUsedReturnResultByBool(roleService.update(role));
    }

    /**
     * 删除一条信息
     * @param roleId
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public HttpResult delete(String roleId){
        if( roleService.delete(roleId) ){
            return getHttpResult(this.OPERATION_SUCCESS,null);
        }
        return getHttpResult(this.OPERATION_FAILED,null);
    }
}
