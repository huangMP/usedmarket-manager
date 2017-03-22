package com.maker.entity;

import java.util.Date;

/**
 * Description：单文字实体类
 * Created by Peivxuan on 2016/11/26.
 */
public class SentenceBean {

	/**
	 * 主键
	 */
	private String sentenceId;

	/**
	 * 文字字段
	 */
	private String text;

	/**
	 * 类型（1：跑马条；2：推荐）
	 */
	private Integer type;

	/**
	 * 添加人
	 */
	private String addUser;

	/**
	 * 添加时间
	 */
	private Date addDate;

	public String getSentenceId() {
		return sentenceId;
	}

	public void setSentenceId(String sentenceId) {
		this.sentenceId = sentenceId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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
		return "SentenceBean{" +
				"sentenceId='" + sentenceId + '\'' +
				", text='" + text + '\'' +
				", type='" + type + '\'' +
				", addUser='" + addUser + '\'' +
				", addDate=" + addDate +
				'}';
	}

}
