<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>Image Slider</title>

	<link rel="stylesheet" href="style.css" type="text/css">
    <script src="${pageContext.request.contextPath}/js/fileupload/jquery-1.8.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/fileupload/vendor/jquery.ui.widget.js"></script>
   <script src="${pageContext.request.contextPath}/js/fileupload/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/js/fileupload/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	
	

<!-- we code these -->
	
	<script>
	$(function () {
		
		init('${assetList}');
		
		//$('#progress').hide();
		$( "#dialog-modal" ).dialog({
			autoOpen: false,
		    height: 80,
		    width: 350,
		    modal: true
		});
		
	    $('#fileupload').fileupload({
	        dataType: 'json',
	        
	        //add: function (e, data) {  
	        //	alert('hihi');
	        //},
	        
	        done: function (e, data) {
	        	//alert('hi');
	        	
				
				var mydata = data.result;
				init(mydata);
			    //alert(mydata);
			    
	        	/*
	        	$("tr:has(td)").remove();
	            $.each(data.result, function (index, file) {
	            	
	            	
	                $("#uploaded-files tbody").append(
	                		$('<tr id="id_'+index+'_'+file.filename+'" />')
	                		.append($('<td class="td0"/>').text(index))
	                		.append($('<td class="td1"/>').html("<a href='${pageContext.request.contextPath}/"+file.filepath+"'>"+file.filename+"</a>"))
	                		.append($('<td class="td2"/>').text(file.filesize))
	                		.append($('<td class="td3"/>').text(file.filetype))
	                		.append($('<td class="td4"/>').html("<a href='javascript:removeFile(\"id_"+index+"_"+file.filename+"\");'>Delete</a>"))
	                		)//end $("#uploaded-files").append()
	            }); 
	            $( "#dialog-modal" ).dialog( "close" );
	            */
	            
			    $( "#dialog-modal" ).dialog( "close" );
	            
	        },
	        
	        progressall: function (e, data) {
	        	
	        	//$('#progress').fadeIn();
	        	$( "#dialog-modal" ).dialog( "open" );
	        	
		        var progress = parseInt(data.loaded / data.total * 100, 10);
		        
		        var loaded_kb = parseInt(data.loaded / (1024), 10);
		        var total_kb = parseInt(data.total / (1024), 10);
		        
		        $('#dialog-modal').dialog('option', 'title', 'Uploading.. '+loaded_kb+'Kb / '+total_kb+'Kb');
		        //$("#dialog-modal").attr('title', 'Now uploading..'+progress+'/100');
		        //console.log(data.loaded + '/'+ data.total+', progress:'+progress); 
		        $('#progress .bar').css(
		            'width',
		            progress + '%'
		        );
		        
		        //if(progress >= 100){
		        //	$( "#dialog-modal" ).dialog( "close" ); //$('#progress').fadeOut();
		        //}
	   		}//,
	   		
			//dropZone: $('#dropzone')
	    });
	    
	    
	    
	    
	    
	    var mydata = eval('${assetList}');

	    
	    //jQuery("#list4").jqGrid ('setLabel', 'filename', '', 'textalignleft');

	});
	
	function init(dd){
		dd = eval(dd);
		//var dd = eval('${assetList}');
		//alert('${assetList}');
		
		$("#s-thumbs li").remove();

		var item_idx = 0;
		$.each(dd, function (index, file) {
			if (item_idx == 0){
				changeMainView(file.url);
			}
			//$("#s-thumbs").append('<li id="thumbs_'+index+'">').append($('<a href="javascript:blank();"/>'))
			//.append('<label>').append('<img src="'+file.url+'"	style="width:60px; height:60px;" alt="" />');
			
			$("#s-thumbs").append(
				    $('<li/>', {'id': 'thumbs_'+index}).append(
				        $('<a/>', {'href': 'javascript:blank();'}).append(
				            $('<label/>').append(
				            	$('<img/>', {src: file.url, style:'width:60px; height:60px;', onclick:'changeMainView(this.src);'})
				            )
				        )
				    )
				);
			
			item_idx++;
        }); 
		
		//If no item exist..
		if(item_idx == 0){
			changeMainView('img/icons/default-no-image.png');
		}
		
		//LAST ADD BUTTON
		//$("#s-thumbs").append('<li>');//.children().append('<a href="javascript:blank();">').children()
		//.append('<label for="fileupload">').children().append('<img src="img/icons/add_button.png"	style="width:60px; height:60px;" alt="" />');
		
		<c:if test="${readOnly =='N' }">
		$("#s-thumbs").append(
			    $('<li/>').append(
			        $('<a/>', {'href': 'javascript:blank();'}).append(
			            $('<label/>', {'for':'fileupload'}).append(
			            	$('<img/>', {src: 'img/icons/add_button.png', style:'width:60px; height:60px;'})
			            )
			        )
			    )
			);
		</c:if>
	}

	function removeFile(tr_idx){
		//alert(tr_idx);
		//alert(tr_idx);
		//$("tr:has(td)#"+tr_idx).remove();
		//$("tr:has(td)#"+tr_idx).context.remove()
		//$("#uploaded-files").deleteRow(2);
		
		//printObject($("tr:has(td)#"+tr_idx).context.remove());
		//$('#uploaded-files #'+tr_idx).hide();
		
		if (confirm("Delete this file?")){
		
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/fileDelete.do",
				data: 'file_id='+tr_idx,
				success: function(msg){
					//var Result = msg;
					//alert(msg);
					//$(document.getElementById(tr_idx)).remove();
					
					
					
					var mydata = eval(msg);
				    
				    $.each(mydata, function (index, file) {
				    	file['no'] = index;
				    	jQuery("#list4").jqGrid('addRowData',index,file);
				    });
				}
			});
		}
	}

	function printObject(o) {
		  var out = '';
		  for (var p in o) {
		    out += p + ': ' + o[p] + '\n';
		  }
		  alert(out);
		}
	
	function changeMainView(src){
		$('#mainView').attr('src', src);
	}
	
	function blank(){
		
	}
	</script>
	
	
	
