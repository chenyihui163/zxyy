package cn.myzqu.zxyy.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {


	public static String formatDate(Date date){
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(date!=null){
			result=sdf.format(date);
		}
		return result;
	}
	
	
	public static Date formatString(String str) throws Exception{
	
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.parse(str);
	}
	
	public static Date getCurrentDateStr()throws Exception{
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		//return sdf.format(date);
		return date;
	}
}
