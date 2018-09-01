<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding-left: 0px; padding-bottom: 0px; padding-top: 0px">

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		<span class="navbar-toggler-icon"></span>
	</button>
	<!-- logo图标 -->
	<div>
		<!-- 使用透明图片，和主题适应 -->
		<a class="navbar-brand" href="#"> <img src="resources/image/nav.jpg" style="height: 60px; width: 100px" />
		</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="#">Link <span class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">图书管理系统</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="tobooklist">查看书籍</a>
					<a class="dropdown-item" href="tobookAdd">添加书籍</a>
				    <a class="dropdown-item" href="tobooklist">修改书籍</a> 
					<a class="dropdown-item" href="tobooklist">删除书籍</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="tomain">返回主界面</a>
				</div></li>
		</ul>
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="text" />
			<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
		</form>
		<ul class="navbar-nav ml-md-auto">
			<!-- 主题选择 select -->
			<li class="nav-item active"><a class="nav-link" href="#"> 主题:<select id="themeSel">
						<option>sketchy</option>
						<option>cerulean</option>
						<option>darkly</option>
						<option>minty</option>
						<option>litera</option>
						<option>pulse</option>
						<option>cosmo</option>
						<option>flatly</option>
						<option>materia</option>
						<option>solar</option>
						<option>united</option>
						<option>yeti</option>

				</select>
			</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"> 欢迎
					${sessionScope.success.name}登录 </a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="exit">退出</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Separated link</a>
				</div></li>
		</ul>
	</div>
</nav>