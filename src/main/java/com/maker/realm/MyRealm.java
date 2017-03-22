package com.maker.realm;

import com.maker.dto.QueryCondition;
import com.maker.dto.UserInfoCustom;
import com.maker.service.UserInfoService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Description：enter your comment
 * Created by Peivxuan on 2016/8/8.
 */
public class MyRealm extends AuthorizingRealm {

	@Autowired
	UserInfoService userInfoService;

	/**
	 * 授权方法
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		System.out.println("进来 doGetAuthorizationInfo 了");

		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();


		//得到用户名
		String username = (String) principalCollection.getPrimaryPrincipal();

		List<UserInfoCustom> userInfoCustomInDatabases = userInfoService.findByQueryCondition(new QueryCondition("username", username, "", "", "", 0, 10));
		if( 1 != userInfoCustomInDatabases.size()){
			return null;
		}
		UserInfoCustom userInfoCustom = userInfoCustomInDatabases.get(0);

		//付给该用户的角色权限
		authorizationInfo.addRole( userInfoCustom.getRoleName() );

		return authorizationInfo;
	}

	/**
	 * 认证方法
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("进来 doGetAuthenticationInfo 了");

		//得到用户名
		String username =(String) token.getPrincipal();

		List<UserInfoCustom> userInfoInDatabases = userInfoService.findByQueryCondition(new QueryCondition("username", username, "", "", "", 0, 10));
		if( 1 != userInfoInDatabases.size()){
			return null;
		}
		UserInfoCustom userInfoInDatabase = userInfoInDatabases.get(0);
		String password = userInfoInDatabase.getPassword();

		//当前 Realm 的 name
		String realmName = getName();
		SimpleAuthenticationInfo authcInfo = new SimpleAuthenticationInfo( username, password, realmName);
		return authcInfo;
	}
}
