<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>书籍列表</title>
<!-- 主题css -->
<link href="resources/theme/dist/<spring:theme code="bstheme"/>/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- icon css -->
<link href="resources/icon/iconfonts.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function useDefaultImg(event) {
		$(event.target).attr("src", "resources/image/default.gif");
	}
</script>
<style type="text/css">
/ /* /当鼠标悬停在图片时候放大  */
#myimg {
	cursor: pointer;
	transition: all 0.6s;
}

#myimg:hover {
	transform: scale(2.3);
}
</style>

</head>
<body>
	<div class="container ">
		<!-- 顶部导航栏 -->
		<div class="row ">
			<div class="col-md-12">
				<!-- 静态包含，顶部导航栏模块 -->
				<%@include file="common/nav.jsp"%>
			</div>
		</div>
		<!-- 数据显示界面 -->
		<div class="card-header text-center card">
			<form action="tobooklist" id="booklistSearchForm">
				<input name="pageNo" type="hidden" value="1">
				<div class="form-row align-items-center">
					<div class="col-sm-3 my-1">

						<label class="sr-only" for="inlineFormInputName">书名</label> <input type="text" class="form-control" id="inlineFormInputName" placeholder="书名" name="name"
							value="${param.name }">
					</div>
					<div class="col-sm-3 my-1">
						<label class="sr-only" for="inlineFormInputGroupUsername">类型</label>
						<div class="input-group">
							<select name="tid" class="custom-select" id="tid_sel">
								<option value="-1">--------------请选择-------------</option>
								<c:forEach items="${types }" var="type">

									<option value="${type.id }">${type.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="col-auto my-1">
						<button type="submit" class="btn btn-primary">搜索</button>
					</div>

				</div>
			</form>

		</div>
		<div class="card-header text-center container card">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered">
							<!-- 优化列表界面，自己设置列宽 -->
							<thead class="col-md-12">
								<tr class="row">
									<!-- 设置每一列宽 -->
									<th class="col-md-1 col-1 text-center">id</th>
									<th class="col-md-1 col-1 text-center" onclick="SortName()">name</th>
									<th class="col-md-1 col-1 text-center">tid</th>
									<th class="col-md-2 col-1 text-center">descri</th>
									<th class="col-md-3 col-1 text-center">photo</th>
									<th class="col-md-1 col-1 text-center">price</th>
									<th class="col-md-1 col-1 text-center">pubdate</th>
									<th class="col-md-1 col-1 text-center">author</th>
									<th class="col-md-1 col-1 text-center">操作</th>
								</tr>
							</thead>
							<tbody class="col-md-12">
								<c:choose>
									<c:when test="${empty pageInfo.content}">
										<tr class="row text-center">
											<td colspan="9">无数据</td>
										</tr>
									</c:when>
									<c:otherwise>
										<!-- pageInfo返回查询列表 -->
										<c:forEach items="${pageInfo.content}" var="book">

											<tr class="row">
												<td class="col-md-1 col-1 text-center">${book.id}</td>
												<td class="col-md-1 col-1 text-center">${book.name}</td>
												<td class="col-md-1 col-1 text-center">${book.tid}</td>
												<!-- -存在xss攻击，存一段js会执行 -->
												<%-- <td class="col-md-2 col-1 text-center">${book.descri}</td> --%>

												<td class="col-md-2 col-1 text-center">
													<!-- 预防xss攻击，使用html转义 --> <c:out value="${book.descri}" escapeXml="true"></c:out>
												</td>
												<td class="col-md-3 col-1 text-center">
													<%-- <c:choose>
												<c:when test=""></c:when>
												<c:otherwise></c:otherwise>
												</c:choose> --%> <img id="myimg" src="/upload/${book.photo }" style="width: 30%; cursor: pointer;" class="img-thumbnail" onerror="useDefaultImg(event)">
												</td>
												<td class="col-md-1 col-1 text-center">${book.price}</td>
												<td class="col-md-1 col-1 text-center"><fmt:formatDate value="${book.pubdate}" pattern="yyyy-MM-dd" /></td>
												<td class="col-md-1 col-1 text-center">${book.author}</td>

												<td class="col-md-1 col-1 text-center">
													<!--  style="text-decoration: none"设置清除超链接的默认下划线 --> <a href="bookdel?id=${book.id }" style="text-decoration: none" title="删除" onclick="delconfirm(event)"><span
														class="icon-bin"></span></a>&nbsp;&nbsp; <a href="tobookEdit?id=${book.id }" style="text-decoration: none" title="修改"><span class="icon-pencil"></span></a>

												</td>
											</tr>
										</c:forEach>

									</c:otherwise>

								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted ">
				<div class="container-fluid ">
					<tr>
						<td colspan="9" style="padding-bottom: 0px; padding-top: 0px" class="text-center">
							<nav aria-label="Page navigation example">
								<ul class="pagination" style="margin: 0px">

									<c:choose>
										<c:when test="${pageInfo.first }">
											<li class="page-item"><a href="javascript:void(0)" class="page-link">&laquo;</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${pageInfo.number+1-1}">&laquo;</a></li>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageInfo.totalPages<=5}">
											<c:forEach begin="1" end="${ pageInfo.totalPages}" var="i">
												<li class="page-item"><a href="tobooklist?pageNo=${ i}" class="page-link">${i}</a></li>
											</c:forEach>
										</c:when>
										<c:when test="${pageInfo.number+1<=3}">
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=1">1</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=2">2</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=3">3</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=4">4</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${pageInfo.totalPages}">..${pageInfo.totalPages}</a></li>
										</c:when>
										<c:when test="${pageInfo.number+1>=pageInfo.totalPages-2}">
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=1">1..</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${ pageInfo.totalPages-3}">${ pageInfo.totalPages-3}</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${ pageInfo.totalPages-2}">${ pageInfo.totalPages-2}</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${ pageInfo.totalPages-1}">${ pageInfo.totalPages-1}</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${ pageInfo.totalPages}">${ pageInfo.totalPages}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=1">1..</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${pageInfo.number+1-1}">${pageInfo.number+1-1}</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${pageInfo.number+1}">${pageInfo.number+1}</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${pageInfo.number+1+1}">${pageInfo.number+1+1}</a></li>
											<li class="page-item"><a class="page-link" href="tobooklist?pageNo=${ pageInfo.totalPages}">..${ pageInfo.totalPages}</a></li>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageInfo.last }">
											<li class="disabled"><a href="javascript:void(0)" class="page-link">&raquo;</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a href="tobooklist?pageNo=${pageInfo.number+1+1}" class="page-link">&raquo;</a></li>

										</c:otherwise>

									</c:choose>
								</ul>
							</nav>
						</td>
					</tr>
				</div>

			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="delDialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">确认删除</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<p>请确认要删除？</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary btn_ok">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部版权 -->
		<div class="row mx-auto card" style="height: 100px; background-color: e5e5e5; line-height: 100px">
			<!-- 静态包含，底部版权模块 -->
			<%@include file="common/copyright.jsp"%>
		</div>
	</div>
	<!-- js文件放在最后面，提高网页响应速度 -->
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/uri-util/dist/uri-util.min.js"></script>
	<!-- 主题切换的公共js -->
	<script type="text/javascript" src="resources/common/themejs/theme.js"></script>
	<script type="text/javascript">
		//写在$(function{});不受位置影响
		$(function() {
			//修改主题的值，没有选择是默认主题
			$("#themeSel").val("<spring:theme code='bstheme'/>");
			$("#tid_sel").val("${empty param.tid?-1:param.tid}");
			$("a[ href='tobooklist?pageNo=${pageInfo.number+1}']").parent("li").addClass("active");
			var prePage = ${pageInfo.number+1-1};
			var nextPage = ${pageInfo.number+1+1};
			$('a[class="page-link"][href^="tobooklist?pageNo="]').click(function(evt) {
		  	evt.preventDefault();
			//修改表单中pageNo的值
			if ($(this).text() == "»") {
			$('#booklistSearchForm input[name="pageNo"]').val(nextPage);
			} else if ($(this).text() == "«") {
			$('#booklistSearchForm input[name="pageNo"]').val(prePage);
			} else {
			//$('#bookListSearchFrm input[name="pageNo"]').val($(this).text());
			$('#booklistSearchForm input[name="pageNo"]').val($(this).text().replace(/\./g,''));
			}
			$("#booklistSearchForm").submit();
			});
			
			//对模态对话框配置
			$("#delDialog").modal({
				backdrop : 'static',//否则你点击对话框外的部分就消失
				show : false
			//默认是显示的
			});
		});
		//该函数不能放在内部，放进去就是局部变量，删除连接点击无法找到
		function delconfirm(event) {
			//取消超级链接的默认行为
			event.preventDefault();
			//显示模态对话框：点击的是图标，因而我们要找他的父亲a
			var url = $(event.target).parent("a").attr("href");
			$('#delDialog').modal('show');
			//给确认框绑定一次性事件
			$("#delDialog button.btn_ok").one("click", function() {
				window.location.href = url;
			});
		}
		function SortName(){
			var url="tobooklist?sortpro="+$('booklistSearchForm').serialize();
			window.location.href = url;
			}
	</script>


</body>
</html>