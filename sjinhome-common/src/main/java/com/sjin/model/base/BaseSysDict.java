package com.sjin.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseSysDict<M extends BaseSysDict<M>> extends Model<M> implements IBean {

	public void setId(Integer id) {
		set("id", id);
	}

	public Integer getId() {
		return get("id");
	}

	public void setCode(String code) {
		set("code", code);
	}

	public String getCode() {
		return get("code");
	}

	public void setName(String name) {
		set("name", name);
	}

	public String getName() {
		return get("name");
	}

	public void setType(String type) {
		set("type", type);
	}

	public String getType() {
		return get("type");
	}

	public void setSort(Integer sort) {
		set("sort", sort);
	}

	public Integer getSort() {
		return get("sort");
	}

	public void setStatus(Boolean status) {
		set("status", status);
	}

	public Boolean getStatus() {
		return get("status");
	}

}
