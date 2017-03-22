package com.maker.entity;

import java.util.Date;

/**
 * Created by huangMP on 2016/10/23.
 * decription : 众筹表
 */
public class Crowdfunding {
    /**
     * 主键
     */
    private String crowdfundingId;

    /**
     *类别(1.创意众筹 2.爱心众筹)
     */
    private int crowdfundingType;

    /**
     *图片url
     */
    private String images;

    /**
     *标题
     */
    private String title;

    /**
     *描述
     */
    private String description;

    /**
     *来源
     */
    private String origin;

    /**
     *目标金额
     */
    private double targetAmount;

    /**
     *已筹金额
     */
    private double nowAmount;

    /**
     *支持人数
     */
    private int supportNum;

    /**
     *添加人
     */
    private String addUser;

    /**
     *添加时间
     */
    private Date addDate;

    /**
     * 动态id
     */
    private String dynamicsId ;

    /**
     * 是否有动态：0，没有；1有
     */
    private int hasDynamics ;

    public String getCrowdfundingId() {
        return crowdfundingId;
    }

    public void setCrowdfundingId(String crowdfundingId) {
        this.crowdfundingId = crowdfundingId;
    }

    public int getCrowdfundingType() {
        return crowdfundingType;
    }

    public void setCrowdfundingType(int crowdfundingType) {
        this.crowdfundingType = crowdfundingType;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public double getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(double targetAmount) {
        this.targetAmount = targetAmount;
    }

    public double getNowAmount() {
        return nowAmount;
    }

    public void setNowAmount(double nowAmount) {
        this.nowAmount = nowAmount;
    }

    public int getSupportNum() {
        return supportNum;
    }

    public void setSupportNum(int supportNum) {
        this.supportNum = supportNum;
    }

    public String getAddUser() {
        return addUser;
    }

    public void setAddUser(String addUser) {
        this.addUser = addUser;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public String getDynamicsId() {
        return dynamicsId;
    }

    public void setDynamicsId(String dynamicsId) {
        this.dynamicsId = dynamicsId;
    }

    public int getHasDynamics() {
        return hasDynamics;
    }

    public void setHasDynamics(int hasDynamics) {
        this.hasDynamics = hasDynamics;
    }

    @Override
    public String toString() {
        return "Crowdfunding{" +
                "crowdfundingId='" + crowdfundingId + '\'' +
                ", crowdfundingType=" + crowdfundingType +
                ", images='" + images + '\'' +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", origin='" + origin + '\'' +
                ", targetAmount=" + targetAmount +
                ", nowAmount=" + nowAmount +
                ", supportNum=" + supportNum +
                ", addUser='" + addUser + '\'' +
                ", addDate=" + addDate +
                ", dynamicsId='" + dynamicsId + '\'' +
                ", hasDynamics=" + hasDynamics +
                '}';
    }
}
