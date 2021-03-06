package com.cn.test;

import java.math.BigInteger;
import java.security.MessageDigest;



/**
 * MD5加密
 * **/
public class MD5 {
	public static String md5(String str){
		try {
			//计算方式
			MessageDigest md5=MessageDigest.getInstance("MD5");
			//计算md5函数
			md5.update(str.getBytes());
			 // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
            // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式
			String  md=new BigInteger(1, md5.digest()).toString(16);
			//BigInteger会把0省略掉，需补全至32位
			return fillMd5(md);
		} catch (Exception e) {
			throw new RuntimeException("MD5加密错误:"+e.getMessage(),e);
		}
	}
	public static String fillMd5(String MD5){
		return MD5.length()==32?MD5:fillMd5("0"+MD5);
	}

}
