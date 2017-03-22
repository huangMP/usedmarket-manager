package com.maker.service;

import com.maker.dto.DonationCustom;
import com.maker.dto.QueryCondition;
import com.maker.entity.Donation;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 捐赠物品信息的 Service层接口
 */
public interface DonationService {
    /**
     * 插入一条信息
     * @param donation
     * @return 插入成功的数量
     */
    boolean insertDonation(Donation donation) ;

    /**
     * 按要求查找
     * @param queryCondition
     * @return
     */
    List<DonationCustom> findByQueryCondition(QueryCondition queryCondition);

    /**
     * 按列修改
     * @param donationId
     * @param type
     * @param futureValue
     * @param currentValue
     * @param isCheck
     * @return
     */
    DonationCustom editByCondition(String donationId, String type, String futureValue, String currentValue, boolean isCheck);
}
