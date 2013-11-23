package com.respace.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.respace.domain.Asset;

@Repository
public class AssetDaoImpl extends SqlMapClientDaoSupport implements AssetDao {

	@Resource(name = "sqlMapClient")
	protected void initDAO(SqlMapClient sqlMapClient) {
		this.setSqlMapClient(sqlMapClient);
	}

	@SuppressWarnings("unchecked")
	public List<Asset> readAssetList(Asset asset) {
		List<Asset> array = getSqlMapClientTemplate().queryForList("AssetSql.readAssetList", asset);
		return array;
	}

	public Asset readAsset(Asset asset) {
		Asset result = (Asset) getSqlMapClientTemplate().queryForObject("AssetSql.readAsset", asset);
		return result;
	}

	public void createAsset(Asset asset) {
		getSqlMapClientTemplate().insert("AssetSql.createAsset", asset);
	}

	public void deleteAsset(Asset asset) {
		getSqlMapClientTemplate().delete("AssetSql.deleteAsset", asset);

	}

	public void updateAsset(Asset asset) {
		getSqlMapClientTemplate().update("AssetSql.updateAsset", asset);
	}

}
