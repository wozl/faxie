package com.cn.dao;

import com.cn.bean.UsersData;

public interface UsersDataDAO {

	int addUsersData(UsersData usersData);//添加用户资料
	
	
	UsersData selectUserData(Integer id);//查询登陆用户是否有用户数据
	
	
	
	
}
