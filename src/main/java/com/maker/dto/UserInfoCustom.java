package com.maker.dto;

import com.maker.entity.UserInfo;

/**
 * Created by huangMP on 2016/10/30.
 * decription :
 */
public class UserInfoCustom extends UserInfo {

    /**
     * 头像原图
     */
    private String picturePath;
    /**
     * 头像压缩图
     */
    private String narrowPicturePath;
    /**
     * 角色名称
     */
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

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
        return "UserInfoCustom{" +
                "picturePath='" + picturePath + '\'' +
                ", narrowPicturePath='" + narrowPicturePath + '\'' +
                "} " + super.toString();
    }
}
