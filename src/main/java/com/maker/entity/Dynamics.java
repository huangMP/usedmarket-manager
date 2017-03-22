package com.maker.entity;

import java.util.Date;

/**
 * Created by huangMP on 2016/11/18.
 * decription : 动态
 */
public class Dynamics {
    /**
     * 动态id
     */
    private String dynamicsId;
    /**
     * 动态类型：1.校园动态；2.捐赠动态
     */
    private int type;
    /**
     * 标题
     */
    private String title;
    /**
     * 正文
     */
    private String text;
    /**
     * 纯文本
     */
    private String pureText;

    /**
     * 来源
     */
    private String origin;
    /**
     * 添加人
     */
    private String addUser;
    /**
     * 添加时间
     */
    private Date addDate;

    /**
     * 用于排序
     */
    private String sort;

    public String getPureText() {
        return pureText;
    }

    public void setPureText(String pureText) {
        this.pureText = pureText;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getDynamicsId() {
        return dynamicsId;
    }

    public void setDynamicsId(String dynamicsId) {
        this.dynamicsId = dynamicsId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
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

    @Override
    public String toString() {
        return "Dynamics{" +
                "dynamicsId='" + dynamicsId + '\'' +
                ", type=" + type +
                ", title='" + title + '\'' +
                ", text='" + text + '\'' +
                ", origin='" + origin + '\'' +
                ", addUser='" + addUser + '\'' +
                ", addDate=" + addDate +
                ", sort='" + sort + '\'' +
                '}';
    }
}
