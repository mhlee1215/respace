package com.respace.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.respace.domain.RS_Code;
import com.respace.domain.RS_Project;
import com.respace.domain.RS_Space;
import com.respace.domain.RS_User;
import com.respace.service.CodeServiceImpl;
import com.respace.service.ProjectServiceImpl;
import com.respace.service.SpaceServiceImpl;
import com.respace.service.UserService;




@Controller
public class UserController {

	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private final UserService userService = null;
	
	@Autowired
	private final ProjectServiceImpl projectService = null;
	
	@Autowired
	private final SpaceServiceImpl spaceService = null;
	
	@Autowired
	private final CodeServiceImpl codeService = null;
	
	@RequestMapping("/space.do")
    public ModelAndView space(HttpServletRequest request, HttpServletResponse response) {
		RS_Space space = new RS_Space();
		List<RS_Space> spaceList = spaceService.readSpaceList(space);
 	    
		ModelAndView model = new ModelAndView("space");
		model.addObject("active", "space");
		model.addObject("spaceList", spaceList);
		return model;
    }
	
	@RequestMapping("/project.do")
    public ModelAndView project(HttpServletRequest request, HttpServletResponse response) {
		RS_Project project = new RS_Project();
		List<RS_Project> projectList = projectService.readProjectList(project);
 
		RS_Code code = null;
		code = new RS_Code();
		code.setCategory("project category");
		List<RS_Code> projectCodeList = codeService.readCodeList(code);
		
		ModelAndView model = new ModelAndView("project");
		model.addObject("active", "project");
		model.addObject("projectCodeList", projectCodeList);
		model.addObject("projectList", projectList);
		return model;
    }
	
	@RequestMapping("/join.do")
    public ModelAndView join(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("join");
		model.addObject("active", "join");
		return model;
    }
	
	@RequestMapping("/contact.do")
    public ModelAndView contact(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("contact");
		model.addObject("active", "contact");
		return model;
    }
	
	
	
	@RequestMapping("/index.do")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String submittedUserId = ServletRequestUtils.getStringParameter(request, "submittedUserId", "");
		String loginComplete = ServletRequestUtils.getStringParameter(request, "loginComplete", "false");
		String loginFail = ServletRequestUtils.getStringParameter(request, "loginFail", "false");
		String logoutComplete = ServletRequestUtils.getStringParameter(request, "logoutComplete", "false");
		String registerComplete = ServletRequestUtils.getStringParameter(request, "registerComplete", "false");
		String registerFail = ServletRequestUtils.getStringParameter(request, "registerFail", "false");
	    String userid = (String)request.getSession().getAttribute("userid");
	    String user_type = (String) request.getSession().getAttribute("user_type");
	    
	    List<RS_Project> featuredProjectList = projectService.readFeaturedProject();
	    List<RS_Space> featuredSpaceList = spaceService.readFeaturedSpace(); 
	    
	    if(userid == null){
    		String remoteHost = request.getRemoteHost();
    		//UserIdMap userIdMap = new UserIdMap();
    		//UserIdMap result = userService.getUserIdMap(remoteHost);
    		
//    		if(result == null){
//    			int nextId = userService.getNextUserIdMap();
//    			userIdMap.setExternalId(remoteHost);
//    			userIdMap.setInternalId(nextId);
//    			userService.createUserIdMap(userIdMap);
//    			User user = new User();
//    			user.setId(Integer.toString(userIdMap.getInternalId()));
//    			user.setInternalid((userIdMap.getInternalId()));
//    			user.setPassword("N/A");
//    			userService.createUser(user);
//    			
//    			result = userService.getUserIdMap(remoteHost);
//    		}
    		
    		//request.getSession().setAttribute("userid", Integer.toString(result.getInternalId()));
    		request.getSession().setAttribute("externalid", remoteHost);
    		
    		
	    }
	    String language = (String)request.getSession().getAttribute("lang");
		//LanguagePack lang = LanguageServiceImpl.getLangPack(language);
		
		
		ModelAndView model = new ModelAndView("index");
		//model.addObject("page_title", lang.getStringHazardReportingSystem());
		model.addObject("loginComplete", loginComplete);
		model.addObject("loginFail", loginFail);
		model.addObject("logoutComplete", logoutComplete);
		model.addObject("registerComplete", registerComplete);
		model.addObject("registerFail", registerFail);
		model.addObject("submittedUserId", submittedUserId);
		model.addObject("isUseController", "true");
		model.addObject("user_type", user_type);
		
		model.addObject("featuredProjectList", featuredProjectList);
		model.addObject("featuredSpaceList", featuredSpaceList);
		
		model.addObject("active", "index");
				
		return model;
    }
	
	@RequestMapping("/login.do")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		logger.debug("public ModelAndView login");
		logger.debug("===[S]======================");
		logger.debug("email : "+email);
		logger.debug("password : "+password);
		RS_User user = new RS_User();
		user.setEmail(email);
		user.setPassword(password);
		
		int result = userService.readUser(user);
		
		
		ModelAndView model = null;
		
		if(result == RS_User.STATUS_NOT_FOUNDED){
			model = new ModelAndView("join");
			System.out.println("User does not exist! or password is wrong.");
			model.addObject("loginFail", "true");
		}
		else if(result == RS_User.STATUS_FOUNDED){
			model = new ModelAndView("redirect:index.do");
			System.out.println("User is founded!");
						
			request.getSession().setAttribute("email", user.getEmail());
			request.getSession().setAttribute("islogin", "true");
			model.addObject("loginComplete", "true");
		}
		model.addObject("email", email);
		logger.debug("===[S]======================");
		return model;
    }
//	
	@RequestMapping("/register.do")
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		ModelAndView model = new ModelAndView("redirect:index.do");
		if( email == null || password == null){
			model.addObject("reason", "parameter_incomplete");
			model.addObject("registerFail", "true");
		}else{
			RS_User user = new RS_User();
			user.setEmail(email);
			user.setPassword(password);
			user.setType("1");	//Set as normal user
			int result = userService.createUser(user);
			if(result == RS_User.STATUS_ALREADY_REGISTEREDED){
				System.out.println("The ID requested to register is already exists!");
				model.addObject("reason", "already_exist");
				model.addObject("registerFail", "true");
				//model.addObject("submittedUserId", id);
			}else if(result == RS_User.STATUS_SUCCESS_REGISTER){
				
	//			UserIdMap userIdMap = new UserIdMap();
	//			userIdMap.setExternalId(id);
	//			userIdMap.setInternalId(nextId);
	//			userService.createUserIdMap(userIdMap);
	//			model.addObject("registerComplete", "true");
	//			model.addObject("submittedUserId", id);
				
				model.addObject("registerComplete", "true");
			}
		}
		return model;
    }
	
	@RequestMapping("/logout.do")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		
		ModelAndView model = new ModelAndView("index");
		model.addObject("logoutComplete", "true");
		return model;
    }
//	
//	@RequestMapping("/findPassword.do")
//    public ModelAndView findPassword(HttpServletRequest request, HttpServletResponse response) {
//		
//		request.getSession().removeAttribute("userid");
//		
//		ModelAndView model = new ModelAndView("index");
//		model.addObject("logoutComplete", "true");
//		return model;
//    }
//	
//	
//	@RequestMapping("/changePassword.do")
//    public ModelAndView changePassword(HttpServletRequest request, HttpServletResponse response) {
//		
//		request.getSession().removeAttribute("userid");
//		
//		ModelAndView model = new ModelAndView("index");
//		model.addObject("logoutComplete", "true");
//		return model;
//    }
//	
}
