package com.respace.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.respace.dao.ProjectDaoImpl;
import com.respace.domain.RS_Project;



@Service
public class ProjectServiceImpl{

	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private ProjectDaoImpl		projectDao;
	
	boolean isEncrypt = true;

	public List<RS_Project> readProjectList() {
		return projectDao.readProjectList();
	}

	public RS_Project createProject(RS_Project project) throws Exception {
		return projectDao.createProject(project);
		
	}

	public RS_Project readProject(RS_Project project) throws Exception {
		return projectDao.readProject(project);
	}
	
	public int updateProject(RS_Project project) {
		return projectDao.updateProject(project);
	}

	public int deleteProject(int id) {
		RS_Project project = new RS_Project();
		project.setId(id);
		return projectDao.deleteProject(project);
	}




	

}
