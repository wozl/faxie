package com.cn.bean;

/**
 * 用户个人资料
 * **/
public class UsersData {
	private Integer id;//用户个人资料id
	private String Name;//姓名
	private String RegisteredTime;//注册时间
	private String Sex;//性别
	private Integer Age;//年龄
	private String Hobbies;//爱好
	private String Address;//地址
	private Integer UserID;//对应哪个用户的id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getRegisteredTime() {
		return RegisteredTime;
	}
	public void setRegisteredTime(String registeredTime) {
		RegisteredTime = registeredTime;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public Integer getAge() {
		return Age;
	}
	public void setAge(Integer age) {
		Age = age;
	}
	public String getHobbies() {
		return Hobbies;
	}
	public void setHobbies(String hobbies) {
		Hobbies = hobbies;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public Integer getUserID() {
		return UserID;
	}
	public void setUserID(Integer userID) {
		UserID = userID;
	}
	@Override
	public String toString() {
		return "UsersData [id=" + id + ", Name=" + Name + ", RegisteredTime=" + RegisteredTime + ", Sex=" + Sex
				+ ", Age=" + Age + ", Hobbies=" + Hobbies + ", Address=" + Address + ", UserID=" + UserID + "]";
	}
	public UsersData(Integer id, String name, String registeredTime, String sex, Integer age, String hobbies,
			String address, Integer userID) {
		super();
		this.id = id;
		Name = name;
		RegisteredTime = registeredTime;
		Sex = sex;
		Age = age;
		Hobbies = hobbies;
		Address = address;
		UserID = userID;
	}
	public UsersData() {
		super();
	}
	
	
	
}
