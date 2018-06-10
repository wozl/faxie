package com.cn.bean;

/**
 * 用户类
 * **/
public class Users {
	private Integer id;
	private String UserName;
	private String PassWord;
	private Integer isadmin;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassWord() {
		return PassWord;
	}
	public void setPassWord(String passWord) {
		PassWord = passWord;
	}
	public Integer getIsadmin() {
		return isadmin;
	}
	public void setIsadmin(Integer isadmin) {
		this.isadmin = isadmin;
	}
	
	@Override
	public String toString() {
		return "Users [id=" + id + ", UserName=" + UserName + ", PassWord=" + PassWord + ", isadmin=" + isadmin + "]";
	}
	public Users(Integer id, String userName, String passWord, Integer isadmin) {
		super();
		this.id = id;
		UserName = userName;
		PassWord = passWord;
		this.isadmin = isadmin;
	}
	public Users() {
		super();
	}
	
	

}
