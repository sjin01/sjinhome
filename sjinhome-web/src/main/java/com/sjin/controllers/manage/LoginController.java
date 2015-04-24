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
        setAttr("errorMsg",getSessionAttr("errorMsg"));
        render("login.html");
    }

    @Before(LoginValidator.class)
    public void login (){
        /*User user = getModel(User.class);
        System.out.println(user.getAttrValues());*/

        User loginUser = getSessionAttr("loginUser");

        System.out.println(loginUser.get("id"));
        System.out.println(loginUser.get("username"));
        System.out.println(loginUser.get("password"));

        redirect("/manage/main");
    }
}
