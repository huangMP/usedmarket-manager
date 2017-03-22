package com.maker.entity;

import java.util.Date;

/**
 * Created by huangMP on 2016/11/24.
 * decription : 二手商品分类
 */
public class CommodityCategory {

    private String commodityCategoryId;
    private String attachmentId;
    private String title;
    private String addUserId;
    private Date addDate;
    private int sort;
    private int type;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getCommodityCategoryId() {
        return commodityCategoryId;
    }

    public void setCommodityCategoryId(String commodityCategoryId) {
        this.commodityCategoryId = commodityCategoryId;
    }

    public String getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(String attachmentId) {
        this.attachmentId = attachmentId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAddUserId() {
        return addUserId;
    }

    public void setAddUserId(String addUserId) {
        this.addUserId = addUserId;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    @Override
    public String toString() {
        return "CommodityCategory{" +
                "commodityCategoryId='" + commodityCategoryId + '\'' +
                ", attachmentId='" + attachmentId + '\'' +
                ", title='" + title + '\'' +
                ", addUserId='" + addUserId + '\'' +
                ", addDate=" + addDate +
                ", sort=" + sort +
                ", type=" + type +
                '}';
    }
}
