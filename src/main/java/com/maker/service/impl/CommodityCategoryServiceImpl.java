package com.maker.service.impl;

import com.fh.service.makermanager.picture_used_details.Picture_Used_DetailsManager;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.maker.dao.CommodityCategoryDao;
import com.maker.dto.CommodityCategoryCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.CommodityCategory;
import com.maker.service.CommodityCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huangMP on 2016/11/24.
 * decription : Service层实现
 */
@Service("commodityCategoryService")
public class CommodityCategoryServiceImpl implements CommodityCategoryService {

    @Autowired
    CommodityCategoryDao commodityCategoryDao;
    @Resource(name="picture_used_detailsService")
    private Picture_Used_DetailsManager picture_used_detailsService;

    @Override
    public boolean insert(CommodityCategory commodityCategory) {
        return 1 == commodityCategoryDao.insert(commodityCategory)? true : false ;
    }

    @Override
    public boolean delete(String commodityCategoryId) {
        return 1 == commodityCategoryDao.delete(commodityCategoryId) ? true : false ;
    }

    @Override
    public CommodityCategory findByCommodityCategoryId(String commodityCategoryId) {
        return commodityCategoryDao.findByCommodityCategoryId(commodityCategoryId);
    }

    @Override
    public CommodityCategoryCustom findCommodityCategoryCustomByCommodityCategoryId(String commodityCategoryId) {
        CommodityCategoryCustom result = commodityCategoryDao.findCommodityCategoryCustomByCommodityCategoryId(commodityCategoryId);
        result = findPictures(result) ;
        return result;
    }

    @Override
    public List<CommodityCategoryCustom> findAll() {
        List<CommodityCategoryCustom> result = commodityCategoryDao.findAll();
        result = findPictures(result) ;
        return result;
    }

    /**
     * 修改
     * @param commodityCategory
     * @return
     */
    public boolean update(CommodityCategory commodityCategory){
        return 1 == commodityCategoryDao.update(commodityCategory) ? true : false ;
    }


    /**
     * 条件查询
     * @param queryCondition
     * @return
     */
    public List<CommodityCategoryCustom> findByQueryCondition(QueryCondition queryCondition){
        List<CommodityCategoryCustom> result = commodityCategoryDao.findByQueryCondition(queryCondition);
        result = findPictures(result) ;
        return result;
    }

    /**
     * CommodityCategoryCustom 给每一个 item 填充图片
     */
    private List<CommodityCategoryCustom> findPictures(List<CommodityCategoryCustom> list){
        if( list.size()>0 ){
            for(CommodityCategoryCustom item : list ){
                String itemId = item.getCommodityCategoryId();
                List<PageData> pictures = null;
                try {
                    pictures = picture_used_detailsService.selectPicturesByContentId(itemId);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if(pictures.size()>0){
                    item.setPicturePath(Const.FILEPATHIMG + pictures.get(0).getString("PATH"));
                    item.setNarrowPicturePath( Const.FILEPATHIMG + pictures.get(0).getString("PATH"));
                }
            }
        }
        return list;
    }

    /**
     *  给每 CommodityCategoryCustom 填充图片
     */
    private CommodityCategoryCustom findPictures(CommodityCategoryCustom commodityCategoryCustom){
        if( commodityCategoryCustom != null ){
            String itemId = commodityCategoryCustom.getCommodityCategoryId();
            List<PageData> pictures = null;
            try {
                pictures = picture_used_detailsService.selectPicturesByContentId(itemId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if( pictures.size() > 0 ) {
                commodityCategoryCustom.setPicturePath( Const.FILEPATHIMG + pictures.get(0).getString("PATH"));
                commodityCategoryCustom.setNarrowPicturePath( Const.FILEPATHIMG + pictures.get(0).getString("PATH"));
            }
        }
        return commodityCategoryCustom;
    }
}
