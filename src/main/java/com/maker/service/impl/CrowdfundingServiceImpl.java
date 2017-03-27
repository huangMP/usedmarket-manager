package com.maker.service.impl;

import com.alibaba.druid.sql.visitor.functions.Concat;
import com.fh.service.makermanager.picture_used_details.Picture_Used_DetailsManager;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.maker.dao.CrowdfundingDao;
import com.maker.dto.CommodityCategoryCustom;
import com.maker.dto.CrowdfundingCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.Attachment;
import com.maker.entity.Crowdfunding;
import com.maker.service.CrowdfundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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

    @Resource(name="picture_used_detailsService")
    private Picture_Used_DetailsManager picture_used_detailsService;

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

        crowdfundingCustoms = findPictures(crowdfundingCustoms);

        return crowdfundingCustoms;
    }

    /**
     * CrowdfundingCustom 给每一个 item 填充图片
     */
    private List<CrowdfundingCustom> findPictures(List<CrowdfundingCustom> list){
        if( list.size()>0 ){
            for(CrowdfundingCustom item : list ){
                String itemId = item.getCrowdfundingId();
                List<PageData> pictures = null;
                try {
                    pictures = picture_used_detailsService.selectPicturesByContentId(itemId);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if(pictures.size()>0){
                    List<String> imageList = new ArrayList<String>();
                    List<String> narrowimageList = new ArrayList<String>();
                    for(PageData pictrue : pictures ){
                        imageList.add( Const.FILEPATHIMG + pictrue.getString("PATH") );
                        narrowimageList.add( Const.FILEPATHIMG + pictrue.getString("PATH") );
                    }
                    item.setImgs(imageList);
                    item.setNarrowImgs(narrowimageList);
                }
            }

        }
        return list;
    }


    /**
     *  给每 CrowdfundingCustom 填充图片
     */
    private CrowdfundingCustom findPictures(CrowdfundingCustom crowdfundingCustom){
        if( crowdfundingCustom != null ){
            String itemId = crowdfundingCustom.getCrowdfundingId();
            List<PageData> pictures = null;
            try {
                pictures = picture_used_detailsService.selectPicturesByContentId(itemId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if( pictures.size() > 0 ) {
                List<String> imageList = new ArrayList<String>();
                List<String> narrowimageList = new ArrayList<String>();
                for(PageData pictrue : pictures ){
                    imageList.add( Const.FILEPATHIMG + pictrue.getString("PATH") );
                    narrowimageList.add( Const.FILEPATHIMG + pictrue.getString("PATH") );
                }
                crowdfundingCustom.setImgs(imageList);
                crowdfundingCustom.setNarrowImgs(narrowimageList);
            }
        }
        return crowdfundingCustom;
    }
}
