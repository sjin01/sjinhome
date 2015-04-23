package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.sjin.model.manage.User;
import com.sjin.validators.manage.user.UserValidator;

import java.util.Map;

/**
 * Description: 用户模块控制器
 * 创建日期: 4/1  10:28
 *
 * @author: guanshj QQ: 928990049
 */
//@Before(UserInterceptor.class)
public class UsersController extends Controller {

    public void index () {
//        System.out.println(JFinal.me().getServletContext().getAttribute("base"));
        setAttr("userpage", User.dao.paginate(1, 10));

        render("user.html");
    }

    public void add(){

    }

    @Before(UserValidator.class)
    public void save() {
        getModel(User.class).save();
        redirect("/manage/user");
    }

    public void edit() {
        setAttr("user", User.dao.findById(getParaToInt()));
    }

    @Before(UserValidator.class)
    public void update() {
        getModel(User.class).update();
        redirect("/manage/user");
    }

    public void delete() {
        User.dao.deleteById(getParaToInt());
        redirect("/manage/user");
    }

    public void testajax(){
        Map map = getParaMap();

        System.out.println(getPara("param3"));
        renderJson(User.dao.paginate(1, 10));
    }
}
