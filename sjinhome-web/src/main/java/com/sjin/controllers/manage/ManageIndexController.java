package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.sjin.interceptor.manage.ManageLoginInterceptor;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 4/22  16:54
 *
 * @author: guanshj QQ: 928990049
 */
@Before(ManageLoginInterceptor.class)
public class ManageIndexController extends Controller {

    public void index (){
        render("manageindex.html");
    }
}
