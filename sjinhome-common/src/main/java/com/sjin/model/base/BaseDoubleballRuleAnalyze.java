package com.sjin.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseDoubleballRuleAnalyze<M extends BaseDoubleballRuleAnalyze<M>> extends Model<M> implements IBean {

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

	public void setPeriod(Integer period) {
		set("period", period);
	}

	public Integer getPeriod() {
		return get("period");
	}

	public void setSysAnalyze(String sysAnalyze) {
		set("sys_analyze", sysAnalyze);
	}

	public String getSysAnalyze() {
		return get("sys_analyze");
	}

	public void setResult(Integer result) {
		set("result", result);
	}

	public Integer getResult() {
		return get("result");
	}

}
