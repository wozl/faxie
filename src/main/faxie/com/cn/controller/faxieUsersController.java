package com.cn.controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.bean.Dynamic;
import com.cn.bean.Users;
import com.cn.bean.UsersData;
import com.cn.bean.UsersDiary;
import com.cn.bean.UsersDynamic;
import com.cn.services.faxieUsersServices;
import com.cn.util.MD5; 


/**
 * 用户行为控制层
 * **/
@Controller
@RequestMapping("/faxie")
public class faxieUsersController {
	
	@Autowired
	private faxieUsersServices faxieUsersServices;
	
	
	@RequestMapping(value="/shouye.do")
	public String shouye(){
		return "shouye";
	}
	
	@RequestMapping(value="/tianqi.do")
	public String tianqi(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "ip";
	}
	
	@RequestMapping(value="/Wel.do")
	public String Wel(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "Wel";
	}
	
	@RequestMapping(value="/music.do")
	public String music(HttpSession session){
		String name=(String) session.getAttribute("username");
		return "music";
	}
	
	//登录页
	@RequestMapping(value="/Login.do")
	public String Login(){
		return "index";
	}
	
	//注册页
	@RequestMapping(value="/register.do")
	public String register(){
		return "register";
	}
	
	//登陆后主页面
	@RequestMapping(value="/home.do")
	public String home(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "home";
	}
	
	//用户资料填写页
	@RequestMapping(value="/tishi.do")
	public String tishi(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "tishi";
	}
	
	//用户资料更新详情页
	@RequestMapping(value="/userdata.do")
	public String userdata(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "UpUserData";
	}
	
	//跳转用户个人资料页
	@RequestMapping(value="/datauser.do")
	public String datauser(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "UserData";
	}
	
	//跳转编辑日记页
	@RequestMapping(value="/gowrite_diary.do")
	public String write_diary(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "write_diary";
	}
	
	//跳转用户日记页
	@RequestMapping(value="/gowrite_diary_list.do")
	public String write_diary_list(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "write_diary_list";
	}
	
	//跳转到音乐搜索页
	@RequestMapping(value="/gomusic.do")
	public String gomusic(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "sou";
	}
	
	//跳到用户动态页
	@RequestMapping(value="/gocon.do")
	public String Con(HttpSession session){
		String name=(String) session.getAttribute("username");
		if(name==null){
			return "shouye";
		}
		return "AllDynamic";
	}
	
	//跳到登陆用户个人动态页
	@RequestMapping(value="/userdys.do")
	public String userdys(HttpSession session){
		String name=(String) session.getAttribute("username");
		if (name==null) {
			return "shouye";
		}
		return "UserDynamic";
	}
	
	//注册处理
	@RequestMapping(value="/reg.do",method=RequestMethod.POST)
	public String reg(Users users,HttpServletRequest request , HttpServletResponse response) throws IOException{
			Integer code;
		if(faxieUsersServices.selectName(users.getUserName())){
			//对用户密码进行二次加密
			MD5 md5= new MD5();
			System.out.println(users.getPassWord());
			String pwd=md5.getMD5(users.getPassWord());
			String pwd2=md5.getMD5(pwd);
			users.setPassWord(pwd2);
			if(faxieUsersServices.reg(users)){
					code=0;
					String result="{\"userName\":\""+ users.getUserName() +"\",\"code\":\" "+ code+" \"}";
					PrintWriter  out=null;
					response.setContentType("application/json");
					out=response.getWriter();
					out.write(result);
					return "register";
				}
			}
				code=1;
				String result="{\"userName\":\""+ users.getUserName() +"\",\"code\":\" "+ code+" \"}";
				PrintWriter  out=null;
				response.setContentType("application/json");
				out=response.getWriter();
				out.write(result);
				return "register";
	}
	
	//登陆处理
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer login(Users users,HttpServletRequest request,HttpSession session){
		MD5 md5= new MD5();
		System.out.println(users.getPassWord());
		String pwd=md5.getMD5(users.getPassWord());
		String pwd2=md5.getMD5(pwd);
		users.setPassWord(pwd2);
		Integer code;
		if(faxieUsersServices.login(users)){
			Users users2=faxieUsersServices.selectUsers(users.getUserName());
			System.out.println(users2.getId());
			if(faxieUsersServices.checkUserData(users2.getId())){
				session.setAttribute("username", users.getUserName());
				code=1;
				return code;
			}
			code=0;
			session.setAttribute("username", users.getUserName());
			return code;
		}
			code=2;
		return  code;
	}
	
