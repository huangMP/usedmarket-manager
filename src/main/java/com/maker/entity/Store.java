package com.maker.entity;

import java.util.Date;

/**
 * Created by huangMP on 2016/11/27.
 * decription :
 */
public class Store {
    private String storeId;
    private String storeName;
    private String userId;
    private String description;
    private String preferNum;
    private String salesVolume;
    private Date registrationDate;
    private String addUser;

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPreferNum() {
        return preferNum;
    }

    public void setPreferNum(String preferNum) {
        this.preferNum = preferNum;
    }

    public String getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(String salesVolume) {
        this.salesVolume = salesVolume;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getAddUser() {
        return addUser;
    }

    public void setAddUser(String addUser) {
        this.addUser = addUser;
    }

    @Override
    public String toString() {
        return "Store{" +
                "storeId='" + storeId + '\'' +
                ", userId='" + userId + '\'' +
                ", description='" + description + '\'' +
                ", storeName='" + storeName + '\'' +
                ", preferNum='" + preferNum + '\'' +
                ", salesVolume='" + salesVolume + '\'' +
                ", registrationDate='" + registrationDate + '\'' +
                ", addUser='" + addUser + '\'' +
                '}';
    }
}

