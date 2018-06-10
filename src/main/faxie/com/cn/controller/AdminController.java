package com.cn.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResultUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.bean.Users;
import com.cn.bean.Post_Article;
import com.cn.services.AdminServices;
import com.cn.util.MD5;

@Controller
@RequestMapping("/admin")
public class AdminController {

	
	@Autowired
	private AdminServices adminServices;
	
	
	//MD5加密
	MD5 md5= new MD5();
	
	
	
	//跳转登录
	@RequestMapping(value="AdminLogin.do")
	public String GoLogin(){
		
		return "admin/index";
	}
	
	//跳转到管理员主页
	@RequestMapping(value="AdminHome.do")
	public String GoAdminHome(HttpSession session){
		if(session.getAttribute("username")==null){
			return "admin/index";
		}
		return "admin/admin";
	}
	
	
	//跳转到系统用户列表
	@RequestMapping(value="AdminUsersList.do")
	public String GoUsersList(HttpSession session){
		if(session.getAttribute("username")==null){
			return "admin/index";
		}
		return "admin/Users";
	}
	
	//跳转到文章管理页
	@RequestMapping(value="AdminActicle_management.do")
	public String GoArticle_management(HttpSession session){
		if(session.getAttribute("username")==null){
			return "admin/index";
		}
		return "admin/Article_management";
	}
	
	//跳转文章编辑页
	@RequestMapping(value="AdminActicle.do")
	public String GoActicle_editor(HttpSession session){
		if(session.getAttribute("username")==null){
			return "admin/index";
		}
		return "admin/Article_editor";
	}
	
	//跳转到系统信息页
	@RequestMapping(value="GoServices.do")
	public String GoServices(HttpSession session){
		if(session.getAttribute("username")==null){
			return "admin/index";
		}
		return "admin/Server_status";
	}
	
	//管理员登录
	@RequestMapping(value="adminlogin.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer AdminLogin(Users users,HttpServletRequest request,HttpSession session){
		Integer code=0;
		String pwd=md5.getMD5(users.getPassWord());
		String pwd2=md5.getMD5(pwd);
		System.out.println(pwd2);
		users.setPassWord(pwd2);
		if(adminServices.checkAdmin(users)){
			session.setAttribute("username", users.getUserName());
			code=1;
		}else{
			code=0;
		}
		return code;
	}
	
	//获取系统用户信息
	@RequestMapping(value="admingetallusersinfo.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Users> GetAllUsersInfo(HttpSession session,HttpServletRequest request){
			List<Users> user=null;
		if(session.getAttribute("username")==null){
				user=null;
			}else{
				user=adminServices.GetAllUserInfo();
			}
			user=adminServices.GetAllUserInfo();
			return user;
	}
	
	//更新用户密码
	@RequestMapping(value="adminupdateuserpwd.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer UpdateUserPwd(Users users){
		Integer code=0;
		System.out.println(users.getPassWord());
		String pwd=md5.getMD5(users.getPassWord());
		String pwd2=md5.getMD5(pwd);
		users.setPassWord(pwd2);
		if(adminServices.UpdateUserPwd(users)){
			code=1;
		}
		return code;
	}
	
	
	//删除用户
	@RequestMapping(value="admindeleteuser.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer DeleteUser(Integer id){
		Integer code=0;
		
			if(adminServices.DeleteUser(id)){
				code=1;
			}
		return code;
	}
	
	//查询用户
	@RequestMapping(value="adminfinduser.do",method=RequestMethod.POST)
	@ResponseBody
	public Users FindUser(String name){
		Users users;
		users=adminServices.FindByName(name);	
		return users;
	}
	
	//发布文章
	@RequestMapping(value="adminpost_article.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer Post_article(Post_Article post_Article){
		Integer code=0;
		if(adminServices.GoArticle(post_Article)){
			code=1;
		}
		return code;
	}
	
	//查询所有文章
	@RequestMapping(value="admingetallarticle.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Post_Article> GetAllArticle(){
		List<Post_Article>article = adminServices.GetAllArticle();
		
		return article;
	}
	
	//删除文章
	@RequestMapping(value="admindelarticle.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer DelArticle(Integer id){
		Integer code=0;
		if(adminServices.DelArticle(id)){
			code=1;
		}
		return code;
	}
	
	//获取系统总人数
	@RequestMapping(value="adminsystemcounts.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer SystemCounts(){
		Integer count=0;
		count=adminServices.SystemCounts();
		
		return count;
	}
	
	//系统管理员登出
	@RequestMapping(value="adminloginout.do")
	public String AdminLoginOut(HttpSession session){
		session.invalidate();
		return "admin/index";
	}
	
}
