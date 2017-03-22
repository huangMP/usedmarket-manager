package com.maker.dto;

import com.maker.entity.Crowdfunding;

import java.util.List;

/**
 * Created by huangMP on 2016/11/26.
 * decription :
 */
public class CrowdfundingCustom extends Crowdfunding {

    /**
     * 添加者的用户名
     */
    private String username;
    /**
     * 添加者的头像原图
     */
    private String headPortrait;
    /**
     * 众筹图片集合
     */
    private List<String> imgs;
    /**
     * 众筹压缩图片集合
     */
    private List<String> narrowImgs;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public List<String> getImgs() {
        return imgs;
    }

    public void setImgs(List<String> imgs) {
        this.imgs = imgs;
    }

    public List<String> getNarrowImgs() {
        return narrowImgs;
    }

    public void setNarrowImgs(List<String> narrowImgs) {
        this.narrowImgs = narrowImgs;
    }

    @Override
    public String toString() {
        return "CrowdfundingCustom{" +
                "username='" + username + '\'' +
                ", headPortrait='" + headPortrait + '\'' +
                ", imgs=" + imgs +
                ", narrowImgs=" + narrowImgs +
                "} " + super.toString();
    }
}
