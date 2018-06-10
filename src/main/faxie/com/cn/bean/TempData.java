package com.cn.bean;

/**
 * 截取数据库查询对象的指定字段的值，拷贝到当前对象中来
 * **/

public class TempData {

	private String  data1;
	private String data2;
	public String getData1() {
		return data1;
	}
	public void setData1(String data1) {
		this.data1 = data1;
	}
	public String getData2() {
		return data2;
	}
	public void setData2(String data2) {
		this.data2 = data2;
	}
	@Override
	public String toString() {
		return "TempData [data1=" + data1 + ", data2=" + data2 + "]";
	}
	public TempData(String data1, String data2) {
		super();
		this.data1 = data1;
		this.data2 = data2;
	}
	public TempData() {
		super();
	}
	
	
	
}
