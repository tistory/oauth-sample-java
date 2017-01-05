<%@ page contentType="text/html;charset=utf-8"%>
 
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLConnection"%>
<%@ page import="java.security.Security;"%>

<%

	/*
	* OAuth2.0 단계중 Authorization code callback 및 Access Token 발급의 간단 예제 
	*/

	String authorization_code = request.getParameter("code"); //최초 발급 요청으로 부터 받은 authorization code 입력
	
	String client_id = "{발급받은 client_id를 입력하세요}";
	String client_secret = "{발급받은 client_secret 을 입력하세요}";
	String redirect_uri = "{등록시 입력한 redirect uri 를 입력하세요}";
	String grant_type = "authorization_code"; //반드시 이단계에서는 authorization_code 라고 입력

	String url = "https://www.tistory.com/oauth/access_token/?code=" + authorization_code + 
					"&client_id=" + client_id + 
					"&client_secret=" + client_secret +
	 				"&redirect_uri=" + redirect_uri +
					"&grant_type=" + grant_type;
	
	try {
	
		System.setProperty ( "java.protocol.handler.pkgs","com.sun.net.ssl.internal.www.protocol");
		com.sun.net.ssl.internal.ssl.Provider provider = new com.sun.net.ssl.internal.ssl.Provider();
		Security.addProvider(provider);
	
		URLConnection connection;
		InputStream is;
		InputStreamReader isr;
		BufferedReader br;
		
		URL url = new URL(url);
		connection = url.openConnection();
		is = connection.getInputStream();
		isr = new InputStreamReader(is);
		br = new BufferedReader(isr);

		while (true) {
			if (br.readLine() == null)
				break;
			out.println(br.readLine());
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>

