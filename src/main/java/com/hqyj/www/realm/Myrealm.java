package com.hqyj.www.realm;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * @ClassName MyRealm
 * @Description 自定义的reaml类   实现用户认证和授权
 * @Author ss
 * @Date 2020/7/28 10:56
 * @Version 1.0
 *
 * 什么时候进入授权方法，
 * （1）JSP权限标签时进入
 * （2）shiro配置文件配置了权限
 * （3）注解了权限
 */
public class Myrealm extends AuthorizingRealm {

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        return null;
    }
}
