package com.sjin.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseSysRoleFunc<M extends BaseSysRoleFunc<M>> extends Model<M> implements IBean {

	public void setId(Integer id) {
		set("id", id);
	}

	public Integer getId() {
		return get("id");
	}

	public void setRoleid(Integer roleid) {
		set("roleid", roleid);
	}

	public Integer getRoleid() {
		return get("roleid");
	}

	public void setFuncid(Integer funcid) {
		set("funcid", funcid);
	}

	public Integer getFuncid() {
		return get("funcid");
	}

}