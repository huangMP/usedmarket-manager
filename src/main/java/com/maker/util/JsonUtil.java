package com.maker.util;


import com.google.gson.Gson;
import com.maker.entity.UserInfo;

/**
 * Created by huangMP on 2016/10/23.
 * decription : 转成Json格式
 */
public class JsonUtil {

    private static Gson gson = new Gson();

    public static String toJson(Object object){
        return gson.toJson(object);
    }

    public static void main(String args[]){
        UserInfo userInfo = new UserInfo();
        userInfo.setPassword("jkljkjlkj");
        System.out.println( JsonUtil.toJson( userInfo ) );
    }
}
