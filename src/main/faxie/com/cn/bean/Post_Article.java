package com.cn.bean;
/**
 * 文章类
 * **/
public class Post_Article {
	
	private int Aid;
	private String Article_title;
	private String Article_content;
	private String Issuing_time;
	private Integer Love;
	private String Posted_by;
	public int getAid() {
		return Aid;
	}
	public void setAid(int aid) {
		Aid = aid;
	}
	public String getArticle_title() {
		return Article_title;
	}
	public void setArticle_title(String article_title) {
		Article_title = article_title;
	}
	public String getArticle_content() {
		return Article_content;
	}
	public void setArticle_content(String article_content) {
		Article_content = article_content;
	}
	public String getIssuing_time() {
		return Issuing_time;
	}
	public void setIssuing_time(String issuing_time) {
		Issuing_time = issuing_time;
	}
	public Integer getLove() {
		return Love;
	}
	public void setLove(Integer love) {
		Love = love;
	}
	public String getPosted_by() {
		return Posted_by;
	}
	public void setPosted_by(String posted_by) {
		Posted_by = posted_by;
	}
	@Override
	public String toString() {
		return "Post_Article [Aid=" + Aid + ", Article_title=" + Article_title + ", Article_content=" + Article_content
				+ ", Issuing_time=" + Issuing_time + ", Love=" + Love + ", Posted_by=" + Posted_by + "]";
	}
	public Post_Article(int aid, String article_title, String article_content, String issuing_time, Integer love,
			String posted_by) {
		super();
		Aid = aid;
		Article_title = article_title;
		Article_content = article_content;
		Issuing_time = issuing_time;
		Love = love;
		Posted_by = posted_by;
	}
	public Post_Article() {
		super();
	}
	
	
	

}
