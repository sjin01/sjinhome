package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.sjin.model.manage.User;
import com.sjin.validators.manage.LoginValidator;

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

    @Before(LoginValidator.class)
    public void login (){
        /*User user = getModel(User.class);
        System.out.println(user.getAttrValues());*/
        System.out.println(getPara("user.username"));
        System.out.println(getPara("user.password"));
        redirect("/manage/main");
    }
}
