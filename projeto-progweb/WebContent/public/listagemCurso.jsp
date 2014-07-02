<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<title>Projeto Unisul</title>
</head>
<body>
	<div id="container">
		<c:if test="${not empty sessionScope.msg}">
			<div class="alert alert-dismissable alert-info">
	  			<button type="button" class="close" data-dismiss="alert">×</button>
	  			<strong>${sessionScope.msg}</strong>
				<%session.setAttribute("msg", null);%>
			</div>
		</c:if>
		<div id="header">
			<img src="${pageContext.request.contextPath}/images/BannerV1.jpg">
		</div>
		<jsp:include page="${pageContext.request.contextPath}/../admin/menuAdmin.jsp" />
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h1>Lista completa de cursos</h1>
						<hr>
						<table class="table table-striped table-hover ">
						  <thead>
							<tr>
								<th width="60">Código</th>
								<th>Descrição</th>
								<th>Data inicial</th>
								<th>Data final</th>
								<th width="60">Alunos</th>
								<th colspan="3">Ações</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach var="curso" items="${listaCursos}">
								<tr>
									<td>${curso.cdcurso}</td>
									<td align="left"><a href="${pageContext.request.contextPath}/DetalhesCursoManager?codigo=${curso.cdcurso}">${curso.decurso}</a></td>
									<td><fmt:formatDate value="${curso.dtinicio}" pattern="dd/MM/yyyy" /></td>
									<td><fmt:formatDate value="${curso.dtfim}" pattern="dd/MM/yyyy" /></td>
									<td align="center"><a href="${pageContext.request.contextPath}/PesquisaCursoAluno?codigo=${curso.cdcurso}"><img src="images/List-32.png" alt="Listar alunos" height="20" width="20"></a></td>
									<td align="center"><a href="${pageContext.request.contextPath}/MailToAlunosCurso?codigo=${curso.cdcurso}"><img src="images/Mail-32.png" alt="Mail" height="20" width="20"></a></td>
									
									<c:if test="${sessionScope.usuario.perfil.cdperfil == 1}">
										<td align="center"><a href="${pageContext.request.contextPath}/AlteraCursoManager?codigo=${curso.cdcurso}"><img src="images/Edit.png" alt="Editar" height="20" width="20"></a></td>
										<td align="center"><a href="${pageContext.request.contextPath}/DeleteCursoManager?codigo=${curso.cdcurso}"><img src="images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
									</c:if>
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