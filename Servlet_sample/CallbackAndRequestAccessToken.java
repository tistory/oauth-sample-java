package oauth;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.security.Security;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class CallbackAndRequestAccessToken extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
        	
        	/**
        	* OAuth2.0 단계중 Authorization code callback 및 Access Token 발급의 간단 예제 
        	*/
        	
        	String authorization_code = request.getParameter("code"); //최초 발급 요청으로 부터 받은 authorization code 입력
        	
        	String clientId = "{발급받은 client_id를 입력하세요}";
        	String clientSecret = "{발급받은 client_secret 을 입력하세요}";
        	String redirectUri = "{등록시 입력한 redirect uri 를 입력하세요}";
        	String grantType = "authorization_code";

        	String requestUrl = "https://www.tistory.com/oauth/access_token/?code=" + authorization_code + 
        					"&client_id=" + clientId + 
        					"&client_secret=" + clientSecret +
        	 				"&redirect_uri=" + redirectUri +
        					"&grant_type=" + grantType;
        	
        	try {
        	
        		System.setProperty ( "java.protocol.handler.pkgs","com.sun.net.ssl.internal.www.protocol");
        		com.sun.net.ssl.internal.ssl.Provider provider = new com.sun.net.ssl.internal.ssl.Provider();
        		Security.addProvider(provider);
        		
        		URL url = new URL(requestUrl);
        		URLConnection connection = url.openConnection();
        		
        		InputStream is = connection.getInputStream();
        		InputStreamReader isr = new InputStreamReader(is);
        		BufferedReader br = new BufferedReader(isr);
        		
        		out.println(br.readLine());
        		        		
        	} catch (Exception e) {
        		e.printStackTrace();
        	}
            
        } finally { 
            out.close();
        }
    } 

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }

}