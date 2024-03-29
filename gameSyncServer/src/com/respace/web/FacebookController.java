package com.respace.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import com.respace.domain.FacebookResponse;

@RequestMapping(value = "/social/facebook")
@Controller
public class FacebookController {

	private static final String SCOPE = "email,offline_access,user_about_me,user_birthday,read_friendlists";
	private static final String SERVER_DOMAIN = "http://localhost:8080/";
	//private static final String SERVER_DOMAIN = "http://respace.co.kr/";
	 
	private static final String REDIRECT_URI = SERVER_DOMAIN+"gameSyncServer/social/facebook/callback.do";
	private static final String CLIENT_ID = "525363714258644";
	private static final String APP_SECRET = "f788777467578d981da9db3331fe4832";
	private static final String DIALOG_OAUTH = "https://www.facebook.com/dialog/oauth";
	private static final String ACCESS_TOKEN = "https://graph.facebook.com/oauth/access_token";
	
	private static final String GAME_MATCH_URL = SERVER_DOMAIN+"gameSyncServer/game.main.do";

	@RequestMapping(value = "/signin.do", method = RequestMethod.GET)
	public void signin(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("hi signin");
		try {
			// TODO: if already have a valid access token, no need to redirect,
			// just login
			response.sendRedirect(DIALOG_OAUTH + "?client_id=" + CLIENT_ID
					+ "&redirect_uri=" + REDIRECT_URI + "&scope=" + SCOPE);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	@ResponseBody
	public String test(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("========TEST.DO=======");
		return "{\"name\":\"game_name\", \"round\":\"1\"}";
	}

	@RequestMapping(value = "/callback.do", params = "code", method = RequestMethod.GET)
	//@ResponseBody
	public ModelAndView accessCode(@RequestParam("code") String code,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			//response.setContentType("text/html");
			// https://graph.facebook.com/oauth/access_token?client_id=%3Cyour-client-id%3E&redirect_uri=%3Cthe-url-facebook-will-redirect-to%3E&code=%3Cthe-authorization-code-we-received-earlier%3E&client_secret=%3Cthe-client-secret%3E
			String responseString = ACCESS_TOKEN + "?client_id=" + CLIENT_ID
					+ "&redirect_uri=" + REDIRECT_URI + "&code=" + code
					+ "&client_secret=" + APP_SECRET + "&locale=ko_KR";
			// String responseString = IntegrationBase.readURLGET(ACCESS_TOKEN,
			// new String []{"client_id","redirect_uri","code",
			// "client_secret"},
			// new String[]{CLIENT_ID,REDIRECT_URI,code,APP_SECRET});
			//response.getWriter().write(responseString);
			//response.flushBuffer();
			//System.out.println("responseString : "+responseString);

			HttpClient httpclient = new DefaultHttpClient();
			try {

				HttpGet httpget = new HttpGet(responseString);

				HttpResponse responseBody = httpclient.execute(httpget);
				HttpEntity entity = responseBody.getEntity();

				if (entity != null) {
					BufferedReader rd = new BufferedReader(
							new InputStreamReader(responseBody.getEntity()
									.getContent()));

					String accessTokenStr = "";
					String line = "";
					while ((line = rd.readLine()) != null) {
						accessTokenStr += line;
					}
					accessTokenStr += "&locale=ko_KR";
					
					System.out.println("accessToken : "+"https://graph.facebook.com/me?"
							+ accessTokenStr);
					InputStream in = new URL("https://graph.facebook.com/me?"
							+ accessTokenStr).openStream();
					JsonReader reader = new JsonReader(new InputStreamReader(
							in, "UTF-8"));
					Gson gson = new Gson();
					FacebookResponse fBin = gson.fromJson(reader,
							FacebookResponse.class);
					;
					
					GameController.addGamerList(fBin);
					//System.out.println(GameController.facebookResponseList);
					
					//response.sendRedirect(GAME_MATCH_URL);
					ModelAndView model = new ModelAndView("redirect:"+GAME_MATCH_URL+"?id="+fBin.getId());
					//model.addObject("fBin", fBin);
					return model;
					

				}
				httpget.abort();
				httpclient.getConnectionManager().shutdown();

			} catch (ClientProtocolException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				httpclient.getConnectionManager().shutdown();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/callback.do", params = "error_reason", method = RequestMethod.GET)
	@ResponseBody
	public void error(@RequestParam("error_reason") String errorReason,
			@RequestParam("error") String error,
			@RequestParam("error_description") String description,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, description);
			System.out.println(errorReason);
			System.out.println(error);
			System.out.println(description);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}