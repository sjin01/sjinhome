package com.sjin.controllers.manage;

import com.sjin.base.BaseController;
import com.sjin.services.manage.FueluxTreeSerivce;

/**
 * Description: 功能菜单管理
 * 创建日期: 5/6  9:52
 *
 * @author: guanshj QQ: 928990049
 */
public class FuncController extends BaseController {

    public void index () {
        render("main.html");
    }

    public void treeData (){

        renderJson(
            getSuccessfulResultMap(
                FueluxTreeSerivce.serivce.FuncTreeData(
                    Integer.valueOf(
                        getPara("pid")
                    )
                )
            )
        );
    }

    /**进入添加页面*/
    public void add(){
    }
    /**进入编辑页面*/
    public void edit(){
    }

    /** 保存操作*/
    public void save(){

    }
    /** 更新操作*/
    public void update(){

    }
    /** 删除操作 */
    public void delete(){

    }
}
