<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<title>Pesquisa curso</title>
</head>
<body>
	<div id="container">
<!-- 	INCLUIR AQUI -->
		
		<div id="content">
<!-- 	INCLUIR AQUI -->
			<div id="center">
						<form class="form-horizontal" action="PesquisaAvancadaCursoJPA" method="post">
							<fieldset>
								<div class="form-group">
									<label for="inputDescricao" class="col-lg-2 control-label">Descri��o:</label>
									<div class="col-lg-10">
										<input type="text" name="descricao" class="form-control" id="inputDescricao" placeholder="Programa��o WEB" value="${curso.decurso}">
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
									
									<label for="inputDataInicio" class="col-lg-2 control-label">Data in�cio:</label>
									<div class="col-lg-4">
										<input type="date" name="dataInicio" class="form-control" id="inputDataInicio" value="${curso.dtinicio}">
									</div>
									
									<label for="inputDataFim" class="col-lg-2 control-label">at�:</label>
									<div class="col-lg-4">
										<input type="date" name="dataFim" class="form-control" id="inputDataFim" value="${curso.dtfim}">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button class="btn btn-default" onclick="javascript:history.go(-1)">Voltar</button>
										<button type="submit" class="btn btn-primary">Pesquisar</button>
									</div>
								</div>
							</fieldset>
						</form>			
			</div>
<!-- 	INCLUIR AQUI -->
		</div>
		
<!-- 	INCLUIR AQUI -->
	</div>
</body>
</html>