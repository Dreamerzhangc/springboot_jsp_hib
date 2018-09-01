<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>登录</title>
<!-- 主题css -->
<link href="resources/theme/dist/<spring:theme code="bstheme"/>/bootstrap.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.container-fluid {
	/* width: 42%;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -280px;
	margin-top: -100px; */
	position: absolute;
	top: 0;
	bottom: 0;
	left:0;
	right: 0;
	width: 50%;
	height: 50%;
	margin: auto;
}
</style>
</head>
<body>
	<div class="container-fluid  ">
		<div class="row ">
			<div class="col-md-12 card   w-20">
				<form action="login" method="post">
				<!-- 没有错误信息不显示错误框 -->
				<c:if test="${msg!=null }">
				
					<div class="alert alert-primary  w-75 mx-auto text-center" role="alert">${msg}</div>
				</c:if>
					<div class="form-group row  w-75  mx-auto ">
						<label for="inputEmail3" class="col-sm-3 col-form-label">用户名</label>
						<div class="col-sm-9  w-75">
							<input type="text" class="form-control" id="inputEmail3" placeholder="用户名" name="name" value="${param.name}">
						</div>
					</div>
					<div class="form-group row w-75  mx-auto">
						<label for="inputPassword3" class="col-sm-3 col-form-label">密码</label>
						<div class="col-sm-9  w-75">
							<input type="password" class="form-control" id="inputPassword3" placeholder="密码" name="pwd">
						</div>
					</div>
					<div class="form-group row w-75  mx-auto">
						<label for="inputVcode" class="col-sm-3 col-form-label">验证码</label>
						<div class="col-sm-3  w-75">
							<input type="text" class="form-control" id="inputVcode"  name="vcode" maxlength="4">
							
						</div>
						<div class="col-sm-6">
						<img  src="vcode.png" title="点击下一张" class="vcodechange" style="max-width: 40%"> <a class="vcodechange" >看不清，换一张</a>
						</div>
						
					</div>
					<div class="form-group row  w-75  mx-auto">
						<div class="col-sm-10 offset-md-3">
							<button type="submit" class="btn btn-primary">登录</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- js文件放在最后面，提高网页响应速度 -->
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.slim.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $(function(){
             $(".col-sm-6 .vcodechange").click(function(){
                $(".col-sm-6 .vcodechange").attr("src","vcode.png?t="+Math.random());
                   
                 });

          });
    </script>
</body>
</html>