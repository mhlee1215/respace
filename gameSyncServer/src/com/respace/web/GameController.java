package com.respace.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.respace.domain.FacebookResponse;
import com.respace.domain.GameStatus;
import com.respace.util.MyJsonUtil;

@Controller
public class GameController {
private Logger logger = Logger.getLogger(getClass());
	public static int time_max = 5;
	
	public static List<FacebookResponse> facebookResponseList = new ArrayList<FacebookResponse>();
	public static Map<String, String> matchUserSideMap = new HashMap<String, String>();
	public static Map<String, String> userHistoryMap = new HashMap<String, String>();
	public static GameStatus gameStatus = new GameStatus();
	public static GameStatus gameStatusTemp = null;

	private static UpdateSemaphore updateProvider = new UpdateSemaphore();
	private static List<GameController> consumerList = new ArrayList<GameController>();
	private static int consumerNum = 0;	
	
	private static UpdateSemaphore decisionProvider = new UpdateSemaphore();
	private static UpdateSemaphore userInfoProvider = new UpdateSemaphore();
	private static UpdateSemaphore mobileResultProvider = new UpdateSemaphore();
	private static int waitingMobileNum = 0;
	
	public static void addGamerList(FacebookResponse newUser){
		facebookResponseList.add(newUser);
		userHistoryMap.put(newUser.getId(), "1");
		setReadyGamers();
	}
	