	//获取用户填写的资料
	@RequestMapping(value="/getuserdata.do")
	@ResponseBody
	public Integer GetUserData(UsersData usersData,HttpServletRequest request,HttpSession session){
		Integer code;
		String name=(String) session.getAttribute("username");
		System.out.println(name);
		Users users=faxieUsersServices.selectUsers(name);
		usersData.setUserID(users.getId());
		if(faxieUsersServices.addUsersData(usersData)){
			code=0;
		}else{
			code=1;
		}
		return code;
	}
	
	//输入登陆用户资料到用户个人资料页
	@RequestMapping(value="/goUserData.do")
	@ResponseBody
	public UsersData goUsersData(HttpSession session){
		String name=(String)session.getAttribute("username");
		Users users=faxieUsersServices.selectUsers(name);
		if(faxieUsersServices.selectData(users.getId())!=null){
			UsersData usersData= faxieUsersServices.selectData(users.getId());
			return usersData;
		}
		return null;
	}
	
	//对用户编写的日记进行储存
	@RequestMapping(value="/writedata.do")
	@ResponseBody
	public Integer getDiary(UsersDiary usersDiary,HttpServletRequest request,HttpSession session){
		Integer code;
		String name=(String)session.getAttribute("username");
		Users users=faxieUsersServices.selectUsers(name);
		usersDiary.setUserDiary(users.getId());
		if(faxieUsersServices.adddiarydata(usersDiary)){
			//BeanUtils.copyProperties(source, target);  使用此方法负责对象到另一个对象
			//第一个参数是要被复制的对象，第二是复制后的对象    第二个对象如果要截取第一个对象的某个熟悉，只需要在创建第二个对象的时候创建属性和第一个要被截取的属性名相等即可
			
			code=1;
		}else{
			code=0;
		}
		return code;
	}
	
	//输出当前用户所有编写日记的标题和时间
	@RequestMapping(value="/gettitle.do")
	@ResponseBody
	private List<UsersDiary> gettitle(HttpServletRequest request,HttpSession session){
		String name=(String)session.getAttribute("username");
		Users users=faxieUsersServices.selectUsers(name);
		if(faxieUsersServices.getTitle(users.getId())!=null){
			List<UsersDiary>diary=faxieUsersServices.getTitle(users.getId());
			return diary;
		}
		return null;
	}
	
	//跳转用户日记内容页
	@RequestMapping(value="/gocontent.do",method=RequestMethod.POST)
	public String gocontent(String times,HttpServletRequest request,HttpSession session,Model model){
		String name=(String)session.getAttribute("username");
		if(name!=null){
			Users users=faxieUsersServices.selectUsers(name);

			UsersDiary usersDiary= new UsersDiary();
			
			usersDiary.setWriteTime(times);
			usersDiary.setUserDiary(users.getId());
			UsersDiary usersDiary2=faxieUsersServices.getcontent(usersDiary);
			//System.out.println(usersDiary2.getContent());
			model.addAttribute("usersDiary",usersDiary2);
			return "write_diary_content";
		}
			return "index";
	}
	
	//用户注销
	@RequestMapping(value="/Write_off.do" )
	public String gohome(HttpServletRequest request){
		request.getSession().invalidate();
		return "shouye";
	}
	
	//查询所有用户动态
	@RequestMapping(value="/getalldynamic.do",method=RequestMethod.POST)
	@ResponseBody
	public List<UsersDynamic>getalldynamic(HttpServletRequest request,HttpSession session){
		String name=(String)session.getAttribute("username");
		if(faxieUsersServices.selectUsers(name)!=null){
			List<UsersDynamic>dy=faxieUsersServices.getall();
			
			return dy;
		}
		return null;
	}
	
	//当前用户登陆用户发表动态
	@RequestMapping(value="/getPublished.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer Published(Dynamic dynamic,HttpServletRequest request,HttpSession session){
		String name=(String)session.getAttribute("username");
		if(faxieUsersServices.selectUsers(name)!=null){
			Users users=faxieUsersServices.selectUsers(name);
			dynamic.setUsersId(users.getId());
			if(faxieUsersServices.getPublished(dynamic)){
				return 1;
			}
		}
		return 0;
	}
	
	//查询当前用户发布过的所有动态
	@RequestMapping(value="/getallDy.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Dynamic> getUserAllDynamic(HttpServletRequest request,HttpSession session){
		String name=(String)session.getAttribute("username");
		if(faxieUsersServices.selectUsers(name)!=null){
			Users users=faxieUsersServices.selectUsers(name);
			Dynamic dynamic= new Dynamic();
			dynamic.setUsersId(users.getId());
			List<Dynamic>dyn=faxieUsersServices.getAll(dynamic);
			return dyn ;
		}
		
		return null;
	}
	
	
	
}
