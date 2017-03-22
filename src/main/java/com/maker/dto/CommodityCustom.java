package com.maker.dto;

import com.maker.entity.Commodity;

import java.util.List;

/**
 * Description：自定义商品pojo
 * Created by Peivxuan on 2016/10/25.
 */
public class CommodityCustom extends Commodity {

    /**
     * 查询得到的二手商品数目
     */
    private String commodityNum;

    /**
     * 用户名
     */
    private String username;

    /**
     * 头像
     */
    private String headPortrait;

    /**
     * 图片
     */
    private List<String> images;

	/**
	 * 评论
     */
    private List<CommentCustom> comments;

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

    public String getCommodityNum() {
        return commodityNum;
    }

    public void setCommodityNum(String commodityNum) {
        this.commodityNum = commodityNum;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public List<CommentCustom> getComments() {
        return comments;
    }

    public void setComments(List<CommentCustom> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "CommodityCustom{" +
                "commodity='" + super.toString() + '\'' +
                "commodityNum='" + commodityNum + '\'' +
                ", username='" + username + '\'' +
                ", headPortrait='" + headPortrait + '\'' +
                ", images=" + images +
                ", comments=" + comments +
                '}';
    }
}
