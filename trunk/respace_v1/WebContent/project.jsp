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
        
            <h2>PROJECT</h2>
            
            <div class="button_main">
                <a href="download.html" class="button_dark">OPEN!</a>
            </div>
            
            </div>
            
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            <h3><font color="#ff5721" style="text-shadow:0px 1px #777"><b>프로젝트 열기</b></font></h3>
           
           <p class="teamline">리스페이스에서는 여러분의 멋진 프로젝트를 실현합니다.</p>
           <div class="cara"></div>
           
            <ul id="work_filter">
                <li><a href="project.do" class="active">전체보기</a></li>
                <c:forEach items="${projectCodeList}" var="projectCode" varStatus="list_status">
                	<li><a href="project.do?code_category=${projectCode.code}">${projectCode.name}</a></li>
                </c:forEach>
            </ul>
            
            <!-- **** Items **** -->
            
           <c:forEach items="${projectList}" var="project" varStatus="list_status">
           <div class="fourths_portfolio">
                <h4>${project.title}<br>
                <span>see detail</span>
                </h4>
                <a href="projectDetail.do?id=${project.id}"><img src="${project.thumbnail_url}" alt="item1"></a>
            </div>
           </c:forEach> 
            
            <hr class="cleanit">
            
            <!-- ** Pagination ** -->
            <ul class="pagination">
			<c:forEach begin="${pager_start}" end="${pager_start+pager_size-1}" varStatus="loop">
			    <li><a href="project.do?query_page=${loop.index}" ${query_page==loop.index ? "class=\"active\"" : ""}>${loop.index}</a></li>
			</c:forEach>           
            </ul>
            
            
            
        </div>
        
    
    
 <!-- *********  Footer  ********** -->
    
    <%@include file = "footer.jsp"%>

</body>
</html>
