package QA;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class test {
	
	public static StringBuffer doQa(String question){
		
		 //String APIKEY = "e7a1447ed2182d57758ca845e5a0f36e";
	     String APIKEY = "e23fe625f2e14f9da069305ccc7a3d5a";
	 
        //String INFO = URLEncoder.encode("北京今日天气", "utf-8"); 
		 
		 try{
			  
			    String INFO = URLEncoder.encode(question, "utf-8"); 
		        String getURL = "http://www.tuling123.com/openapi/api?key=" + APIKEY + "&info=" + INFO; 
		        URL getUrl = new URL(getURL); 
		        HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection(); 
		        connection.connect(); 
		        // 取得输入流，并使用Reader读取
		        BufferedReader reader = new BufferedReader(new InputStreamReader( connection.getInputStream(), "utf-8")); 
		        StringBuffer sb = new StringBuffer(); 
		        String line = ""; 
		        while ((line = reader.readLine()) != null) { 
		            sb.append(line); 
		        } 
		        reader.close();
		        connection.disconnect();
		        
		        return sb;
			 
		 }catch(Exception e){
			//异常处理
			 StringBuffer sb = new StringBuffer("出错啦"); 
			 return sb;
		 }
       
		
		
	}
	
}