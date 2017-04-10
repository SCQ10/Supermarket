<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>供应商编号</th>
			<th>供应商名称</th>
			<th>总交易金额</th>
			<th>商品种类</th>
			<th>总商品数量</th>
		</tr>
		<c:forEach items="${sessionScope.supAccs }" var="supAccs">
			<tr>
				<td>${supAccs.id }</td>
				<td>${supAccs.supName }</td>
				<td>${supAccs.accAll }</td>
				<td>${supAccs.types }</td>
				<td>${supAccs.numAll }</td>
			</tr>
		</c:forEach>
		<%-- <tr>
			<td colspan="8">
				共 ${page.totalElements }条记录
				共 ${page.totalPages }页
				当前 ${page.number+1 }页
				<a href="?pageNo=${page.number+1-1 }">上一页</a>
				<a href="?pageNo=${page.number+1+1 }">下一页</a> 
			</td>
		</tr> --%>
	</table>
</body>
</html>