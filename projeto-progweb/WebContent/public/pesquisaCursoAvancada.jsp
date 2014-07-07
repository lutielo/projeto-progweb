<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h2 align="left">Pesquisa Avançada de Cursos</h2>
						<div class="col-xs-15"><hr></div>
						
						<form class="form-horizontal" action="${pageContext.request.contextPath}/PesquisaAvancadaCursoJPA" method="post">
							<fieldset>
								<div class="form-group">
									<label for="inputDescricao" class="col-lg-2 control-label">Descrição:</label>
									<div class="col-lg-10">
										<input type="text" name="descricao" class="form-control" id="inputDescricao" placeholder="Programação WEB" value="${curso.decurso}">
									</div>
								</div>
								<div class="form-group">
									<label for="select" class="col-lg-2 control-label">Professor:</label>
									<div class="col-lg-10">
										<select class="form-control" name="professor" id="professor">
											<option value="" selected>-- Selecione --</option>
											<c:forEach var="professor" items="${listaProfessores}">
												<c:set var = "codigoProfessorAtual" value="${curso.usuario.cdusuario}"/>
												<c:if test="${professor.cdusuario == codigoProfessorAtual}">
													<option value="${professor.cdusuario}" selected>${professor.nmusuario}</option>
												</c:if>
												<c:if test="${professor.cdusuario != codigoProfessorAtual}">
													<option value="${professor.cdusuario}">${professor.nmusuario}</option>
												</c:if>
											</c:forEach>
										</select>
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
										<button type="reset" class="btn btn-default">Limpar</button>
										<button type="submit" class="btn btn-primary">Pesquisar</button>
									</div>
								</div>
							</fieldset>
						</form>			
						</div>
					</div>
				</div>
				<div id="right"></div>
			</div>
		<div id="footer"></div>
	</div>
	</div>
</body>
</html>