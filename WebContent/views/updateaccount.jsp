<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/modernizr.min.js"></script>
<title>后台新闻发布</title>
</head>
<body>

<div class="container clearfix">
    <div class="main-wrap">
    	<div class="result-wrap">
            <div class="result-content">
                <form action="${pageContext.request.contextPath }/account-update" method="post">
                    <table class="insert-tab" width="100%">
                   			<tr>
                                <th>商品编号</th>
                                <td>
                                    <input class="common-text required" id="id" name="id" size="50" value="${sessionScope.account.id }" type="hidden">
                                </td>
                            </tr>
                       		 <tr>
                                <th><i class="require-red"></i>商品名称：</th>
                                <td>
                                    <input class="common-text" name="name" size="50" value="${sessionScope.account.name }" type="text" readonly="readonly">
	                            </tr>
                            <tr>
                                <th>商品数量：</th>
                                <td><input class="common-text required" id="nums" name="nums" size="50" value="${sessionScope.account.nums }" type="text"></td>
                            </tr>
                            <tr>
                                <th>交易金额：</th>
                                <td><input class="common-text" name="amount" size="50" value="${sessionScope.account.amount }" type="text"></td>
                            </tr>
                            <tr>
                                <th>是否付款:</th>
                                 <td>
                                    <select name="ispayed" id="ispayed" class="required">
	                                    <option value="0">未付</option>
	                                    <option value="1">已付</option>
                               		</select>
								</td>
                            </tr>
                            <tr>
                                <th>商品描述:</th>
                                <td><input class="common-text" name="info" size="50" value="${sessionScope.account.info }" type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>厂商：</th>
                                <td>
                                    <select name="flag" id="flag" class="required">
                                    <c:forEach var="bean" items="${suppliers }" >
                                    	<option value=${bean.id }>${bean.supplierName }</option>
                                   	</c:forEach>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                </td>
                            </tr>
                       </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>