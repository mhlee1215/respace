package com.respace.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.respace.dao.AssetDao;
import com.respace.domain.Asset;

@Service
public class AssetServiceImpl implements AssetService {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private AssetDao assetDao;
	@Override
	public Asset readAsset(Asset asset) {
		// TODO Auto-generated method stub
		return assetDao.readAsset(asset);
	}

	@Override
	public void createAsset(Asset asset) {
		// TODO Auto-generated method stub
		assetDao.createAsset(asset);
	}

	@Override
	public void deleteAsset(Asset asset) {
		// TODO Auto-generated method stub
		assetDao.deleteAsset(asset);
	}

	@Override
	public void updateAsset(Asset asset) {
		// TODO Auto-generated method stub
		assetDao.updateAsset(asset);
	}

	@Override
	public List<Asset> readAssetList(Asset asset) {
		// TODO Auto-generated method stub
		return assetDao.readAssetList(asset);
	}

}
