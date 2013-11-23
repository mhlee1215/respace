<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@page import="org.springframework.web.bind.ServletRequestUtils"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
  <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/js/jquery.jqGrid-4.4.5/css/ui.jqgrid.css" />
  <script src="${pageContext.request.contextPath}/js/jquery.jqGrid-4.4.5/js/jquery.jqGrid.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.example.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor_4.1.2_standard/ckeditor.js"></script>
  <style>
    
  .l1_fieldset { border:2px solid rgb(40, 40, 40) }
  .l1_fieldset_legend {
	  padding: 0.2em 0.5em;
	  
	  color:rgb(30, 30, 30);
	  font-weight:bold;
	  font-size:150%;
	  text-align:left;
  }
  .l2_fieldset { border:1px solid rgb(60, 60, 60) }
  .l2_fieldset_legend {
	  padding: 0.2em 0.5em;
	  color:rgb(30, 30, 30);
	  font-weight:bold;
	  font-size:120%;
	  text-align:left;
  }
  
  .example{color:#666;}
  </style>
</head>
<script>
  $(function() {
	  $("#id_report_climb_attach_file_btn")
	  .button({icons: {secondary: "ui-icon-plus" } })
	  .click(function( event ) {
		  previousTab();
	   event.preventDefault();
	  });
   
   $("#id_report_climb_hazard_title").example('ex) Pax door impated airbridege while opening');
   $("#id_report_climb_hazard_time").timepicker();
  
   
   texi_out_load_hazard_item();
  });
  
 
  
  function texi_out_dateFormatter( cellvalue, options, rowObject )
  {
  	if(cellvalue != undefined && cellvalue != ''){
  		var year = cellvalue.substring(0, 4);
  		var month = cellvalue.substring(4, 6);
  		var date = cellvalue.substring(6, 8);
  		var hour = cellvalue.substring(8, 10);
  		var min = cellvalue.substring(10, 12);
  		var sec = cellvalue.substring(12, 14);
  		return year+'-'+month+'-'+date+' '+hour+':'+min+':'+sec;
  	}
  	return '-';
  }
  
  function texi_out_fnFormatter( cellvalue, options, rowObject )
  {
	var return_str = '<a id="id_climb_seq_'+cellvalue+'_delete_hazard" href="#">${lang.getStringDelete()}</a>';
	return_str += '<script>';
	return_str += '$("#id_climb_seq_'+cellvalue+'_delete_hazard").button({icons: {secondary: "ui-icon-trash" } }).click(function( event ) {'
	return_str += '    	event.preventDefault();';
	return_str += '});';
	return_str += '</scr'+'ipt>';
  	return return_str;
  }
  
  
  
  function texi_out_load_hazard_item(){
	  var gridimgpath = '${pageContext.request.contextPath}/jqueryui-1.10.2/themes/base/images';
	  jQuery("#id_climb_attached_file_list_table").jqGrid({
	  	url:'${pageContext.request.contextPath}/attachedFileListFN.do', 
	  	height: 120,
	  	width:720,
	  	//autowidth:true,
	  	datatype: "xml", 
	  		colNames:['${lang.getStringFileName()}','${lang.getStringSize()}', '${lang.getStringModified()}', ''],
	     	colModel:[
	     	 			{name:'file_name'		,index:'file_name'			,width:90	,align:"center"},
	     	    		{name:'file_size'		,index:'file_size'			,width:90	,align:"center"},
	     	    		{name:'modified_date'	,index:'modified_date'		,width:90	,align:"center"},
	     	    		{name:'fn'				,index:'fn'					,width:70	,align:"center", formatter:texi_out_fnFormatter	}		
	     	    	],
	     	shrinkToFit:true,
	     	//altRows:true,
	     	hoverrows:false,
	     	rownumbers: true, 
	     	rowNum:10, 
	     	loadtext:'&nbsp;Loading hazard items..',
	     	//loadtext:'<img src="/images/icons/icon_processing1.gif" width="16" height="16" title="Processing"></img>&nbsp;Loading task data..',
	     	rowList:[10,20,30], 
	     	//pager: jQuery('#pager1'), 
	     	pagerpos:'center',
	     	sortname: 'id', 
	     	sortorder: 'desc',
	     	imgpath: gridimgpath,
	     	//multiselect: true,
	     	viewrecords: true, 
	     	emptyrecords:'no task data',
	     	//caption: "Task List",
	     	toolbar: [false,"top"],
	     	loadError : function(xhr,st,err) { 
	  	   	jQuery("#rsperror").html("Type: "+st+"; Response: "+ xhr.status + " "+xhr.statusText+". Please reload running status table."); 
	  	},
	  	loadComplete: function(){ 
	  	    
	  		
	  			//jQuery("#id_climb_attached_file_list_table").setRowData(ids[i],{detail:detailHtml});				
	  			//$("#detail_button_"+recordArry['id']).click(function() {fncDetailTask(recordArry['id']);});
	 			//$("#step4_next_button_"+recordArry['id']).click(function() {fncShowCoord(recordArry['id']);});
	  			//$("#step4_stop_button_"+recordArry['id']).click(function() {stopTask(recordArry['id']); });
	  			
	  		
	  	}  
	  }).navGrid('#pager1',{edit:false,add:false,del:false}); 
  }
  

  </script>
<body>

<fieldset class="l1_fieldset">
<legend class="l1_fieldset_legend">Asset List</legend>

<table width="100%" cellpadding="0" cellspacing="0">
	<tbody>
		
		<tr>
			<td colspan="2">
			<fieldset class="l2_fieldset">
				<legend class="l2_fieldset_legend">Attachment</legend>
				<div style="width:100%;" align="right"><a id="id_report_climb_attach_file_btn" href="#">Attach file</a></div>
				<div style="height:6px;"></div>
				<table id="id_climb_attached_file_list_table" class="scroll" cellpadding="0" cellspacing="0"></table>
				<div id="id_climb_attached_file_list_pager" class="scroll"></div>
			</fieldset>
			</td>
		</tr>
	</tbody>
</table>


</fieldset>
</body>
</html>