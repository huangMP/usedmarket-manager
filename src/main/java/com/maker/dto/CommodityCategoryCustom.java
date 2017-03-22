package com.maker.dto;

import com.maker.entity.CommodityCategory;

/**
 * Created by huangMP on 2016/11/24.
 * decription :
 */
public class CommodityCategoryCustom extends CommodityCategory {

    private String narrowPicturePath;
    private String picturePath;

    public String getNarrowPicturePath() {
        return narrowPicturePath;
    }

    public void setNarrowPicturePath(String narrowPicturePath) {
        this.narrowPicturePath = narrowPicturePath;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    @Override
    public String toString() {
        return "CommodityCategoryCustom{" +
                "narrowPicturePath='" + narrowPicturePath + '\'' +
                ", picturePath='" + picturePath + '\'' +
                "} " + super.toString();
    }
}
