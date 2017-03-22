package com.maker.dto;

import com.maker.entity.Store;

/**
 * Created by huangMP on 2016/11/27.
 * decription :
 */
public class StoreCustom extends Store{

    private String picturePath;
    private String narrowPicturePath;

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public String getNarrowPicturePath() {
        return narrowPicturePath;
    }

    public void setNarrowPicturePath(String narrowPicturePath) {
        this.narrowPicturePath = narrowPicturePath;
    }

    @Override
    public String toString() {
        return "StoreCustom{" +
                "picturePath='" + picturePath + '\'' +
                ", narrowPicturePath='" + narrowPicturePath + '\'' +
                "} " + super.toString();
    }
}
