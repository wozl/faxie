package com.cn.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.bean.Post_Article;
import com.cn.bean.Users;
import com.cn.dao.Post_ArticleDAO;
import com.cn.dao.UsersDAO;
import com.cn.dao.UsersDataDAO;
import com.cn.dao.UsersDiaryDAO;

/**
 * 管理员业务层
 * **/

@Service
public class AdminServices {

	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private UsersDataDAO usersDataDAO;
	
	@Autowired
	private UsersDiaryDAO usersDiaryDAO;
	
	@Autowired
	private Post_ArticleDAO post_ArticleDAO;
	
	//检查是否是管理员登录
	public boolean checkAdmin(Users users){
		boolean result=false;
		System.out.println(usersDAO.selectLogin(users.getUserName(), users.getPassWord()).getIsadmin()==1);
			if(usersDAO.selectLogin(users.getUserName(), users.getPassWord()).getIsadmin()==1){
				result=true;
			}else{
				result=false;
			}
		return result;
	}
	
	
	//查询所有用户
	public List<Users> GetAllUserInfo(){
		return usersDAO.selectAll();
	}
	
	//更新用户密码
	public boolean UpdateUserPwd(Users users){
		boolean ret=false;
			if(usersDAO.updateUserPwd(users)>0){
				ret=true;
			}
		return ret;
	}
	
	
	//删除用户
	public boolean DeleteUser(Integer id){
		boolean ret=false;
			if(usersDAO.deleteUser(id)>0){
				ret=true;
			}
		return ret;
	}
	
	//根据名字查找用户
	public Users FindByName(String name){
		return usersDAO.selectByName(name);
	}
	
	//查询所有文章
	public List<Post_Article> GetAllArticle(){
		return post_ArticleDAO.ArticleList();
	}
	
	//发布文章
	public boolean GoArticle(Post_Article post_Article){
		boolean ret=false;
		if(post_ArticleDAO.InsertArticle(post_Article)>0){
			ret=true;
		}
		return ret;
	}
	
	//删除文章
	public boolean DelArticle(Integer id){
		boolean ret=false;
		if(post_ArticleDAO.DeleteArticle(id)>0){
			ret=true;
		}
		return ret;
	}
	
	//系统总人数
	public Integer SystemCounts(){
		Integer counts=0;
		counts=usersDAO.contUsers();
		System.out.println(counts);
		return counts;
	}
	
	
}
