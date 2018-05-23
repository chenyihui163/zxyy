/**
 * 
 */
package cn.myzqu.zxyy.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Map.Entry;


import com.alibaba.fastjson.JSONObject;

/**
 * <p>Title: HttpRequestUtils</p>
 * <p>Description: 网络请求</p>
 * <p>Company: none</p> 
 * @author  
 * @date 
 */
public class HttpRequestUtils {
	
    public static String sendPost(String urlParam, Map<String, Object> params) {  
        StringBuffer resultBuffer = null;  
        StringBuffer sbParams = new StringBuffer();  
        if (params != null && params.size() > 0) {  
            for (Entry<String, Object> e : params.entrySet()) {  
                sbParams.append(e.getKey());  
                sbParams.append("=");  
                sbParams.append(e.getValue());  
                sbParams.append("&");  
            }  
        }  
        HttpURLConnection con = null;  
        OutputStreamWriter osw = null;  
        BufferedReader br = null;  
     
        try {  
            URL url = new URL(urlParam);  
            con = (HttpURLConnection) url.openConnection();  
            con.setRequestMethod("POST");  
            con.setDoOutput(true);  
            con.setDoInput(true);  
            con.setUseCaches(false);  
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");  
            if (sbParams != null && sbParams.length() > 0) {  
                osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");  
                osw.write(sbParams.substring(0, sbParams.length() - 1));  
                osw.flush();  
            }  
       
            resultBuffer = new StringBuffer();  
            int contentLength = Integer.parseInt(con.getHeaderField("Content-Length"));  
            if (contentLength > 0) {  
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));  
                String temp;  
                while ((temp = br.readLine()) != null) {  
                    resultBuffer.append(temp);  
                }  
            }  
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        } finally {  
            if (osw != null) {  
                try {  
                    osw.close();  
                } catch (IOException e) {  
                    osw = null;  
                    throw new RuntimeException(e);  
                } finally {  
                    if (con != null) {  
                        con.disconnect();  
                        con = null;  
                    }  
                }  
            }  
            if (br != null) {  
                try {  
                    br.close();  
                } catch (IOException e) {  
                    br = null;  
                    throw new RuntimeException(e);  
                } finally {  
                    if (con != null) {  
                        con.disconnect();  
                        con = null;  
                    }  
                }  
            }  
        }  
  
        return resultBuffer.toString();  
    }  

	public static String jsonPost(String strURL, String params) {
		try {
			URL url = new URL(strURL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestMethod("POST"); 
			connection.setRequestProperty("Accept", "application/json"); 
			connection.setRequestProperty("Content-Type", "application/json"); 
			connection.connect();
			OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8"); 
			out.append(JSONObject.toJSON(params).toString());
			out.flush();
			out.close();

			int code = connection.getResponseCode();
			InputStream is = null;
			if (code == 200) {
				is = connection.getInputStream();
			} else {
				is = connection.getErrorStream();
			}
			int length = (int) connection.getContentLength();
			if (length != -1) {
				byte[] data = new byte[length];
				byte[] temp = new byte[512];
				int readLen = 0;
				int destPos = 0;
				while ((readLen = is.read(temp)) > 0) {
					System.arraycopy(temp, 0, data, destPos, readLen);
					destPos += readLen;
				}
				String result = new String(data, "UTF-8");
				return result;
			}

		} catch (IOException e) {
			System.err.println(e);;
		}
		return "error";
	}
	
	public static InputStream httpPostWithJSON(String strURL, String json)
            throws Exception {
		URL url = new URL(strURL);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setDoOutput(true);
		connection.setDoInput(true);
		connection.setUseCaches(false);
		connection.setInstanceFollowRedirects(true);
		connection.setRequestMethod("POST"); 
		connection.setRequestProperty("Accept", "application/json"); 
		connection.setRequestProperty("Content-Type", "application/json"); 
		connection.connect();
		OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8"); 
		out.append(json);
		out.flush();
		out.close();
		int code = connection.getResponseCode();
		InputStream is = null;
		if (code == 200) {
			is = connection.getInputStream();
		} else {
			is = connection.getErrorStream();
		}
        return is;
    }
	
}
