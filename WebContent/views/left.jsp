<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/scripts/modernizr.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		var flag = $("#hasJurisdiction").val();
    		if(flag == "false") {
        		$("a[id^='shadow']").removeAttr('href').click(function(){
        			alert("没有权限");
        		});
    		}
    		
    	});
    
    </script>
<title>后台新闻发布</title>
</head>
<body>
<input id="hasJurisdiction" value="${sessionScope.user.hasJurisdiction }" type="hidden"/>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <ul class="sub-menu">
                    	<li><a href="${pageContext.request.contextPath }/accounts" target="mainFrame"><i class="icon-font">&#xe008;</i>账单管理</a></li> 
                   		<li><a href="${pageContext.request.contextPath }/suppliers" target="mainFrame" id="shadow1"><i class="icon-font">&#xe052;</i>供应商管理</a></li> 
                        <li><a href="${pageContext.request.contextPath }/users" target="mainFrame" id="shadow2"><i class="icon-font">&#xe004;</i>用户管理</a></li> 
                        <li><a href="${pageContext.request.contextPath }/goods" target="mainFrame" id="shadow3"><i class="icon-font">&#xe033;</i>商品分组查询</a></li> 
                        <li><a href="${pageContext.request.contextPath }/sups-div" target="mainFrame" id="shadow4"><i class="icon-font">&#xe033;</i>供应商分组查询</a></li>    
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>