package com.sjin.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseDoubleballRecordFeature<M extends BaseDoubleballRecordFeature<M>> extends Model<M> implements IBean {

	public void setId(Integer id) {
		set("id", id);
	}

	public Integer getId() {
		return get("id");
	}

	public void setPeriod(Integer period) {
		set("period", period);
	}

	public Integer getPeriod() {
		return get("period");
	}

	public void setPartition3(String partition3) {
		set("partition3", partition3);
	}

	public String getPartition3() {
		return get("partition3");
	}

	public void setPartition4(String partition4) {
		set("partition4", partition4);
	}

	public String getPartition4() {
		return get("partition4");
	}

	public void setPartition7(String partition7) {
		set("partition7", partition7);
	}

	public String getPartition7() {
		return get("partition7");
	}

	public void setPartition3break(String partition3break) {
		set("partition3break", partition3break);
	}

	public String getPartition3break() {
		return get("partition3break");
	}

	public void setPartition4break(String partition4break) {
		set("partition4break", partition4break);
	}

	public String getPartition4break() {
		return get("partition4break");
	}

	public void setPartition7break(String partition7break) {
		set("partition7break", partition7break);
	}

	public String getPartition7break() {
		return get("partition7break");
	}

	public void setSize(String size) {
		set("size", size);
	}

	public String getSize() {
		return get("size");
	}

	public void setOddeven(String oddeven) {
		set("oddeven", oddeven);
	}

	public String getOddeven() {
		return get("oddeven");
	}

	public void setSum(Integer sum) {
		set("sum", sum);
	}

	public Integer getSum() {
		return get("sum");
	}

	public void setSpan(Integer span) {
		set("span", span);
	}

	public Integer getSpan() {
		return get("span");
	}

	public void setFirst(Integer first) {
		set("first", first);
	}

	public Integer getFirst() {
		return get("first");
	}

	public void setLast(Integer last) {
		set("last", last);
	}

	public Integer getLast() {
		return get("last");
	}

}
