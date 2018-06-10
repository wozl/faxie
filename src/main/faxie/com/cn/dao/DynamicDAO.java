package com.cn.dao;

import java.util.List;

import com.cn.bean.Dynamic;

/**
 * 用户评论
 * **/

public interface DynamicDAO {

	int adduserDynamic(Dynamic dynamic);//储存当前登陆用户的动态
	
	
	List<Dynamic> getUserDynamic(Dynamic dynamic);//查询当前登陆用户所写的所有动态
	
	
	
}
