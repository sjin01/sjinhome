package com.sjin.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseTimeline<M extends BaseTimeline<M>> extends Model<M> implements IBean {

	public void setId(Integer id) {
		set("id", id);
	}

	public Integer getId() {
		return get("id");
	}

	public void setType(Integer type) {
		set("type", type);
	}

	public Integer getType() {
		return get("type");
	}

	public void setYear(String year) {
		set("year", year);
	}

	public String getYear() {
		return get("year");
	}

	public void setDate(String date) {
		set("date", date);
	}

	public String getDate() {
		return get("date");
	}

	public void setTxt(String txt) {
		set("txt", txt);
	}

	public String getTxt() {
		return get("txt");
	}

	public void setVersion(String version) {
		set("version", version);
	}

	public String getVersion() {
		return get("version");
	}

}
