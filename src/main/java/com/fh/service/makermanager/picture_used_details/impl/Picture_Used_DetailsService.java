package com.fh.service.makermanager.picture_used_details.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.makermanager.picture_used_details.Picture_Used_DetailsManager;
import com.fh.util.Const;
import com.fh.util.DelAllFile;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
/**
 * 说明： 图片使用详情
 */
@Service("picture_used_detailsService")
public class Picture_Used_DetailsService implements Picture_Used_DetailsManager {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    public void save(PageData pd) throws Exception {
        dao.save("Picture_Used_DetailsMapper.save", pd);
    }

    /**
     * 删除
     *
     * @param pd
     * @throws Exception
     */
    public void delete(PageData pd) throws Exception {
        dao.delete("Picture_Used_DetailsMapper.delete", pd);
    }

    /**
     * 修改
     *
     * @param pd
     * @throws Exception
     */
    public void edit(PageData pd) throws Exception {
        dao.update("Picture_Used_DetailsMapper.edit", pd);
    }

    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("Picture_Used_DetailsMapper.datalistPage", page);
    }

    /**
     * 列表(全部)
     *
     * @param pd
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> listAll(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("Picture_Used_DetailsMapper.listAll", pd);
    }

    /**
     * 通过id获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("Picture_Used_DetailsMapper.findById", pd);
    }

    /**
     * 批量删除
     *
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception {

        dao.delete("Picture_Used_DetailsMapper.deleteAll", ArrayDATA_IDS);
    }

    /**
     * 通过 contentId 查找相应的图片
     *
     * @param contentId
     * @return
     * @throws Exception
     */
    public List<PageData> selectPicturesByContentId(String contentId) throws Exception {
        return (List<PageData>) dao.findForList("Picture_Used_DetailsMapper.selectPicturesByContentId", contentId);
    }

    /**
     * 通过 pictureId 删除
     *
     * @param pictureID
     * @throws Exception
     */
    public void deleteByPictureID(String pictureID) throws Exception {
        dao.findForList("Picture_Used_DetailsMapper.deleteByPictureID", pictureID);
    }

    /**
     * 通过 PICTURE_ID 批量删除
     *
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    public void deleteAllByPicturesId(String[] ArrayDATA_IDS) throws Exception {
        dao.delete("Picture_Used_DetailsMapper.deleteAllByPicturesId", ArrayDATA_IDS);
    }

    /**
     * 通过 contentId 删除 图片使用详情信息 图片信息 图片文件
     *
     * @param contentId
     * @throws Exception
     */
    public void deleteUsedDetailsAndPictureByContentId(String contentId) throws Exception {
        if (!("".equals(contentId) || null == contentId)) {
            List<PageData> pictureList = (List<PageData>) dao.findForList("Picture_Used_DetailsMapper.selectPicturesByContentId", contentId);    //得到相应的图片集合
            List<String> pictureIdList = new ArrayList<String>();
            if (0 != pictureIdList.size()) {
                for (PageData var : pictureList) {
                    DelAllFile.delFolder(PathUtil.getClasspath() + Const.FILEPATHIMG + var.getString("PATH"));    //删除图片文件
                    pictureIdList.add(var.getString("PICTURES_ID"));
                }
                String[] PICTURE_IDS = pictureIdList.toArray(new String[pictureIdList.size()]);
                dao.delete("Picture_Used_DetailsMapper.pictureDeleteAll", PICTURE_IDS);    //通过 PICTURE_ID 批量删除,图片表信息
            }
            deleteByContentId(contentId);    //删除图片使用详情
        }
    }

    /**
     * 通过 CONTENT_ID 删除
     *
     * @param CONTENT_ID
     * @throws Exception
     */
    public void deleteByContentId(String CONTENT_ID) throws Exception {
        dao.delete("Picture_Used_DetailsMapper.deleteByContentId", CONTENT_ID);
    }

}

