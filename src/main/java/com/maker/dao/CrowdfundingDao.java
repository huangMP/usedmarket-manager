package com.maker.dao;


import com.maker.dto.CrowdfundingCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.Attachment;
import com.maker.entity.Crowdfunding;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 众筹表 Dao
 */
public interface CrowdfundingDao {
    /**
     * 插入一条信息
     * @param crowdfunding
     * @rturn 插入成功的数量
     */
    int insert(Crowdfunding crowdfunding) ;

    /**
     * 查找通过crowdfundingId
     * @param crowdfundingId
     * @return UserInfo
     */
    Crowdfunding findByCrowdfundingId(String crowdfundingId) ;

    /**
     * 通过Username查找UserInfo
     * @param addUser
     * @return UserInfo
     */
    Crowdfunding findByaddUser(String addUser) ;

    /**
     * 修改用户信息
     * @param crowdfunding
     * @return 成功修改的信息条数
     */
    int update(Crowdfunding crowdfunding);

    /**
     * 删除一条信息
     * @param crowdfundingId
     * @return 成功删除的信息条数
     */
    int delete(String crowdfundingId);

    List<Attachment> loadImages(List<CrowdfundingCustom> donationCustoms);

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    List<CrowdfundingCustom> findByQueryCondition(QueryCondition queryCondition);
}
