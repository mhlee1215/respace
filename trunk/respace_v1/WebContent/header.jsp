<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.bind.ServletRequestUtils"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	String email = (String)session.getAttribute("email");
	String islogin = (String)session.getAttribute("islogin");
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
            <li><a href="join.do" ${active=="join" ? "class=\"active\"" : ""}>Join</a></li>
            <li><a href="contact.do" ${active=="contact" ? "class=\"active\"" : ""}>Contact</a></li>            
         </ul>
        </div>
        
        </div>
    </div>