<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/reg.css" type="text/css" />
<link href="${pageContext.request.contextPath }/css/admin_login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var contextPath = "${pageContext.request.contextPath }";
		$("#name").change(function() {
			var val = $(this).val();
			val = $.trim(val);
			var $this = $(this);
			if(val != ""){
				$this.nextAll("font").remove();
				var url = contextPath + "/user-validateName";
				var args = {"name" : val, "time" : new Date()};
				$.post(url, args, function(data) {
					if(data == "0") {
						$this.after("<font color = 'red'>管理员不存在</font>");
					}else if(data == "1") {
						$this.after("<font color = 'green'>管理员存在,可用</font>");
					}else{
						alert("服务器错误!");
					}
				});
			}else{
				alert("lastName不能为空");
				this.focus();
			}
		});
		$("#sub").click(function() {
			var name = $("#name").val();
			var password = $("#pwd").val();
			var jurisdiction = $("#hasJurisdiction").val();
			var hasJurisdiction;
			if(jurisdiction == "bmjl") {
				hasJurisdiction = true;
			}else {
				hasJurisdiction = false;
			}
			password = $.trim(password);
			$.ajax({
				type : "POST",
				url : contextPath + "/user-validatePassword",
				data : {"name" : name, "password" : password, "hasJurisdiction" : hasJurisdiction, "time" : new Date()},
				cache : false,
				dataType : 'json',
				success : function(data){
					if(data == "1") {
						window.location.href = contextPath + "/user-login";
					}else if(data == "0"){
						alert("密码错误或者身份信息不匹配!");
						window.location.reload();
					}
				}
			});
		});
	});
</script>
<title>Insert title here</title>

</head>
<body>
	<div class="topForm" id="topForm">
		<h3 style="font-size: 35px;color:red;padding-left:100px">
			欢迎登陆
			<h2 style="font-size: 16px;">
				<font color="#2380D5" style="padding-left:50px">管理员你好： &nbsp;&nbsp;&nbsp;&nbsp;</font>
			</h2>
		</h3>
		<p>
			<strong style="padding-left:50px;font-size:20px">&nbsp;&nbsp;&nbsp;&nbsp;欢迎登陆超市账单管理系统</strong>
		</p>
	</div>
	    <div class="adming_login_border">
        <div class="admin_input">
            <form method="post">
                <ul class="admin_items">
                    <li>
                        <label for="user">用户名：</label>
                        <input type="text" name="name" id="name" size="40" class="admin_input_style" />
                    </li>
                    <li>
                        <label for="pwd">密码：</label>
                        <input type="password" name="password" id="pwd" size="40" class="admin_input_style" />
                    </li>
                    <li>
                        <label for="hasJurisdiction">身份：</label>
                        <select id="hasJurisdiction">
							<option value="bmjl">部门经理</option>
							<option value="yg">普通员工</option>
						</select>
                    </li>
                    <li>
                        <input type="button" tabindex="3" value="提交" class="btn btn-primary" id="sub"/>
                    </li>
                    
                </ul>
            </form>
        </div>
    </div>
</body>
</html>