package com.sjin.validators.manage;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.mysql.jdbc.StringUtils;
import com.sjin.enums.ResponseCodeEnum;
import com.sjin.model.manage.Func;

import java.util.HashMap;
import java.util.Map;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 5/28  11:08
 *
 * @author: guanshj QQ: 928990049
 */
public class FuncValidator extends Validator {
    @Override
    protected void validate(Controller controller) {
        this.setShortCircuit(true); // 遇到一个错误马上返回

        String pid = controller.getPara("func.pid");
        String path = controller.getPara("func.path");

        validateRequiredString("func.name", "errorMsg", "功能菜单名不能为空嘞！");

        if(!"0".equals(pid) ) validateRequiredString("func.path","errorMsg" , "输入路径噻，蠢得死！");

        validateRequiredString("func.sort", "errorMsg", "输入排序噻，烦躁啦！");

    }

    @Override
    protected void handleError(Controller controller) {
//        controller.keepModel(Func.class);
        controller.renderJson(controller.getAttr("errorMsg"));
    }
}
