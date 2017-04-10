<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/supplier-query" method="post">
		根据供应商名查询:<input type="text" name="qName"/>
		<input type="submit" value="查询"/>
	</form>
	<form action="" method="post" id="_form">
		<input type="hidden" id="_method" name="_method"/>
	</form>
	<c:if test="${suppliers==null}">
		无该用户
	</c:if>
	<c:if test="${suppliers!=null}">
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>供应商编号</th>
			<th>供应商名称</th>
			<th>供应商描述</th>
			<th>联系人</th>
			<th>联系人电话</th>
			<th>联系人地址</th>
		</tr>
		<c:forEach items="${sessionScope.suppliers }" var="supplier">
			<tr>
				<td>${supplier.id }</td>
				<td>${supplier.supplierName }</td>
				<td>${supplier.info }</td>
				<td>${supplier.linkman }</td>
				<td>${supplier.linkPhone }</td>
				<td>${supplier.linkAddress }</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
</body>
</html>