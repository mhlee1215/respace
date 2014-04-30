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
                <a href="projectOpen.do" class="button_dark">open!</a>
            </div>
            
            </div>
            
        </div>
        
   
      <!-- *********  Content  ********** -->
        
         <div id="content_inner">
            <h3><font color="#ff5721" style="text-shadow:0px 1px #777"><b>CHELSEA FOOTBALL CLUB KOREA 발대식</b></font></h3>
         
           <p class="teamline">@상암월드컵경기장, 마포구, Seoul</p>
           <div class="cara"></div>
           <hr class="cleanit">
           
    <!-- **** Details **** -->
    		<div class="project_portfolio">
              <img src="img/project_0.jpg">
               <div class="cara"></div>
               <div class="project_left">
                <h3>프로젝트 소개</h3>
                <p> <b>진행 일자</b>&nbsp;&nbsp;14-02-13 ~ 14-02-17<br><b>진행 장소</b>&nbsp;&nbsp;@상암월드컵경기장 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <font color="#ff5721"><a href="detailproject1.html">장소 보기</a></font>
                <br><b>참여 인원</b>&nbsp;&nbsp;150명<br>
                <b>주관 기업</b>&nbsp;&nbsp;CHELSEA FC<br>
                <a href="http://korea.chelseafc.com"><img src="img/business_1.png" width="25px" height="25px"></a>
               </p></div>
               
               <div class="project_right">
                <h3>상세 설명</h3>
                <p> &nbsp;&nbsp;본 행사는 런던을 방문한 이민주의 강력추천으로 서울에 드디어 한국지부를 발령한 첼시FC의 공식행사로서 초대 선수로는 프랭크 램파드, 존 테리, 게리 케이힐, 사무엘 에투, 에당 아자르, 다비드 루이즈 등 유수한 1군 선수들이 대거 참여해 뜨거운 호응을 일으키고 있다. 
                <br>&nbsp;&nbsp;첼시FC에서는 본 행사를 통해, 대한민국이 삼성의 나라인 만큼 첼시FC를 공식 후원 스포츠팀으로 지정하고 더 나아가 대한민국을 첼시FC의 속국으로 만들 것을 명쾌히 한 기념비적인 행사임을 밝혔다. 
                </p></div>
                
               
       
       
       
       

     </div>
 

   
   </div>

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
