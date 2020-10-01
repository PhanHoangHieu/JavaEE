<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator Page</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
							chủ</a></li>
				</ul>
				/.breadcrumb
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12"></div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th><input type="checkbox" id="checkAll"></th>
										<th>ID</th>
										<th>Name</th>
										<th>Code</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="role" items="${list}">
										<tr>
											<td>${role.id}</td>
											<td>${role.name}</td>
											<td>${role.code}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>