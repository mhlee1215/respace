package com.respace.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.respace.dao.SpaceDaoImpl;
import com.respace.domain.RS_Space;



@Service
public class SpaceServiceImpl{

	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SpaceDaoImpl		spaceDao;
	
	boolean isEncrypt = true;

	public List<RS_Space> readSpaceList() {
		return spaceDao.readSpaceList();
	}

	public RS_Space createSpace(RS_Space space) throws Exception {
		return spaceDao.createSpace(space);
		
	}

	public RS_Space readSpace(RS_Space space) throws Exception {
		return spaceDao.readSpace(space);
	}
	
	public int updateSpace(RS_Space space) {
		return spaceDao.updateSpace(space);
	}

	public int deleteSpace(int id) {
		RS_Space space = new RS_Space();
		space.setId(id);
		return spaceDao.deleteSpace(space);
	}




	

}
