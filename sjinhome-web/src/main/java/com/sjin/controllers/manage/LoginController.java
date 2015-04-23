package com.sjin.controllers.manage;

import com.jfinal.core.Controller;

/**
 * Description:  登陆页面控制器
 * 创建日期: 4/22  16:25
 *
 * @author: guanshj QQ: 928990049
 */
public class LoginController extends Controller{

    public void index (){
        render("login.html");
    }

    public void login (){
        render("/manage/main");
    }
}
