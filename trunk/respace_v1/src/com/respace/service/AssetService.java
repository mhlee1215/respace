package com.respace.service;

import java.util.List;

import com.respace.domain.Asset;

public interface AssetService {
	public Asset readAsset(Asset asset);
	public void createAsset(Asset asset);
	public void deleteAsset(Asset asset);
	public void updateAsset(Asset asset);
	public List<Asset> readAssetList(Asset asset);
}
