package com.cn.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Dynamic;
import com.cn.bean.Users;
import com.cn.bean.UsersData;
import com.cn.bean.UsersDiary;
import com.cn.bean.UsersDynamic;
import com.cn.dao.DynamicDAO;
import com.cn.dao.UsersDAO;
import com.cn.dao.UsersDataDAO;
import com.cn.dao.UsersDiaryDAO;
import com.cn.dao.UsersDynamicDAO;

/**
 * 用户业务层
 * **/



@Service
public class faxieUsersServices {


	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private UsersDataDAO usersDataDAO;
	
	@Autowired
	private UsersDiaryDAO usersDiaryDAO;
	
	@Autowired
	private UsersDynamicDAO usersDynamicDAO;
	
	@Autowired
	private DynamicDAO dynamicDAO;
	
	/**
	 * 检查用户名是否已经被注册了
	 * */
	public boolean selectName(String name){
			if(usersDAO.selectByName(name)!=null){
				return false;
			}
		return true;
	}
	/**
	 * 根据用户名查询这个用户的所有信息
	 * **/
	public Users selectUsers(String name){
		return usersDAO.selectByName(name);
		
	}
	
	
	/**
	 * 用户注册
	 * **/
	public boolean reg(Users users){
			if(usersDAO.addUser(users)>0){
				return true;
			}
		return false;
		}
	
	/**
	 * 用户登陆
	 * **/
	public boolean login(Users users){
		//System.out.println(users.getUserName());
		//System.out.println(users.getPassWord());
		if(usersDAO.selectLogin(users.getUserName(), users.getPassWord())!=null){
			return true;
		}
		return false;
	}
	
	/**
	 * 检查用户是否为首次登陆，是就要求更新用户数据
	 * 
	 * **/
	public boolean checkUserData(Integer id){
		if(usersDataDAO.selectUserData(id)==null){
			return true;
		}
		return false;
	}
	/**
	 * 更新首次登陆用户的资料
	 * ***/
	public boolean addUsersData(UsersData usersData){
		if(usersDataDAO.addUsersData(usersData)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 查询登陆用户的个人资料
	 * **/
	
	public UsersData selectData(Integer id){
		return usersDataDAO.selectUserData(id);
	}
	/**
	 * 储存用户编写的日记
	 * **/
	public boolean adddiarydata(UsersDiary diary){
		if(usersDiaryDAO.addDiary(diary)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 查询当前用户所有日记标题
	 * **/
	public List<UsersDiary> getTitle(Integer id){
		return usersDiaryDAO.selectTitle(id);
	}
	
	/**
	 * 当前用户点击日记标题后查询该日记的详细内容
	 * **/
	public UsersDiary getcontent(UsersDiary usersDiary){
		
		return usersDiaryDAO.selectcontent(usersDiary);
	}
	
	/**
	 * 当前用户获取所有注册用户的动态
	 * 
	 * **/
	public List<UsersDynamic>getall(){
		
		return usersDynamicDAO.getall();
	}
	
	/***
	 * 储存当前登陆用户发表的动态信息
	 * **/
	public boolean getPublished(Dynamic dynamic){
		if(dynamicDAO.adduserDynamic(dynamic)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 获取当前用户发布的所有动态信息
	 * ***/
	public List<Dynamic>getAll(Dynamic dynamic){
		return dynamicDAO.getUserDynamic(dynamic);
	}
}
