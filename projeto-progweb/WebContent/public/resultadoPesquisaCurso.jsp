<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
<link rel="icon" type="image/png" href="images/favicon.ico" />
<title>Projeto Unisul</title>
</head>
<body>
	<div id="container">
		<c:if test="${not empty sessionScope.msg}">
			<div class="alert alert-dismissable alert-info">
				<button type="button" class="close" data-dismiss="alert">�</button>
				<strong>${sessionScope.msg}</strong>
				<%session.setAttribute("msg", null);%>
			</div>
		</c:if>
		<div id="header">
			<img src="${pageContext.request.contextPath}/images/BannerV1.jpg">
		</div>
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />		
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h1 align="left">Resultados da pesquisa por cursos</h1>
						<hr>
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>Descri��o</th>
									<th>Data inicial</th>
									<th>Data final</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="curso" items="${lista}">
									<tr>
										<td align="left"><a href="DetalhesCursoManager?codigo=${curso.cdcurso}">${curso.decurso}</a></td>
										<td><fmt:formatDate value="${curso.dtinicio}" pattern="dd/MM/yyyy" /></td>
										<td><fmt:formatDate value="${curso.dtfim}" pattern="dd/MM/yyyy" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>