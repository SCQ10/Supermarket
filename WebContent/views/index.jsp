<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>后台信息管理</title>
<link rel="shortcut icon" href="images/favicon.ico" /> 
    <script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var contextPath="${pageContext.request.contextPath }";
	var user = "<%= session.getAttribute("user")%>";
	if(user == "null"){
		alert("你尚未登录!!");
		window.location.href = contextPath+"/user-main";
		
	}
});
</script>
</head>
<noframes>
<body>
</body>
</noframes>

<frameset rows="59,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="${pageContext.request.contextPath }/views/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="213,*" frameborder="no" border="0" framespacing="0">	
    <frame src="${pageContext.request.contextPath }/views/left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="${pageContext.request.contextPath }/views/mainfra.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
    
  </frameset>
</frameset>

</html>