<style>

ul.s-thumbs img
{
	width:60px;
	height:60px;
}

</style>
</head>

<body>

<div style="width:100%;padding:0px">
	<table width="100%">
	<tr>
	<td align="right">
	
	
   <input id="fileupload" style="display:none" type="file" name="files[]" accept="image/*" data-url="fileUpload.do?reference_id=${id}&reference_category=${type}" multiple>
    
   </td>
   </tr>
	</table>
	
	<div id="dialog-modal" title="Now uploading.." style="overflow: hidden;">
	  	<div id="progress" class="progress" >
	    	<div class="bar" style="width: 0%;"></div>
		</div>
	</div>	 
	
</div>

				
						<div class="slider-wrapper">

							<ul class="s-slides">
								<li id="slide" class="slideleft"><img
									id="mainView" src="img/icons/default-no-image.png" alt="" /></li>
								
							</ul>
							<ul id="s-thumbs" class="s-thumbs">
								<li><a href="javascript:blank();"><img onclick="changeMainView(this.src);" src="img/space_1.jpg"
										alt="" /></a></li>
								<li><a href="javascript:blank();"><img onclick="changeMainView(this.src);" src="img/space_2.jpg"
										alt="" /></a></li>
								<li><a href="javascript:blank();"><img onclick="changeMainView(this.src);" src="img/space_3.jpg"
										alt="" /></a></li>
								<li><a href="javascript:blank();"><img onclick="changeMainView(this.src);" src="img/space_4.jpg"
										alt="" /></a></li>
								<li><a href="javascript:blank();"><img onclick="changeMainView(this.src);" src="img/space_3.jpg"
										alt="" /></a></li>
								<li><a href="javascript:blank();"><img onclick="changeMainView(this.src);" src="img/space_2.jpg"
										alt="" /></a></li>
								<li><a href="javascript:blank();">
								<label for="fileupload">
							        <img src="img/icons/add_button.png"	style="width:60px; height:60px;" alt="" />
							    </label>
								</a>		
								</li>
							</ul>
						</div>






</body> 
</html>


