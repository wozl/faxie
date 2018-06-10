package com.cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.cn.bean.Users;

/**
 * 查询数据库用户信息
 * */
public interface UsersDAO {
		
		List<Users>selectAll();
		
		Users selectByName(String username);
	
		Users selectById(Integer id);
		
		@Select("SELECT COUNT(1) FROM users;")
		int contUsers();
		
		int addUser(Users user);
		
		Users selectLogin(String UserName,String PassWord);
		
		int updateUserPwd(Users users);
		
		int deleteUser(Integer id);
}
