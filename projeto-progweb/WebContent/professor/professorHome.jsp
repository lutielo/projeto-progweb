<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="../bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="../bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
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
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		<div id="content">
			<div id="left">
				<jsp:useBean id="lista" class="br.unisul.progweb.controle.curso.ListaCursoPorTipoJPA" scope="request" />
				<h6 align="left">Cursos Disponiveis :</h6>
				<ul>
					<c:forEach var="curso" items="${lista.listCursoDisponiveis}">
						<li type="square"><a href="${pageContext.request.contextPath}/DetalhesCursoManager?codigo=${curso.cdcurso}">${curso.decurso}</a></li>
					</c:forEach>
				</ul>
				<br><br>
				<h6 align="left">Cursos em Andamento :</h6>
				<ul>
					<c:forEach var="curso" items="${lista.listCursoEmAndamento}">
						<li type="square"><a href="${pageContext.request.contextPath}/DetalhesCursoManager?codigo=${curso.cdcurso}">${curso.decurso}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div id="center">
				Bem vindo professor ${sessionScope.usuario.nmusuario},<br>
				Para listar os cursos ao qual você ministra no momento <a href="${pageContext.request.contextPath}/professor/CursosDoProfessorManager?usuario=${sessionScope.usuario}">clique aqui</a>
				
				
				<br><br><br>
				Para pesquisa avançada <a href="${pageContext.request.contextPath}/IniciarPesquisaAvancadaCursoJPA">clique aqui</a>
			</div>
		<div id="right"></div>
	</div>
	<div id="footer"></div>
</div>
</body>
</html>