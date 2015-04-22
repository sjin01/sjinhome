package com.sjin.validators.manage.user;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.sjin.model.manage.User;

/**
 * Description: 后台验证 用户表
 * 创建日期: 4/1  15:12
 *
 * @author: guanshj QQ: 928990049
 */
public class UserValidator extends Validator {
    @Override
    protected void validate(Controller controller) {
        validateRequiredString("user.username", "usernameMsg", "请输入用户名!");
        validateRequiredString("user.password", "passwordMsg", "请输入登陆密码!");
    }

    @Override
    protected void handleError(Controller controller) {
        controller.keepModel(User.class);

        String actionKey = getActionKey();
        if (actionKey.equals("/user/save"))
            controller.render("add.html");
        else if (actionKey.equals("/user/update"))
            controller.render("edit.html");
    }
}
