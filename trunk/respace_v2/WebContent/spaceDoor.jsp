<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>RESPACE :: 공간에 가치를 더합니다 </title>
    
    <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
    
    <link rel="stylesheet" href="reset.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
        
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
</head>

<body>
    
    <!-- *********  Header  ********** -->
    
    <%@include file = "header.jsp"%>
     <!-- *********  Main part – headline ********** -->
    
        
        <div id="main_part_inner">
            <div id="main_part_inner_in">
        
            <h2>SPACE</h2>
            
            <div class="button_main">
                <a href="spaceShare.do" class="button_dark">SHARE!</a>
            </div>
            
            </div>
            
        </div>
        
   
      <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            <h3><font color="#ff5721" style="text-shadow:0px 1px #777"><b>당신의 공간에 가치를 더합니다!</b></h3></font>
            <p class="teamline">리스페이스에서는 임대인들에게 공간의 가치를 발견하고, 상승시킬 수 있는 가장 좋은 솔루션을 제공합니다!<br> 유휴공간 또는 임대공간의 단기임대를 통한 공간 홍보 및 마케팅 분석에 도움을 드립니다. </p>
             <br><div class="button_main">
                <a href="spaceShare.do" class="button_register">임대공간 등록하기</a>
            </div>
       		<br><br>
            <img src="img/share_0.jpg" width="960px"></div>
        
        <hr class="cleanit">
                        
           


    <!-- *********  Footer  ********** -->
    
   <%@include file = "footer.jsp"%>
         
<script>
// script for testimonial' tabs
$(function() {
    $("ul.controls").tabs("div.testimonials > div");
});
</script>

</body>
</html>
