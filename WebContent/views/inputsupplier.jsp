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
		$("#supplierName").change(function() {
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
			var url = "${pageContext.request.contextPath }/supplier-validateName";
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
	<c:set value="${pageContext.request.contextPath }/supplier" var="url"></c:set>
	<c:if test="${supplier.id != null }">
		<c:set value="${pageContext.request.contextPath }/supplier/${supplier.id }" var="url"></c:set>
	</c:if>
	<form:form action="${url }" method="post" modelAttribute="supplier">
		<c:if test="${supplier.id != null }">
			<input type="hidden" id="_oldName" value="${supplier.supplierName }"/>
			<form:hidden path="id"/>
			<input type="hidden" name="_method" value="PUT">
		</c:if>
		<c:if test="${supplier.id != null }">
			供应商名称:<form:input path="supplierName" id="supplierName" readonly="true"/>
		</c:if>
		<c:if test="${supplier.id == null }">
			供应商名称:<form:input path="supplierName" id="supplierName" />
		</c:if>
		<br>
		供应商描述:<form:input path="info" id="info"/>
		<br>
		联系人:<form:input path="linkman" id="linkman"/>
		<br>
		联系人电话:<form:input path="linkPhone" id="linkPhone"/>
		<br>
		联系人地址:<form:input path="linkAddress" id="linkAddress"/>
		<br>
		<input type="submit" value="提交">
	</form:form>
</body>
</html>