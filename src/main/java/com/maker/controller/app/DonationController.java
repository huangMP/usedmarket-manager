package com.maker.controller.app;

import com.maker.controller.BaseController;
import com.maker.dto.HttpResult;
import com.maker.dto.QueryCondition;
import com.maker.entity.Donation;
import com.maker.service.AttachmentService;
import com.maker.service.DonationService;
import com.maker.util.NarrowImage;
import com.maker.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Date;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 捐赠 controller
 */
@Controller
@RequestMapping("/AppDonation")
public class DonationController extends BaseController{

    @Autowired
    DonationService donationService;
    @Autowired
    AttachmentService attachmentService;

    /**
     * 上传捐赠
     * @param images 头像（流）
     * @param userId 用户名
     * @param donationName 捐赠名称
     * @param category 分类
     * @param amount 数量
     * @param location 定位
     * @param description 描述
     * @return
     */
    @RequestMapping(value = "/insert")
    @ResponseBody
    public HttpResult insertUserInfo(@RequestParam(value = "images") MultipartFile[] images,
                                     String userId,
                                     String donationName,
                                     String category,
                                     @RequestParam(value = "amount", defaultValue = "1") int amount,
                                     String location,
                                     String description,
                                     String phone
    ) throws IOException {

        Donation donation = new Donation();
        donation.setDonationId(UuidUtil.get32UUID());
        donation.setUserId( userId );
        donation.setDonationName( donationName );
        donation.setCategory( category );
        donation.setAmount( amount );
        donation.setLocation( location );
        donation.setDescription( description );
        donation.setPhone( phone );
        donation.setStatus( 0 );
        donation.setDonationDate( new Date() );

        if (!images[0].isEmpty()) {
            for (MultipartFile image : images) {
                //执行上传
                attachmentService.insert(image, donation.getDonationId(), "2" , NarrowImage.normalNarrowTarget);
            }
        }
        return getFrequentlyUsedReturnResultByBool(donationService.insertDonation(donation));

    }

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    @RequestMapping(value = "/findByQueryCondition")
    @ResponseBody
    public HttpResult findByQueryCondition(QueryCondition queryCondition) {
        return getHttpResult(this.OPERATION_SUCCESS,donationService.findByQueryCondition(queryCondition));
    }
    /**
     * 按条件修改
     * @param donationId
     * @param type 要修改的列
     * @param futrueValue 未来值
     * @return
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public HttpResult editByCondition(String donationId ,String type ,String futrueValue ,String currentValue ,boolean isCheck) {
        return getHttpResult(this.OPERATION_SUCCESS,donationService.editByCondition(donationId ,type ,futrueValue , currentValue ,isCheck ));
    }

}