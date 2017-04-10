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
	<c:if test="${page==null ||page.numberOfElements==0}">
		没有记录
	</c:if>
	<c:if test="${page!=null ||page.numberOfElements>0}">
		<table border="1" cellpadding="10" cellspacing="0">
			<tr>
				<th>商品名称</th>
				<th>商品数量</th>
				<th>交易金额</th>
				<th>厂商</th>
			</tr>
			<c:forEach items="${page.content }" var="goods">
				<tr>
					<td>${goods.name }</td>
					<td>${goods.nums }</td>
					<td>${goods.amount }</td>
					<td>${goods.supplier.supplierName }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8">
					共 ${page.totalElements }条记录
					共 ${page.totalPages }页
					当前 ${page.number+1 }页
					<a href="?pageNo=${page.number+1-1 }">上一页</a>
					<a href="?pageNo=${page.number+1+1 }">下一页</a> 
				</td>
			</tr>
		</table>
	</c:if>
</body>
</html>