<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
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
		<jsp:include page="menuProfessor.jsp"></jsp:include>
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
				Para listar os cursos ao qual você ministra no momento <a href="${pageContext.request.contextPath}/CursosDoProfessorManager?usuario=${sessionScope.usuario}">clique aqui</a>
				
				
				<br><br><br><br><br>
				<h5 align="left">Para pesquisa avançada:</h5>
				<form class="form-horizontal" action="PesquisaAvancadaCursoJPA" method="post">
					<fieldset>
						<div class="form-group">
							<label for="inputDescricao" class="col-lg-2 control-label">Descrição:</label>
							<div class="col-lg-10">
								<input type="text" name="descricao" class="form-control" id="inputDescricao" placeholder="Programação WEB" value="${curso.decurso}">
							</div>
						</div>
						<div class="form-group">
							
							<label for="inputDataInicio" class="col-lg-2 control-label">Data início:</label>
							<div class="col-lg-4">
								<input type="date" name="dataInicio" class="form-control" id="inputDataInicio" value="${curso.dtinicio}">
							</div>
							
							<label for="inputDataFim" class="col-lg-2 control-label">até:</label>
							<div class="col-lg-4">
								<input type="date" name="dataFim" class="form-control" id="inputDataFim" value="${curso.dtfim}">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">Pesquisar</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		<div id="right"></div>
	</div>
	<div id="footer"></div>
</div>
</body>
</html>