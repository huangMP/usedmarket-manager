package com.maker.dto;

/**
 * Description：enter your comment
 * Created by Peivxuan on 2016/11/25.
 */
public class HttpResult<T> {
	public String resultCenter;//返回的中心内容 例如：注册成功，就返回"注册成功"
	public T data;  //如果要返回实体类的 就放这里面 如果：二手商品商品列表 List<Commodity>

	public HttpResult(String resultCenter, T data) {
		this.resultCenter = resultCenter;
		this.data = data;
	}

	public HttpResult(T data) {
		this.data = data;
	}

	public HttpResult(String resultCenter) {
		this.resultCenter = resultCenter;
	}

	public HttpResult(){}

	public String getResultCenter() { return resultCenter; }

	public void setResultCenter(String resultCenter) { this.resultCenter = resultCenter; }

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
