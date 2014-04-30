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
        
            <h2>PROJECT</h2>
            
            <div class="button_main">
                <a href="projectOpen.do" class="button_dark">OPEN!</a>
            </div>
            
            </div>
            
        </div>
        
   
      <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            <h3><font color="#ff5721" style="text-shadow:0px 1px #777"><b>세상의 많은 즐거움이 당신을 기다립니다!</b></h3></font>
            <p class="teamline">리스페이스에서는 임차인들에게 프로젝트를 실현할 가장 좋은 기회를 제공합니다.<br> 팝업스토어, 플리마켓, 각종 소모임 등 여러분의 즐거움을 리스페이스에서 누려보세요! </p>
             <br><div class="button_main">
                <a href="projectOpen.do" class="button_register">프로젝트 등록하기</a>
            </div>
       		<br><br>
            <img src="img/event_0.jpg" width="960px"></div>
        
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
