<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.bind.ServletRequestUtils"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

 
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.38/jquery.form-validator.min.js"></script>
<!--
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js" />
<script type="text/javascript" src="//code.jquery.com/ui/1.10.4/jquery-ui.js" />



 -->

<%
	String email = (String)session.getAttribute("email");
	String islogin = (String)session.getAttribute("islogin");
	String isAdmin = (String)session.getAttribute("isAdmin");
%>
    <div id="header">
        <div id="header_in">
        
        <h1><a href="index.do"><b>RE</b>SPACE
        <%if("true".equals(islogin)){ %>
        (<%=email%>)
        <%} %>
        </a></h1>
        
        <div id="menu">
         <ul>
            <li><a href="index.do" ${active=="index" ? "class=\"active\"" : ""}>Home</a></li>
            <li><a href="space.do" ${active=="space" ? "class=\"active\"" : ""}>SPACE</a></li>
            <li><a href="project.do" ${active=="project" ? "class=\"active\"" : ""}>PROJECT</a></li>
            <li><a href="contact.do" ${active=="contact" ? "class=\"active\"" : ""}>Contact</a></li>   
            <%if("true".equals(islogin)){ %>         
            <li><a href="logout.do" ${active=="join" ? "class=\"active\"" : ""}>Logout</a></li>
            <%}else{ %>
            <li><a href="join.do" ${active=="join" ? "class=\"active\"" : ""}>Join</a></li>
            <%} %>
         </ul>
        </div>
        
        </div>
    </div>
    
    <div id="articleUpdateDialog" title="Article Update" style="display:none">
	<p id="signinValidateTips">All form fields are required.</p>

	<form name="signinForm" action="/login.do"  method="post">
	<fieldset>
		<label>Title</label>
		<input style="width:95%;margin-bottom:5px;" type="text" name="id" id="signinId" value="" class="text ui-widget-content ui-corner-all" />
		<br>
		<label for="password">Content</label>
		<input style="width:95%;margin-bottom:5px;" type="password" name="password" id="signinPassword" value="" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
</div>