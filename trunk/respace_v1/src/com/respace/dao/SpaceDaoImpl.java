package com.respace.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.respace.domain.RS_Space;

@Repository
public class SpaceDaoImpl extends SqlMapClientDaoSupport {
	
	 @Resource(name="sqlMapClient")
	 protected void initDAO(SqlMapClient sqlMapClient) {        
		 this.setSqlMapClient(sqlMapClient);
	 } 
	
	@SuppressWarnings("unchecked")
	public List<RS_Space> readSpaceList() {	
		List<RS_Space> array = getSqlMapClientTemplate().queryForList("SpaceSql.readSpaceList");
		return array;
	}

	public RS_Space readSpace(RS_Space Space) {
		RS_Space result = (RS_Space)getSqlMapClientTemplate().queryForObject("SpaceSql.readSpace", Space);
		return result;
	}


	public RS_Space createSpace(RS_Space Space) {
		RS_Space c_space = (RS_Space) getSqlMapClientTemplate().insert("SpaceSql.createSpace", Space);
		return c_space;
	}


	public int deleteSpace(RS_Space Space) {
		return getSqlMapClientTemplate().delete("SpaceSql.deleteSpace", Space);		
	}

	public int updateSpace(RS_Space Space) {
		return getSqlMapClientTemplate().update("SpaceSql.updateSpace", Space);
	}

}
