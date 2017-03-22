package com.maker.dto;

import com.maker.entity.Donation;

import java.util.List;

/**
 * Created by huangMP on 2016/11/10.
 * decription :
 */
public class DonationCustom extends Donation{

    /**
     * 捐赠者的用户名
     */
    private String username;
    /**
     * 捐赠者的头像原图
     */
    private String headPortrait;
    /**
     * 捐赠物品的原图片集合
     */
    private List<String> DonationImgs;
    /**
     * 捐赠物品的压缩图片集合
     */
    private List<String> narrowDonationImgs;

    public List<String> getDonationImgs() {
        return DonationImgs;
    }

    public void setDonationImgs(List<String> donationImgs) {
        DonationImgs = donationImgs;
    }

    public List<String> getNarrowDonationImgs() {
        return narrowDonationImgs;
    }

    public void setNarrowDonationImgs(List<String> narrowDonationImgs) {
        this.narrowDonationImgs = narrowDonationImgs;
    }

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

    @Override
    public String toString() {
        return "DonationCustom{" +
                "username='" + username + '\'' +
                ", headPortrait='" + headPortrait + '\'' +
                ", DonationImgs=" + DonationImgs +
                ", narrowDonationImgs=" + narrowDonationImgs +
                "} " + super.toString();
    }
}
