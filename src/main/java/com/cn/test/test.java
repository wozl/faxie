package com.cn.test;

public class test {

	public static void main(String[] args) {
			String aString="aaaa";
			MD5 Md5=new MD5();
			String aString2 =Md5.md5(aString);
			String string=Md5.md5(aString2);
			System.out.println(string);
		
	}
	
}
