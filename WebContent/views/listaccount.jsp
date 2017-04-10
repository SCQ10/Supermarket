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
	<form action="${pageContext.request.contextPath}/account-query" method="post">
		根据账单名查询:<input type="text" name="qName"/>
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
				<th>账单编号</th>
				<th>商品名称</th>
				<th>商品数量</th>
				<th>交易金额</th>
				<th>是否付款</th>
				<th>厂商</th>
				<th>商品描述</th>
				<th>账单时间</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${page.content }" var="account">
				<tr>
					<td>${account.id }</td>
					<td>${account.name }</td>
					<td>${account.nums }</td>
					<td>${account.amount }</td>
					<td>
						<c:if test="${account.ispayed }">
							是
						</c:if>
						<c:if test="${!account.ispayed }">
							否
						</c:if>
					</td>
					<td>${account.supplier.supplierName }</td>
					<td>${account.info }</td>
					<td><fmt:formatDate value="${account.date }" pattern="yyyy-MM-dd"/></td>
					<td><a href="${pageContext.request.contextPath }/accountpre?id=${account.id}">Edit</a></td>
					<td><a href="${pageContext.request.contextPath }/account/${account.id}" class="delete">Delete</a>
						<input type="hidden" value="${account.name }" /> 
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
	<a href="${pageContext.request.contextPath }/accountpreadd">添加新账单</a>
</body>
</html>