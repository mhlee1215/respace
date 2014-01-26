package com.respace.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.respace.dao.AssetDao;
import com.respace.domain.RS_Asset;

@Service
public class AssetServiceImpl implements AssetService {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private AssetDao assetDao;
	@Override
	public RS_Asset readAsset(RS_Asset asset) {
		// TODO Auto-generated method stub
		return assetDao.readAsset(asset);
	}

	@Override
	public void createAsset(RS_Asset asset) {
		// TODO Auto-generated method stub
		assetDao.createAsset(asset);
	}

	@Override
	public void deleteAsset(RS_Asset asset) {
		// TODO Auto-generated method stub
		assetDao.deleteAsset(asset);
	}

	@Override
	public void updateAsset(RS_Asset asset) {
		// TODO Auto-generated method stub
		assetDao.updateAsset(asset);
	}

	@Override
	public List<RS_Asset> readAssetList(RS_Asset asset) {
		// TODO Auto-generated method stub
		return assetDao.readAssetList(asset);
	}

}
