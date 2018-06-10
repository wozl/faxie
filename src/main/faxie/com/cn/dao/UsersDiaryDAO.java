package com.cn.dao;

import java.util.List;

import com.cn.bean.UsersDiary;

public interface UsersDiaryDAO {
	
	List<UsersDiary> selectTitle(Integer id);//根据用户id查该用户的所有日记的标题
	
	UsersDiary selectDiaryData(String title);//根据日记标题去查询日记内容
	
	
	int addDiary(UsersDiary usersDiary);//储存用户编写的日记

	UsersDiary selectcontent(UsersDiary UserDiary);//根据用户点击的标题去查询详细内容
	
}
