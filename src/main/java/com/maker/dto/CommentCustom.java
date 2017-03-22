package com.maker.dto;

import com.maker.entity.Comment;

/**
 * Description：评论dto
 * Created by Peivxuan on 2016/11/3.
 */
public class CommentCustom extends Comment {

	/**
	 * 用户名
	 */
	private String username;

	/**
	 * 头像
	 */
	private String headPortrait;

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
		return "CommentCustom{" +
				super.toString() +
				"username='" + username + '\'' +
				", headPortrait='" + headPortrait + '\'' +
				'}';
	}
}
