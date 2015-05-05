package com.sjin.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

import java.io.UnsupportedEncodingException;

/**
 * Description:
 * 创建日期: 5/5  11:05
 *
 * @author: guanshj QQ: 928990049
 */
public class EncodingInterceptor implements Interceptor {
    @Override
    public void intercept(ActionInvocation actionInvocation) {
        try {
            actionInvocation.getController().getRequest().setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        actionInvocation.invoke();
    }
}
