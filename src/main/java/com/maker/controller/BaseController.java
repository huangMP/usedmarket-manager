package com.maker.controller;

import com.maker.dto.HttpResult;
import com.maker.util.UuidUtil;

/**
 * Created by huangMP on 2016/11/29.
 * decription :
 */
public class BaseController {

    /**
     * 操作成功
     */
    protected static final String OPERATION_SUCCESS = "操作成功";

    /**
     * 操作失败
     */
    protected static final String OPERATION_FAILED = "操作失败";

    /**
     * 操作重复
     */
    protected  static final String OPERATION_REPETITION = "操作重复";

    /**
     * 返回HttpResult
     * @param resultCenter 回显信息
     * @param data 数据
     * @param <T> 泛型
     * @return
     */
    protected  <T> HttpResult getHttpResult(String resultCenter, T data) {
        return new HttpResult<T>(resultCenter,data);
    }

    /**
     * @return 返回32位的uuid
     */
    protected String get32UUID() {
        return UuidUtil.get32UUID();
    }

    /**
     * 常用结果
     * @param b 控制
     * @return
     */
    protected HttpResult getFrequentlyUsedReturnResultByBool(Boolean b) {
       return b ?
        this.getHttpResult(BaseController.OPERATION_SUCCESS,"") : this.getHttpResult(BaseController.OPERATION_FAILED,"");
    }

}
