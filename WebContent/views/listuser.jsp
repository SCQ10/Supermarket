<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".delete").click(function(){
			var label=$(this).next(":hidden").val();
			var flag=confirm("确定要删除"+label+"的信息吗");
			if(flag){
				var url=$(this).attr("href");
				$("#_form").attr("action",url)
				$("#_method").val("DELETE");
				$("#_form").submit();
			}
			return false;
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/user-query" method="post">
		根据用户名查询:<input type="text" name="qName"/>
		<input type="submit" value="查询"/>
	</form>
	<form action="" method="post" id="_form">
		<input type="hidden" id="_method" name="_method"/>
	</form>
	<c:if test="${page==null ||page.numberOfElements==0}">
		没有记录
	</c:if>
	<c:if test="${page!=null ||page.numberOfElements>0}">
		<table border="1" cellpadding="10" cellspacing="0">
			<tr>
				<th>编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>电话</th>
				<th>地址</th>
				<th>权限</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${page.content }" var="user">
				<tr>
					<td>${user.id }</td>
					<td>${user.name }</td>
					<td>${user.gender }</td>
					<td>${user.age }</td>
					<td>${user.phone }</td>
					<td>${user.address }</td>
					<td><c:if test="${user.hasJurisdiction }">
							项目经理
						</c:if>
						<c:if test="${!user.hasJurisdiction }">
							普通员工
						</c:if>
						</td>
					<td><a href="${pageContext.request.contextPath }/user/${user.id}">Edit</a></td>
					<td><a href="${pageContext.request.contextPath }/user/${user.id}" class="delete">Delete</a>
						<input type="hidden" value="${user.name }" /> 
					</td>
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
	<a href="${pageContext.request.contextPath }/user">添加新用户</a>
</body>
</html>