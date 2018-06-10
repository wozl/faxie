package com.cn.dao;

import java.util.List;
import com.cn.bean.Post_Article;

public interface Post_ArticleDAO {

	int InsertArticle(Post_Article post_Article);//发布文章
	
	int DeleteArticle(Integer id);//删除文章
	
	List<Post_Article> ArticleList();//所有文章列表
}
