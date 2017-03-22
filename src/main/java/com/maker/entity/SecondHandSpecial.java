package com.maker.entity;

import java.util.Date;

/**
 * Created by huangMP on 2016/11/27.
 * decription :
 */
public class SecondHandSpecial {

    private String secondHandSpecialId;
    private String secondHandSpecialName;
    private String addUserUsername;
    private Date addDate;
    private int sort;

    public String getSecondHandSpecialId() {
        return secondHandSpecialId;
    }

    public void setSecondHandSpecialId(String secondHandSpecialId) {
        this.secondHandSpecialId = secondHandSpecialId;
    }

    public String getSecondHandSpecialName() {
        return secondHandSpecialName;
    }

    public void setSecondHandSpecialName(String secondHandSpecialName) {
        this.secondHandSpecialName = secondHandSpecialName;
    }

    public String getAddUserUsername() {
        return addUserUsername;
    }

    public void setAddUserUsername(String addUserUsername) {
        this.addUserUsername = addUserUsername;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "SecondHandSpecial{" +
                "secondHandSpecialId='" + secondHandSpecialId + '\'' +
                ", secondHandSpecialName='" + secondHandSpecialName + '\'' +
                ", addUserUsername='" + addUserUsername + '\'' +
                ", addDate='" + addDate + '\'' +
                ", sort='" + sort + '\'' +
                '}';
    }
}
