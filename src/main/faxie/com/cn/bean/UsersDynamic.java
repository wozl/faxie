package com.cn.bean;

/***
 * 所有用户动态
 * **/

public class UsersDynamic {

	private Integer id;
	
	private String UserName;
	
	private Integer Did;
	
	private String Content;
	
	private String SubmitTime;

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

	public Integer getDid() {
		return Did;
	}

	public void setDid(Integer did) {
		Did = did;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getSubmitTime() {
		return SubmitTime;
	}

	public void setSubmitTime(String submitTime) {
		SubmitTime = submitTime;
	}

	@Override
	public String toString() {
		return "UsersDynamic [id=" + id + ", UserName=" + UserName + ", Did=" + Did + ", Content=" + Content
				+ ", SubmitTime=" + SubmitTime + "]";
	}

	public UsersDynamic(Integer id, String userName, Integer did, String content, String submitTime) {
		super();
		this.id = id;
		UserName = userName;
		Did = did;
		Content = content;
		SubmitTime = submitTime;
	}

	public UsersDynamic() {
		super();
	}
	
	
	
	
}
