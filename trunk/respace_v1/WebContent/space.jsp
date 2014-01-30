<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>RESPACE :: 공간에 가치를 더합니다 </title>
    
    <link rel="stylesheet" href="reset.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
       
         <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
        
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

</head>

<body>
    
    <!-- *********  Header  ********** -->
    
    <%@include file = "header.jsp"%>
    
    <!-- *********  Main part – headline ********** -->
    
        
        <div id="main_part_inner">
            <div id="main_part_inner_in">
        
            <h2>SPACE</h2>
            
            <div class="button_main">
                <a href="download.html" class="button_dark">SHARE!</a>
            </div>
            
            </div>
            
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            <h3>공간 찾기</h3>
           
           <p class="teamline">리스페이스에서는 여러분들을 위한 멋진 공간들을 소개합니다.</p>
           <div class="cara"></div>
           
            <ul id="work_filter">
                <li><a href="space.do" class="active">전체보기</a></li>
                <li><a href="#">압구정/청담/신사</a></li>
                <li><a href="#">홍대/합정/상수</a></li>
                <li><a href="#">이태원/한남</a></li>
                <li><a href="#">기타등등/젬베등등</a></li>
            </ul>
            
            <!-- **** Items **** -->
           <c:forEach items="${spaceList}" var="space" varStatus="list_status">
           <div class="fourths_portfolio">
                <h4>${space.name}<br>
                <span>see detail</span>
                </h4>
                <a href="#"><img src="${space.thumbnail_url}" alt="item1"></a>
            </div>
           </c:forEach> 
           
            
            <hr class="cleanit">
            
            <!-- ** Pagination ** -->
            
            <ul class="pagination">
                <c:forEach begin="${pager_start}" end="${pager_start+pager_size-1}" varStatus="loop">
			    <li><a href="space.do?query_page=${loop.index}" ${query_page==loop.index ? "class=\"active\"" : ""}>${loop.index}</a></li>
			</c:forEach>            
            </ul>
            
            
            
        </div>
        
    
    
 <!-- *********  Footer  ********** -->
    
    <%@include file = "footer.jsp"%>

</body>
</html>
