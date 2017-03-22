package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.CommodityQueryCondition;
import com.maker.dto.HttpResult;
import com.maker.dto.QueryCondition;
import com.maker.dto.UserInfoCustom;
import com.maker.entity.UserInfo;
import com.maker.service.AttachmentService;
import com.maker.service.CommodityService;
import com.maker.service.UserInfoService;
import com.maker.util.NarrowImage;
import com.maker.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 用户信息 controller
 */
@Controller
@RequestMapping("/AppUserInfo")
public class UserInfoController extends BaseController{

    @Autowired
    CommodityService commodityService;

    @Autowired
    UserInfoService userInfoService;
    @Autowired
    AttachmentService attachmentService;

    /**
     * 用户注册
     * @param headPortrait 头像（流）
     * @param username 用户名
     * @param password 密码
     * @param sex 性别
     * @param phone 手机
     * @return
     */
    @RequestMapping(value = "/insert")
    @ResponseBody
    public HttpResult insertUserInfo(
            @RequestParam(value="headPortrait") MultipartFile headPortrait,
            @RequestParam(value="username") String username,
            @RequestParam(value="password") String password,
            @RequestParam(value = "sex", defaultValue = "9") int sex,
            @RequestParam(value="phone") String phone
    ) throws IOException {

        //判断接受到的信息是否正确
        if(
                ("".equals(password.trim()) || null == password) ||
                        ("".equals(username.trim()) || null == username) ||
                        ("".equals(phone.trim()) || null == phone) ||
                        (sex != 0 && sex != 1) ||
                        (headPortrait == null || headPortrait.isEmpty())
                ){
            return getHttpResult(this.OPERATION_FAILED,null);
        }

        //通过用户名向数据库查询UserInfo
        UserInfo userInfoInDatabase = userInfoService.findByUsername( username.trim() );

        //如果该用户名已存在
        if( null != userInfoInDatabase ){
            return getHttpResult(this.OPERATION_FAILED,null);
        }

        UserInfo userInfo = new UserInfo();
        userInfo.setUserId(UuidUtil.get32UUID());    //设置UUID主键
        userInfo.setUsername(username);    //设置用户名
        userInfo.setPassword(password.trim());    //设置密码
        userInfo.setSex(sex);    //设置性别
        userInfo.setPhone(phone);    //设置手机
        userInfo.setRegistrationDate(new Date());    //设置时间


        String attachmentId = attachmentService.insert(headPortrait, userInfo.getUserId(), "0",NarrowImage.smallNarrowTarget);
        userInfo.setAttachmentId(attachmentId);    //设置附件Id

        //向数据库添加一条用户信息
        userInfoService.insertUserInfo( userInfo );
        return getHttpResult(this.OPERATION_SUCCESS,userInfo);
    }

    /**
     * 用户登录
     * @param userInfo //用户名：username  密码：password
     * @return
     */
    @RequestMapping(value = "/login")
    @ResponseBody
    public HttpResult login(UserInfo userInfo) {

        //判断接受到的信息是否正确
        if (
                null == userInfo.getUsername().trim() || "".equals(userInfo.getUsername().trim()) ||
                        null == userInfo.getPassword().trim() || "".equals(userInfo.getPassword().trim())
                ) {
            return getHttpResult(this.OPERATION_FAILED,userInfo);
        }

        //通过用户名向数据库查询UserInfo
        List<UserInfoCustom> userInfoCustoms = userInfoService.findByQueryCondition(new QueryCondition("username", userInfo.getUsername().trim(), "", "", "", 0, 10));
        if(userInfoCustoms.size()!=1){
            return getHttpResult(this.OPERATION_FAILED,userInfo);
        }
        UserInfoCustom userInfoCustom = userInfoCustoms.get(0);
        //判断密码是否输入正确
        if (userInfoCustom.getPassword().trim().equals(userInfo.getPassword().trim())) {
            return getHttpResult(this.OPERATION_SUCCESS,userInfoCustom);
        }
        return getHttpResult(this.OPERATION_FAILED,userInfo);
    }

    /**
     * 修改头像
     *
     * @param headPortrait //用户Id：userId  头像：headPortrait
     * @return
     */
    @RequestMapping(value = "/editHeadPortrait")
    @ResponseBody
    public HttpResult editHeadPortrait(
            @RequestParam(value = "headPortrait") MultipartFile headPortrait,
            @RequestParam(value = "userId") String userId
    ) {

        //判断接受到的信息是否正确
        if (
                ("".equals(userId.trim()) || null == userId) ||
                        (headPortrait == null || headPortrait.isEmpty())
                ) {
            return getHttpResult(this.OPERATION_FAILED,null);
        }

        //通过用户Id向数据库查询UserInfo
        UserInfo userInfoInDatabase = userInfoService.findByUserId(userId.trim());

        //判断该用户是否存在
        if (null == userInfoInDatabase) {
            return getHttpResult(this.OPERATION_SUCCESS,null);
        }

        //更新附件路径
        attachmentService.update(userInfoInDatabase.getAttachmentId(), headPortrait, NarrowImage.smallNarrowTarget);

        //保存到数据库
        userInfoService.updateUserInfo(userInfoInDatabase);

        return getFrequentlyUsedReturnResultByBool(userInfoService.updateUserInfo(userInfoInDatabase));
    }

    /**
     * 按列修改 (修改头像不可用)
     *
     * @param userId 用户Id
     * @param index 修改的属性
     * @param currentValue 当前值
     * @param futureValue 未来值
     * @return UserInfo
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public HttpResult edit(String userId, String index, String currentValue, String futureValue) {
        UserInfoCustom userInfoCustom = userInfoService.update(userId.trim(), index.trim(), currentValue.trim(), futureValue.trim());
        return userInfoCustom != null ?
                getHttpResult(this.OPERATION_SUCCESS,userInfoCustom) :
                getHttpResult(this.OPERATION_FAILED,userInfoCustom);
    }

    /**
     * 根据userId查询该用户上传的二手商品数量
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "/findCommodityCustomByUserId")
    @ResponseBody
    public HttpResult findCommodityCustomByUserId(String userId,int index) {
        CommodityQueryCondition commodityQueryCondition = new CommodityQueryCondition();
        commodityQueryCondition.setType("t_commodity.user_id");
        commodityQueryCondition.setIndex(index);
        commodityQueryCondition.setQueryValue(userId.trim());
        return getHttpResult(this.OPERATION_SUCCESS,commodityService.findCommodityByQueryCondition(commodityQueryCondition));
    }

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    @RequestMapping(value = "/findByQueryCondition")
    @ResponseBody
    HttpResult findByQueryCondition(QueryCondition queryCondition){
        return getHttpResult(this.OPERATION_SUCCESS,userInfoService.findByQueryCondition(queryCondition));
    }

}