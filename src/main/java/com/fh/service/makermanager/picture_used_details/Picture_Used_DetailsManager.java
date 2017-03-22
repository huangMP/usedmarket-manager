package com.fh.service.makermanager.picture_used_details;


import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/**
 * 说明： 图片使用详情接口
 */
public interface Picture_Used_DetailsManager {

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    public void save(PageData pd) throws Exception;

    /**
     * 删除
     *
     * @param pd
     * @throws Exception
     */
    public void delete(PageData pd) throws Exception;

    /**
     * 修改
     *
     * @param pd
     * @throws Exception
     */
    public void edit(PageData pd) throws Exception;

    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    public List<PageData> list(Page page) throws Exception;

    /**
     * 列表(全部)
     *
     * @param pd
     * @throws Exception
     */
    public List<PageData> listAll(PageData pd) throws Exception;

    /**
     * 通过id获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception;

    /**
     * 批量删除
     *
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception;

    /**
     * 通过 contentId 查找相应的图片
     *
     * @param contentId
     * @return
     * @throws Exception
     */
    public List<PageData> selectPicturesByContentId(String contentId) throws Exception;

    /**
     * 通过 pictureId 删除
     *
     * @param pictureID
     * @throws Exception
     */
    public void deleteByPictureID(String pictureID) throws Exception;

    /**
     * 通过 PICTURE_ID 批量删除
     *
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    public void deleteAllByPicturesId(String[] ArrayDATA_IDS) throws Exception;

    /**
     * 通过 contentId 删除 图片使用详情信息 图片信息 图片文件
     *
     * @param contentId
     * @throws Exception
     */
    public void deleteUsedDetailsAndPictureByContentId(String contentId) throws Exception;


    /**
     * 通过 CONTENT_ID 删除
     *
     * @param CONTENT_ID
     * @throws Exception
     */
    public void deleteByContentId(String CONTENT_ID) throws Exception;
}

