package com.maker.service;

import com.maker.dto.QueryCondition;
import com.maker.dto.UserInfoCustom;
import com.maker.entity.UserInfo;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 用户信息的 Service层接口
 */
public interface UserInfoService {
    /**
     * 插入一条信息
     * @param userInfo
     * @return 插入成功的数量
     */
    int insertUserInfo(UserInfo userInfo) ;

    /**
     * 通过UserId查找UserInfo
     * @param userId
     * @return UserInfo
     */
    UserInfo findByUserId(String userId) ;

    /**
     * 通过Username查找UserInfo
     * @param username
     * @return UserInfo
     */
    UserInfo findByUsername(String username) ;

    /**
     * 修改用户信息
     * @param userInfo
     * @return 成功修改的信息条数
     */
    boolean updateUserInfo(UserInfo userInfo);

    /**
     * 按列修改用户信息
     * @param userId
     * @param index
     * @param currentValue
     * @param futureValue
     * @return UserInfo
     */
    UserInfoCustom update(String userId, String index, String currentValue, String futureValue);

    /**
     * 删除一条信息
     * @param userId
     * @return 成功删除的信息条数
     */
    int delete(String userId);

    /**
     * 按条件查找
     * @param queryCondition
     * @return
     */
    List<UserInfoCustom> findByQueryCondition(QueryCondition queryCondition);
}
