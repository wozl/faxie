package com.cn.bean;

/**
 * 当前登陆用户发布的动态
 * **/

public class Dynamic {

	private Integer Did;
	
	private String Content;
	
	private String SubmitTime;
	
	private Integer UsersId;
	
	private Integer UserdyId;

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

	public Integer getUsersId() {
		return UsersId;
	}

	public void setUsersId(Integer usersId) {
		UsersId = usersId;
	}

	public Integer getUserdyId() {
		return UserdyId;
	}

	public void setUserdyId(Integer userdyId) {
		UserdyId = userdyId;
	}

	@Override
	public String toString() {
		return "Dynamic [Did=" + Did + ", Content=" + Content + ", SubmitTime=" + SubmitTime + ", UsersId=" + UsersId
				+ ", UserdyId=" + UserdyId + "]";
	}

	public Dynamic(Integer did, String content, String submitTime, Integer usersId, Integer userdyId) {
		super();
		Did = did;
		Content = content;
		SubmitTime = submitTime;
		UsersId = usersId;
		UserdyId = userdyId;
	}

	public Dynamic() {
		super();
	}
	
	
	
	
}
