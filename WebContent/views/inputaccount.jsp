<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#name").change(function() {
			var val = $(this).val();
			val = $.trim(val);
			$(this).val(val);
			//若修改的name和之前的name一致,则不发送ajax请求,直接alert
			var oldName = $("#_oldName").val();
			oldName = $.trim(oldName);
			if(oldName != null && oldName != "" && oldName == val){
				alert("name可用");
				return;
			}
			var url = "${pageContext.request.contextPath }/account-validateName";
			var args = {"name" : val, "date" : new Date()};
			$.post(url, args, function(data){
				if(data == "0") {
					alert("name可用!");
				}else if(data == "1") {
					alert("name不可用!");
				}else {
					alert("网络错误!");
				}
			});
		});
	});

</script>
</head>
<body>
	<c:set value="${account.id }" var="accountId"></c:set>
	<c:set value="${pageContext.request.contextPath }/account" var="url"></c:set>
	<c:if test="${account.id != null }">
		<c:set value="${pageContext.request.contextPath }/account/accountId" var="url"></c:set>
	</c:if>
	<form:form action="${url }" method="post" modelAttribute="account">
		<c:if test="${account.id != null }">
			<input type="hidden" id="_oldName" value="${account.name }"/>
			<form:hidden path="id" id="accountId"/>
			<input type="hidden" name="_method" value="PUT">
		</c:if>
		<c:if test="${account.id != null }">
			商品名称:<form:input path="name" id="name" readonly="true"/>
		</c:if>
		<c:if test="${account.id == null }">
			商品名称:<form:input path="name" id="name" />
		</c:if>
		<br>
		商品数量:<form:input path="nums" id="nums"/>
		<br>
		交易金额:<form:input path="amount" id="amount"/>
		<br>
		是否付款:<form:input path="ispayed" id="ispayed"/>
		<br>
		商品描述:<form:input path="info" id="info"/>
		<br>
		账单时间:<form:input path="date" id="date"/>
		<br>
		厂商:<form:select path="supplier.id" items="${suppliers }" itemLabel="supplierName" itemValue="id"></form:select>
		<br>
		<input type="submit" value="提交">
	</form:form>
</body>
</html>