	public static void setReadyGamers(){
		System.out.println("11gameStatus: "+gameStatus);
		
		if(gameStatus.getLeftUser() != null && gameStatus.getRightUser() != null){
			
			return;
		}
			
		
		if(facebookResponseList.size() == 0)
			return;
		
		FacebookResponse newUser = facebookResponseList.get(0);
		
		
		if(gameStatus.getLeftUser() == null){
			matchUserSideMap.put(newUser.getId(), "left");
			gameStatus.setLeftUser(newUser);
			facebookResponseList.remove(newUser);
			try {
				userInfoProvider.notifyUpdate();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			setReadyGamers();
		}else if(gameStatus.getRightUser() == null){
			matchUserSideMap.put(newUser.getId(), "right");
			gameStatus.setRightUser(newUser);
			facebookResponseList.remove(newUser);
			try {
				userInfoProvider.notifyUpdate();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			setReadyGamers();
		}else{
			//DO NOTHING.
		}
	}
	
	public static void gameInit(){
		gameStatus = new GameStatus();
	}
	
	public static void goNextGame(String winUserId){
		
		//Remove loser in gamer list
		if(matchUserSideMap.get(winUserId) == null){
			//return "fail-map-null-error";
		}else{
			if("left".equalsIgnoreCase(matchUserSideMap.get(winUserId))){
				facebookResponseList.remove(2);
			}else if("right".equalsIgnoreCase(matchUserSideMap.get(winUserId))){
				facebookResponseList.remove(1);
			}else{
				
			}
		}
		
		
		
		
	}
	
//	@RequestMapping(value="/game.login.do")
//    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
//		System.out.println("Hi! I am here");
//		
//		ModelAndView model = new ModelAndView("redirect:game.main.do");
//		
//		 
//		return model;
//	}
	
	@RequestMapping(value="/game.main.do")
    public ModelAndView gameMain(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("game_mobile");
		
        String id = request.getParameter("id");
        //System.out.println("id:"+id);
		model.addObject("id", id);
		return model;
	}
	
	@RequestMapping(value="/game.changeDecision.do")
	@ResponseBody
    public String changeDecision(HttpServletRequest request, HttpServletResponse response) {
		//ModelAndView model = new ModelAndView("game_mobile");
		String id = request.getParameter("id");
		String choise = request.getParameter("choise");
		
		System.out.println("matchUserSideMap: "+matchUserSideMap);
		
		if(matchUserSideMap.get(id) == null){
			return "fail-map-null-error";
		}else{
			if("right".equalsIgnoreCase(matchUserSideMap.get(id))){
				gameStatus.setRightUserChoise(choise);
			}else if("left".equalsIgnoreCase(matchUserSideMap.get(id))){
				gameStatus.setLeftUserChoise(choise);
			}else{
				return "fail-no-matched-side-error";
			}
		}
		
		if(gameStatus.isDecisionFinished()){
			try {
				decisionProvider.notifyUpdate();
				
				return "finish";
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "success";
	}
	
	@RequestMapping(value="/game.waitingGamers.do")
    public ResponseEntity<String> waitingGamers(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			userInfoProvider.waitUntilUpdate();
			userInfoProvider.setNoUpdate();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		return new ResponseEntity<String>(gameStatus.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/game.waitingMobileResult.do")
    public ResponseEntity<String> waitingMobileResult(HttpServletRequest request, HttpServletResponse response) {
		
		waitingMobileNum++;
		
		try {
			mobileResultProvider.waitUntilUpdate();
			//mobileResultProvider.setNoUpdate();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		waitingMobileNum--;
		if(waitingMobileNum == 0){
			mobileResultProvider.setNoUpdate();
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		return new ResponseEntity<String>(gameStatusTemp.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/game.waitingDecisions.do")
    public ResponseEntity<String> waitingDecisions(HttpServletRequest request, HttpServletResponse response) {
		String gameStatusStr = "";
		try {
			decisionProvider.waitUntilUpdate();
			
			if(GameStatus.TYPE_PAPER.equalsIgnoreCase(gameStatus.getRightUserChoise())){
				if(GameStatus.TYPE_PAPER.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//draw
					gameStatus.draw();
				}else if(GameStatus.TYPE_ROCK.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//right wins
					gameStatus.rightWins();
				}else if(GameStatus.TYPE_SCISSOR.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//left wins
					gameStatus.leftWins();
				}
			}else if(GameStatus.TYPE_ROCK.equalsIgnoreCase(gameStatus.getRightUserChoise())){
				if(GameStatus.TYPE_PAPER.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//left wins
					gameStatus.leftWins();
				}else if(GameStatus.TYPE_ROCK.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//draw
					gameStatus.draw();
				}else if(GameStatus.TYPE_SCISSOR.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//right wins
					gameStatus.rightWins();
				}
			}else if(GameStatus.TYPE_SCISSOR.equalsIgnoreCase(gameStatus.getRightUserChoise())){
				if(GameStatus.TYPE_PAPER.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//right wins
					gameStatus.rightWins();
				}else if(GameStatus.TYPE_ROCK.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//left wins
					gameStatus.leftWins();
				}else if(GameStatus.TYPE_SCISSOR.equalsIgnoreCase(gameStatus.getLeftUserChoise())){
					//draw
					gameStatus.draw();
				}
			}
			
			gameStatusStr = gameStatus.toString();
			
			gameStatusTemp = gameStatus;
			
			//Reset game except winner
			if(gameStatus.getLeftUserWins() == 3 || gameStatus.getRightUserWins() == 3){
				//gameStatus 
				if(gameStatus.getLeftUserWins() == 3){
					dropUser(gameStatus.getRightUser().getId());
					//gameStatus.setRightUser(null);	
				}
				if(gameStatus.getRightUserWins() == 3){
					dropUser(gameStatus.getLeftUser().getId());
					//gameStatus.setLeftUser(null);	
				}
				//gameStatus.resetChoise();
				//gameStatus.resetScore();
				
				//System.out.println("111GameStatus:"+gameStatus);
				
			}
			
			decisionProvider.setNoUpdate();
			mobileResultProvider.notifyUpdate();
			userInfoProvider.notifyUpdate();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		gameStatus.resetChoise();
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		return new ResponseEntity<String>(gameStatusStr, responseHeaders, HttpStatus.CREATED);
	}
	
//	@RequestMapping(value="/game.getNextStatus.do")
//    public ResponseEntity<String> getNextStatus(HttpServletRequest request, HttpServletResponse response) {
//		Integer time_current = ServletRequestUtils.getIntParameter(request, "time_current", 0);
//		System.out.println("time_current:"+time_current);
//		if(time_current == 0){
//			gameInit();
//		}else{
//			gameStatus.setTime_current(time_current+1);
//		}
//		
//		
//		
//		try {
//			Thread.sleep(1000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		//System.out.println(gameStatus);
//		
//		
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
//		return new ResponseEntity<String>(gameStatus.toString(), responseHeaders, HttpStatus.CREATED);
//	}
	
	@RequestMapping(value="/game.index.do")
    public ModelAndView gameIndex(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("game_mobile_login");
		
		
		return model;
	}
	
	@RequestMapping(value="/game.web.do")
    public ModelAndView gameWeb(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("game_web");
		model.addObject("gameStatus", gameStatus);
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
	
	@RequestMapping(value="/game.reset.do")
    public ModelAndView reset(HttpServletRequest request, HttpServletResponse response) throws Exception {		
//	
		facebookResponseList.clear();
		gameStatus = new GameStatus();
		decisionProvider = new UpdateSemaphore();
		userInfoProvider = new UpdateSemaphore();
		mobileResultProvider = new UpdateSemaphore();
		matchUserSideMap.clear();
		waitingMobileNum = 0;
		
		ModelAndView model = new ModelAndView("redirect:game.web.do");
		//model.addObject("fBin", fBin);
		return model;
    }
	
	public void dropUser(String id){
		for(FacebookResponse response : facebookResponseList){
			if(id.equals(response.getId()))
				facebookResponseList.remove(response);
		}
		if("right".equals(matchUserSideMap.get(id))){
			gameStatus.setRightUser(null);
			
		}else if("left".equals(matchUserSideMap.get(id))){
			gameStatus.setLeftUser(null);
		}
		gameStatus.resetChoise();
		gameStatus.resetScore();
		matchUserSideMap.put(id, null);	
		
		try {
			userInfoProvider.notifyUpdate();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		setReadyGamers();
	}
	
//	@RequestMapping(value="/game.dropUser.do")
//    public ModelAndView dropUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String id = ServletRequestUtils.getStringParameter(request, "id", "");
//		
//		if(!id.isEmpty()){
//			dropUser(id);
//			userInfoProvider.notifyUpdate();
//		}
//		
//		ModelAndView model = new ModelAndView("redirect:game.index.do");
//		//model.addObject("fBin", fBin);
//		return model;
//    }
}
