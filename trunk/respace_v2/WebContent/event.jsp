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
                <a href="eventShare.do" class="button_dark">SHARE!</a>
            </div>
            
            </div>
            
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            <h3><font color="#ff5721" style="text-shadow:0px 1px #777"><b>이벤트 관리</b></font></h3>
           
           <p class="teamline">이벤트 관리 화면임.</p>
           <div class="cara"></div>
           
            <ul id="work_filter">
                <li><a href="event.do" class="active">전체보기</a></li>
                <li><a href="eventDoor.do">종로/인사/삼청</a></li>
                <li><a href="eventDoor.do">홍대/합정/상수</a></li>
                <li><a href="eventDoor.do">강남/역삼/선릉</a></li>
                <li><a href="eventDoor.do">이태원/한남</a></li>
                <li><a href="eventDoor.do">왕십리/건대</a></li>
                <li><a href="eventDoor.do">기타</a></li>
            </ul>
            
            <!-- **** Items **** -->
            
           <c:forEach items="${eventList}" var="event" varStatus="list_status">
           <div class="fourths_portfolio">
                <h4>${event.name}<br>
                <span>@홍대<br>
                see detail</span>
                </h4>
                <a href="eventDetail.do?id=${event.id}"><img src="${event.thumbnail_url}" alt="item1" class="thumb_nail"></a>
            </div>
           </c:forEach> 
           
            
            <hr class="cleanit">
            
            <!-- ** Pagination ** -->
            
            <ul class="pagination">
                <c:forEach begin="${pager_start}" end="${pager_start+pager_size-1}" varStatus="loop">
			    <li><a href="event.do?query_page=${loop.index}" ${query_page==loop.index ? "class=\"active\"" : ""}>${loop.index}</a></li>
			</c:forEach>            
            </ul>
            
            <%if("true".equals(islogin)){ %>    
			<div style="float: right;">
                
                <a href="eventRegister.do?id=${event.id}" class="button_light">REGISTER</a>
            </div>
            <%} %>
            
            
        </div>
        
    
    
 <!-- *********  Footer  ********** -->
    
    <%@include file = "footer.jsp"%>

</body>
</html>
