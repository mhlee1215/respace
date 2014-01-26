package com.respace.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.respace.domain.RS_Project;

@Repository
public class ProjectDaoImpl extends SqlMapClientDaoSupport {
	
	 @Resource(name="sqlMapClient")
	 protected void initDAO(SqlMapClient sqlMapClient) {        
		 this.setSqlMapClient(sqlMapClient);
	 } 
	
	@SuppressWarnings("unchecked")
	public List<RS_Project> readProjectList() {	
		List<RS_Project> array = getSqlMapClientTemplate().queryForList("ProjectSql.readProjectList");
		return array;
	}

	public RS_Project readProject(RS_Project Project) {
		RS_Project result = (RS_Project)getSqlMapClientTemplate().queryForObject("ProjectSql.readProject", Project);
		return result;
	}


	public RS_Project createProject(RS_Project Project) {
		RS_Project c_project = (RS_Project) getSqlMapClientTemplate().insert("ProjectSql.createProject", Project);
		return c_project;
	}


	public int deleteProject(RS_Project Project) {
		return getSqlMapClientTemplate().delete("ProjectSql.deleteProject", Project);		
	}

	public int updateProject(RS_Project Project) {
		return getSqlMapClientTemplate().update("ProjectSql.updateProject", Project);
	}

}
