package com.respace.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class GameController {
private Logger logger = Logger.getLogger(getClass());

	

	private static UpdateSemaphore updateProvider = new UpdateSemaphore();
	private static List<GameController> consumerList = new ArrayList<GameController>();
	private static int consumerNum = 0;	
	
	@RequestMapping(value="/game.login.do")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hi! I am here");
//		Facebook facebook = new FacebookFactory().getInstance();
//		// facebook 인스턴스를 생성합니다.
//		facebook.setOAuthAppId("525363714258644", "f788777467578d981da9db3331fe4832");
//		facebook.setOAuthPermissions("email, publish_actions, publish_stream, user_likes, friends_likes, read_stream");
//		// 권한 요청
//		request.getSession().setAttribute("facebook", facebook);
//		System.out.println("facebook: "+facebook);
		// 세션에 현재 facebook 인스턴스를 등록ㅋ 
//		StringBuffer callbackURL = request.getRequestURL();
//		int index = callbackURL.lastIndexOf("/");
//		callbackURL.replace(index, callbackURL.length(), "")
//				.append("/callback");
//		// 콜백주소를 만들었어요. http://적절한주소/callback입니다
//		try {
//			response.sendRedirect(facebook.getOAuthAuthorizationURL(callbackURL
//					.toString()));
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		ModelAndView model = new ModelAndView("redirect:game.main.do");
		
		 
		return model;
	}
	
	@RequestMapping(value="/game.main.do")
    public ModelAndView gameMain(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("game_mobile");
		
		
		return model;
	}
	
	@RequestMapping(value="/game.index.do")
    public ModelAndView gameIndex(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("game_mobile_login");
		
		
		return model;
	}
	
	@RequestMapping(value="/game.queueGameInfo.do")
    public View queueGameInfo(HttpServletRequest request, HttpServletResponse response) {
		String name = ServletRequestUtils.getStringParameter(request, "name", "");
		
		
		consumerNum++;
		System.out.println("업댓있나여? waiting num :"+consumerNum);
		
		return new RedirectView("game.updateGameInfo.do");
	}
	
	@RequestMapping(value="/game.updateGameInfo.do")
    public @ResponseBody String updateGameInfo(HttpServletRequest request, HttpServletResponse response) {
		Integer query_page = ServletRequestUtils.getIntParameter(request, "query_page", 1);
		
		//Integer query_start = ServletRequestUtils.getIntParameter(request, "query_start", 0);
		//Integer query_number = ServletRequestUtils.getIntParameter(request, "query_number", 12);
		
				//ModelAndView model = new ModelAndView();
		//model.addObject("eventList", eventList);
		
//		try {
//			Thread.sleep(3000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
		try {
			updateProvider.waitUntilUpdate();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("업댓합니다!");
		//System.out.println("빼기 전."+consumerList.size());
		//consumerList.remove(this);
		consumerNum--;
		System.out.println("기다리는 놈 수:"+consumerNum);
		//System.out.println("뺀 후."+consumerList.size());
		if(consumerNum == 0){
			System.out.println("기다리는사람이 0이니깐 업데이트 없다고 표시할게여");
			updateProvider.setNoUpdate();
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		//return new ResponseEntity<String>(MyJsonUtil.toString("test", "Events"), responseHeaders, HttpStatus.CREATED);
		return "success";
	}
	
	@RequestMapping(value="/game.makeUpdate.do")
    public @ResponseBody String eventDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		Integer id = ServletRequestUtils.getIntParameter(request, "id", 0);
//	
		updateProvider.notifyUpdate();
		
		return "success";
    }
	
	@RequestMapping(value="/game.dummy.do")
    public @ResponseBody String dummy(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		Integer id = ServletRequestUtils.getIntParameter(request, "id", 0);
//	
		//updateProvider.notifyUpdate();
		
		return "dummy";
    }
}
