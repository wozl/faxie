package com.cn.test;

import org.junit.Test;

public class test2 {
	
	@Test
	public void test(){
		MD5 Md5=new MD5();
		String aString="123456";
		String b=Md5.md5(aString);
		System.out.println(Md5.md5(b));
		
	}
	

}
