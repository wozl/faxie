package com.cn.bean;

/**
 * 用户日记表
 * **/
public class UsersDiary {
	
	private Integer id;//日记表id
	private String Title;//日记标题
	private String Content;//日记内容
	private String WriteTime;//发表时间
	private Integer UserDiary;//哪个用户的日记
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getWriteTime() {
		return WriteTime;
	}
	public void setWriteTime(String writeTime) {
		WriteTime = writeTime;
	}
	public Integer getUserDiary() {
		return UserDiary;
	}
	public void setUserDiary(Integer userDiary) {
		UserDiary = userDiary;
	}
	@Override
	public String toString() {
		return "UsersDiary [id=" + id + ", Title=" + Title + ", Content=" + Content + ", WriteTime=" + WriteTime
				+ ", UserDiary=" + UserDiary + "]";
	}
	public UsersDiary() {
		super();
	}
	public UsersDiary(Integer id, String title, String content, String writeTime, Integer userDiary) {
		super();
		this.id = id;
		Title = title;
		Content = content;
		WriteTime = writeTime;
		UserDiary = userDiary;
	}
	
	
	
}
