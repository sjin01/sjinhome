package com.sjin.controllers.manage;

import com.jfinal.core.Controller;
import com.sjin.constant.SysConstant;
import com.sjin.model.manage.Dict;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 5/28  16:28
 *
 * @author: guanshj QQ: 928990049
 */
public class DictController extends Controller {

    public void index (){

        String page = getPara("page");
        setAttr("dictpage", Dict.dao.paginate(Integer.valueOf(page), SysConstant.MANAGE_PAGESIZE));

        render("main.html");
    }
}
