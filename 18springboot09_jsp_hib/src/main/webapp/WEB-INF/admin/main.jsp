<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>主页</title>
<!-- 主题css -->
<link href="resources/theme/dist/<spring:theme code="bstheme"/>/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>
<body>
	<div class="container-fluid">
	<!-- 顶部导航栏 -->
		<div class="row ">
			<div class="col-md-12">
				<!-- 静态包含，顶部导航栏模块 -->
			<%@include file="common/nav.jsp" %>
			</div>
		</div>
		<!-- 中间轮播图 -->
		<div class="row " style="">
			<div class="col-md-12 card">
				<div class="carousel slide" id="carousel-455120">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-455120" class="active"></li>
						<li data-slide-to="1" data-target="#carousel-455120"></li>
						<li data-slide-to="2" data-target="#carousel-455120"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First" src="resources/image/290098.jpg" />

							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second" src="resources/image/296431.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third" src="resources/image/360wallpaper.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
								</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-455120" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-455120" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
				</div>
			</div>
		</div>
		<!-- 底部版权 -->
		<div class="row mx-auto card" style="height: 100px; background-color: e5e5e5; line-height: 100px">
		<!-- 静态包含，底部版权模块 -->
			<%@include file="common/copyright.jsp" %>
		</div>
	</div>
	<!-- js文件放在最后面，提高网页响应速度 -->
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/uri-util/dist/uri-util.min.js"></script>
	<!-- 主题切换的公共js -->
	<script type="text/javascript" src="resources/common/themejs/theme.js">
	</script>
	<script type="text/javascript">
	//主题选择
	//写在$(function{});不受位置影响
		$(function() {
			/* //修改主题的值，没有选择是默认主题
            $("#themeSel").val("<spring:theme code='bstheme'/>");
            //告诉服务器选择的主题
			$("#themeSel").change(function() {
	            window.location.href = "change?theme="+ this.options[this.selectedIndex].value;
			}); */
			   $("#themeSel").val("<spring:theme code='bstheme'/>");
			
		});
	</script>

</body>
</html>