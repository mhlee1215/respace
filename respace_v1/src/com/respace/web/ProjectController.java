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

import com.respace.domain.RS_Project;
import com.respace.domain.RS_User;
import com.respace.service.ProjectServiceImpl;
import com.respace.service.UserService;




@Controller
public class ProjectController {

	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private final ProjectServiceImpl projectService = null;
		
	@RequestMapping("/add_test_projects.do")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {

		RS_Project project = null;
		
		for (int i = 0; i < 10 ; i++){
			project = new RS_Project();
			String label = "No."+Integer.toString(i);
			project.setTitle("TEST TITLE "+label);
			project.setId_contact(i);
			project.setDescription("TEST Desc.."+label);
			project.setHost_name("TEST HOST"+label);
			projectService.createProject(project);
		}
		
		ModelAndView model = new ModelAndView("index");
		return model;
    }
	
	
}
