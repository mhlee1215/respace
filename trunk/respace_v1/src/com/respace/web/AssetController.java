package com.respace.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.respace.domain.Asset;
import com.respace.service.AssetService;

@Controller
public class AssetController {
	
	@Autowired
	private final AssetService assetService = null;
	
	@RequestMapping("/attachedFileListFN.do")
    public ModelAndView attachedFileListFN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String language = (String)request.getSession().getAttribute("lang");
		ModelAndView model = new ModelAndView("jsp/attachedFileListFN");
		return model;
	}
	
	@RequestMapping("/fileUploadForm.do")
    public ModelAndView fileUploadForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String report_no = ServletRequestUtils.getStringParameter(request, "report_no", "");
		String report_item_type = ServletRequestUtils.getStringParameter(request, "report_item_type", "");
		String isReadOnly = ServletRequestUtils.getStringParameter(request, "isReadOnly", "N");
		
		Asset ai = new Asset();
		ai.setId(0);
		List<Asset> itemList = assetService.readAssetList(ai);
		
		ModelAndView model = new ModelAndView("jsp/file_upload_form");
		model.addObject("report_no", report_no);
		model.addObject("isReadOnly", isReadOnly);
		model.addObject("report_item_type", report_item_type);
		model.addObject("attachedItemList", itemList);
		return model;
	}
}
