package com.maker.dao;

import com.maker.dto.QueryCondition;
import com.maker.dto.UserInfoCustom;
import com.maker.entity.UserInfo;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 用户信息 Dao
 */
public interface UserInfoDao {
    /**
     * 插入一条信息
     * @param userInfo
     * @return 插入成功的数量
     */
    public int insert(UserInfo userInfo) ;

    /**
     * 通过UserId查找UserInfo
     * @param userId
     * @return UserInfo
     */
    public UserInfo findByUserId(String userId) ;

    /**
     * 通过Username查找UserInfo
     * @param username
     * @return UserInfo
     */
    public UserInfo findByUsername(String username) ;

    /**
     * 通过username查找UserInfoCustom
     *
     * @param username
     * @return UserInfoCustom
     */
    public UserInfoCustom findUserInfoCustomByUsername(String username);
    /**
     * 通过 userId 查找UserInfoCustom
     *
     * @param userId
     * @return UserInfoCustom
     */
    public UserInfoCustom findUserInfoCustomByUserId(String userId);

    /**
     * 修改用户信息
     * @param userInfo
     * @return 成功修改的信息条数
     */
    public int update(UserInfo userInfo);

    /**
     * 删除一条信息
     * @param userId
     * @return 成功删除的信息条数
     */
    public int delete(String userId);

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    List<UserInfoCustom> findByQueryCondition(QueryCondition queryCondition);

}
