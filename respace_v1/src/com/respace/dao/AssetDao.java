package com.respace.dao;

import java.util.List;

import com.respace.domain.RS_Asset;

public interface AssetDao {
	public RS_Asset readAsset(RS_Asset asset);
	public void createAsset(RS_Asset asset);
	public void deleteAsset(RS_Asset asset);
	public void updateAsset(RS_Asset asset);
	public List<RS_Asset> readAssetList(RS_Asset asset);
}
