<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>书籍修改</title>
<!-- 主题css -->
<link href="resources/theme/dist/<spring:theme code="bstheme"/>/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="resources/bower_components/bootstrapdatepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" /> -->
<link href="resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
/* 修改图片上传中边框内容 */
  .custom-file-label:after{
             content: "请选择文件"
  } 
</style>
</head>
<body>
              <!-- container-fluid -->
	<div class="container">
		<div class="row "><!--card  添加面板，进行模块化 -->
			<div class="col-md-12 " style="padding: 0px">
				<!-- 静态包含，顶部导航栏模块 -->
				<%@include file="common/nav.jsp"%>
				<form:form action="bookEdit" method="post" enctype="multipart/form-data" modelAttribute="book" cssClass="container card " style="margin-bottom: 0px">
					 <!--  <div class="alert alert-primary container  mx-auto  text-center card" role="alert">
						<p>
							<marquee>书籍信息的添加</marquee>滚动字体
						</p>

					</div>  --> 
					<!-- 隐藏接收的id，不然没有id，更新不了 -->
			
						<form:hidden path="id"/>
					<!-- -name 书名-->
					<div class="form-group row  w-75  mx-auto ">
						<form:label path="name" cssClass="col-sm-2 col-form-label">
							<!-- 国际化key -->
							<spring:message code="book.name"></spring:message>
						</form:label>
						<div class="col-sm-10  w-75">
							<form:input path="name" cssClass="form-control" />
							<!-- errors错误信息默认是显示在span中，修改element显示在div中 -->
							<form:errors path="name" element="div" cssClass="invalid-feedback"></form:errors>
						</div>
					
					</div>
					<!-- - descri -->
					<div class="form-group row  w-75  mx-auto ">
						<form:label path="descri" cssClass="col-sm-2 col-form-label">
						<!--描述   国际化key -->
							<spring:message code="book.descri"></spring:message>
						
						</form:label>
						<div class="col-sm-10  w-75">
							<form:textarea path="descri" cssClass="form-control" />
							<form:errors path="descri" element="div" cssClass="invalid-feedback"></form:errors>
						</div>
						
					</div>
					<!-- - tid 类型-->
					<div class="form-group row  w-75  mx-auto">
						<form:label path="tid" cssClass="col-sm-2 col-form-label">
					<!--类型  国际化key -->
							<spring:message code="book.tid"></spring:message>
						
						</form:label>
						<div class="col-sm-10  w-75">
							<form:select path="tid" items="${types}" itemLabel="name" itemValue="id" title="请选择书籍的类型" cssClass="form-control custom-select" ></form:select>
							<form:errors path="tid" element="div" cssClass="invalid-feedback"></form:errors>
						</div>
					</div>
					<!-- photo 图片-->
					<!-- 添加隐藏字段photo，解决图片没有添加新图片，丢失问题 -->
					<form:hidden path="photo"/>
					<div class="form-group row  w-75  mx-auto">
						<label title="上传书籍的照片" class="col-sm-2 col-form-label">
						<!--描述   国际化key -->
							<spring:message code="book.photofile"></spring:message>
						</label>
						<div class="col-sm-8  w-75 custom-file">
							<input type="file" name="photofile" title="请选择图片" class="custom-file-input">
							 <label class="custom-file-label" for="customFile">选择图片</label>
						</div>
						<div class="col-sm-2  w-75 ">
							 <img alt="" src="/upload/${book.photo }" style="max-width: 80px ;max-height: 80px">
						</div>
						
					</div>
					<!-- - pubdate 日期-->
					<div class="form-group row  w-75  mx-auto">
						<form:label path="pubdate" cssClass="col-sm-2 col-form-label">
                           <!--描述   国际化key -->
							<spring:message code="book.pubdate"></spring:message>
						</form:label>
						<div class="col-sm-10  w-75">
							<form:input path="pubdate" cssClass="form-control" />
							<form:errors path="pubdate" element="div" cssClass="invalid-feedback"></form:errors>
						</div>
						
					</div>
					<!--  price -->
					<div class="form-group row  w-75  mx-auto">
						<form:label path="price" cssClass="col-sm-2 col-form-label">
							<!--label   国际化key -->
							<spring:message code="book.price"></spring:message>
						</form:label>
						<div class="col-sm-10  w-75">
							<form:input path="price" cssClass="form-control" />
							<form:errors path="price" element="div" cssClass="invalid-feedback"></form:errors>
						</div>
						
					</div>
					<!--  author-->
					<div class="form-group row  w-75  mx-auto">
						<form:label path="author" cssClass="col-sm-2 col-form-label">
						<!--label   国际化key -->
							<spring:message code="book.author"></spring:message>
						</form:label>
						<div class="col-sm-10 w-75">
							<form:input path="author" cssClass="form-control" />
							<form:errors path="author" element="div" cssClass="invalid-feedback"></form:errors>
						</div>
						
					</div>
					<!-- 验证码 -->
					<div class="form-group row w-75  mx-auto">
							<form:label path="author" cssClass="col-sm-2 col-form-label">验证码</form:label>
						<div class="col-sm-3  w-75">
							<form:input path="vcode" cssClass="form-control" maxlength="4" autocomplete="off"/><!-- 自动填充提示关闭 -->
							<form:errors path="vcode" element="div" cssClass="invalid-feedback"></form:errors>
						</div>
						<div class="col-sm-6">
						<img  src="vcode.png" title="点击下一张" class="vcodechange" style="max-width: 40%"> <a class="vcodechange" >看不清，换一张</a>
						</div>
						
					</div>
					<div class="form-group row  w-75  mx-auto">
						<div class="col-sm-10 offset-md-2"><!-- offset-md-2向右偏移量 -->
							<button type="submit" class="btn btn-primary">修改</button>
						</div>
					</div>
				</form:form>
				<!-- 底部版权，模块化 ,添加card --><!-- -文字居中，line-hight行高等于height -->
				<div class="row card mx-auto" style="height: 90px; background-color: e5e5e5; line-height: 90px ">
					<!-- 静态包含，底部版权模块 -->
					<%@include file="common/copyright.jsp"%>
				</div>

			</div>

		</div>
	</div>
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.slim.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/uri-util/dist/uri-util.min.js"></script>
	<!-- 主题切换的公共js -->
	<script type="text/javascript" src="resources/common/themejs/theme.js"></script>
	 
	<script type="text/javascript">
	<!-- 获取错误信息 -->
	 <spring:bind path="book">
	 <spring:hasBindErrors name="book">
	       <c:forEach items="${requestScope.errors.fieldErrors}" var="error">/*获取错误信息集合*/
	       /* 给错误信息字段添加class的is-invalid，验证不通过显示错误信息
	          class是is-valid验证通过显示
	        */
	          $("[name=${error.field}]").addClass("is-invalid"); 
	       
	      </c:forEach>
	</spring:hasBindErrors>
	</spring:bind> 

	</script>
		<script type="text/javascript">
		$(function() {
			//修改主题的值，没有选择是默认主题
			$("#themeSel").val("<spring:theme code='bstheme'/>");
			$("#pubdate").datepicker({
				format : 'yyyy-mm-dd',//日期格式
				language : 'zh-CN',//中午
				autoclose : true
			//自动关闭

			});
		});
		  $(function(){
	             $(".col-sm-6 .vcodechange").click(function(){
	                $(".col-sm-6 img.vcodechange").attr("src","vcode.png?t="+Math.random());
	                   
	                 });

	          });
	</script>

</body>
</html>