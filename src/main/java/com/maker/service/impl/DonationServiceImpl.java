package com.maker.service.impl;

import com.maker.dao.DonationDao;
import com.maker.dto.DonationCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.Attachment;
import com.maker.entity.Donation;
import com.maker.service.DonationService;
import com.maker.util.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 捐赠物品信息 Service层实现
 */
@Service("donationService")
public class DonationServiceImpl implements DonationService {

    @Autowired
    DonationDao donationDao;

    /**
     * 插入一条信息
     * @param donation
     * @return 插入成功的数量
     */
    @Override
    public boolean insertDonation(Donation donation) {
        return 1 == donationDao.insert(donation) ? true : false;
    }

    @Override
    public List<DonationCustom> findByQueryCondition(QueryCondition queryCondition) {

        //取出10条commodity
        List<DonationCustom> donationCustoms = donationDao.findByQueryCondition(queryCondition);

        if (donationCustoms.size() == 0) {
            return donationCustoms;
        }

        System.out.println("找到捐赠物品条目:"+donationCustoms.size());

        List<Attachment> attachments = donationDao.loadImages(donationCustoms);
        System.out.println("总的图片数量:" + attachments.size() );

        for( int i=0;i<donationCustoms.size();i++ ){
            List<String> imageList = new ArrayList<String>();
            List<String> narrowimageList = new ArrayList<String>();
            for(int j=0;j<attachments.size();j++){
                if( donationCustoms.get(i).getDonationId().equals( attachments.get(j).getContentId() ) ){
                    imageList.add( attachments.get(j).getFilePath() );
                    narrowimageList.add( attachments.get(j).getNarrowImagePath() );
                }
            }
            donationCustoms.get(i).setDonationImgs( imageList );
            donationCustoms.get(i).setNarrowDonationImgs( narrowimageList );
        }

        return donationCustoms;
    }

    /**
     * 按列修改
     * @param donationId
     * @param type
     * @param futrueValue
     * @param currentValue
     * @param isCheck
     * @return
     */
    @Override
    public DonationCustom editByCondition(String donationId, String type, String futrueValue , String currentValue , boolean isCheck) {

        if( "donationId".equals(type.trim()) || "userId".equals(type.trim()) || "donationDate".equals(type.trim()) ){
            System.out.println("这一列不允许改动 : "+ type );
            return null;
        }



        DonationCustom donationCustomInDatabase = donationDao.findDonationCustomByDonationId(donationId);
        if( null == donationCustomInDatabase){
            System.out.println("donationId输入有误!");
            return null;
        }
        Map map = MapUtils.transBean2Map(donationCustomInDatabase);

        if( "donationName".equals(type.trim()) || "category".equals(type.trim()) || "location".equals(type.trim()) || "description".equals(type.trim()) || "phone".equals(type.trim()) ){

            if( isCheck ){
                String currentValueInDatabase = (String) map.get(type);
                if( null == currentValueInDatabase || "".equals(currentValueInDatabase)){
                    System.out.println("第一次添加 : "+ type + ",无需校验");
                    map.put(type,futrueValue);
                }else if( currentValueInDatabase.equals(currentValue) ){
                    System.out.println(type + " 检验成功");
                    map.put(type,futrueValue);
                }else{
                    System.out.println("信息有误！");
                    return null;
                }
            }else{
                System.out.println("无需修改，直接更新 : " + type );
                map.put(type,futrueValue);
            }

        }else if(  "amount".equals(type.trim()) || "status".equals(type.trim()) ){

            if( isCheck ){
                int currentValueInDatabase = (Integer) map.get(type);
                if( 0 == currentValueInDatabase ){
                    System.out.println("第一次添加 : "+ type + ",无需校验");
                    map.put(type,futrueValue);
                }else if( currentValueInDatabase == Integer.valueOf( currentValue ) ){
                    System.out.println(type + " 检验成功");
                    map.put(type, Integer.valueOf( futrueValue ));
                }else{
                    System.out.println("信息有误！");
                    return null;
                }
            }else{
                System.out.println("无需修改，直接更新 : " + type );
                map.put(type,futrueValue);
            }
        }else {
            System.out.println("接收到的type类型错误");
            return null;
        }

        donationCustomInDatabase = (DonationCustom) MapUtils.transMap2Bean2(map, donationCustomInDatabase);
        if( 0 != donationDao.update(donationCustomInDatabase) ){
            System.out.println("这一列数据已经更新 : " + type);
            return donationCustomInDatabase;
        }
        System.out.println("这一列数据更新失败: " + type);
        return null;

    }
}
