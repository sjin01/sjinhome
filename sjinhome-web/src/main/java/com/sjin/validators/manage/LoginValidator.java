package com.sjin.validators.manage;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.sjin.model.manage.User;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 4/23  16:03
 *
 * @author: guanshj QQ: 928990049
 */
public class LoginValidator extends Validator {
    @Override
    protected void validate(Controller controller) {
        this.setShortCircuit(true); // 遇到一个错误马上返回

        validateRequiredString("username" , "errorMsg" ,"请填写用户名");
        validateRequiredString("password" , "errorMsg" ,"请填写密码");

        String username = controller.getPara("username");
        String password = controller.getPara("password");
        if(username.length() > 20) addError("errorMsg" , "用户名太长");
        if(password.length() < 2 ) addError("errorMsg" , "用户名太短");

        if(!User.dao.login(username,password)) addError("errorMsg" , "用户名或密码错误！");
    }

    @Override
    protected void handleError(Controller controller) {
//        controller.keepModel(User.class);
        controller.keepPara("username");
        controller.keepPara("password");

        /*String actionKey = getActionKey();
        if (actionKey.equals("/manage/login"))*/
        controller.render("login.html");
        /*else if (actionKey.equals("/user/update"))
            controller.render("edit.html");*/
    }
}
