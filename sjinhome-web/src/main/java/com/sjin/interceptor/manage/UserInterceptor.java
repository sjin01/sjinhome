package com.sjin.interceptor.manage;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;


/**
 * Description: 用户模块测试拦截器 拦截器  (在controller 或者 action 上注释使用)
 * 创建日期: 4/1  11:17
 *
 * @author: guanshj QQ: 928990049
 */
public class UserInterceptor implements Interceptor {

    @Override
    public void intercept(ActionInvocation ai) {
        System.out.println("Before invoking " + ai.getActionKey());
//        System.out.println(JFinal.me().getServletContext().getAttribute("base"));

        ai.invoke();
        System.out.println("After invoking " + ai.getActionKey());
//        System.out.println(JFinal.me().getServletContext().getAttribute("base"));
    }
}
