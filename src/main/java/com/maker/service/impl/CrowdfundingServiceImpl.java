package com.maker.service.impl;

import com.maker.dao.CrowdfundingDao;
import com.maker.dto.CrowdfundingCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.Attachment;
import com.maker.entity.Crowdfunding;
import com.maker.service.CrowdfundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by huangMP on 2016/11/24.
 * decription : Service层实现
 */
@Service("crowdfundingService")
public class CrowdfundingServiceImpl implements CrowdfundingService {

    @Autowired
    CrowdfundingDao crowdfundingDao;

    @Override
    public boolean insert(Crowdfunding crowdfunding) {
        return  crowdfundingDao.insert(crowdfunding) == 1 ? true : false ;
    }

    @Override
    public Crowdfunding findByCrowdfundingId(String crowdfundingId) {
        return crowdfundingDao.findByCrowdfundingId(crowdfundingId);
    }

    @Override
    public Crowdfunding findByaddUser(String addUser) {
        return crowdfundingDao.findByaddUser(addUser);
    }

    @Override
    public boolean update(Crowdfunding crowdfunding) {
        return  crowdfundingDao.update(crowdfunding) == 1 ? true : false ;
    }

    @Override
    public boolean delete(String crowdfundingId) {
        return crowdfundingDao.delete(crowdfundingId) == 1 ? true : false ;
    }

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    @Override
    public List<CrowdfundingCustom> findByQueryCondition(QueryCondition queryCondition) {


        List<CrowdfundingCustom> crowdfundingCustoms = crowdfundingDao.findByQueryCondition(queryCondition);

        if (crowdfundingCustoms.size() == 0) {
            return crowdfundingCustoms;
        }

        System.out.println("找到捐赠物品条目:"+crowdfundingCustoms.size());

        List<Attachment> attachments = crowdfundingDao.loadImages(crowdfundingCustoms);
        System.out.println("总的图片数量:" + attachments.size() );

        for( int i=0;i<crowdfundingCustoms.size();i++ ){
            List<String> imageList = new ArrayList<String>();
            List<String> narrowimageList = new ArrayList<String>();
            for(int j=0;j<attachments.size();j++){
                System.out.println(attachments.get(j).getContentId());
                if( crowdfundingCustoms.get(i).getCrowdfundingId().equals( attachments.get(j).getContentId() ) ){
                    System.out.println(attachments.get(j).getContentId());
                    imageList.add( attachments.get(j).getFilePath() );
                    narrowimageList.add( attachments.get(j).getNarrowImagePath() );
                }
            }
            crowdfundingCustoms.get(i).setImgs( imageList );
            crowdfundingCustoms.get(i).setNarrowImgs( narrowimageList );
        }

        return crowdfundingCustoms;
    }
}
