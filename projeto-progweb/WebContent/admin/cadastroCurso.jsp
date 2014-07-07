<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div id="header">
			<img src="${pageContext.request.contextPath}/images/BannerV1.jpg">
		</div>	
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		<div id="content">
		<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<form class="form-horizontal" action="${pageContext.request.contextPath}/admin/CursoManagerJPA" method="post">
							<fieldset>
								<legend>${acao}</legend>
								<c:if test="${not empty curso.cdcurso}">
									<div class="form-group">
										<label for="inputCodigo" class="col-lg-2 control-label">Codigo:</label>
										<div class="col-lg-2">
											<input type="text" name="codigo" class="form-control" id="inputCodigo" value="${curso.cdcurso}" readonly>
										</div>
									</div>
								</c:if>
								<div class="form-group">
									<label for="inputDescricao" class="col-lg-2 control-label">Descri��o:</label>
									<div class="col-lg-10">
										<input type="text" name="descricao" class="form-control" id="inputDescricao" placeholder="Programa��o WEB" value="${curso.decurso}" required>
									</div>
								</div>
								<div class="form-group">
									<label for="select" class="col-lg-2 control-label">Professor:</label>
									<div class="col-lg-10">
										<select class="form-control" name="professor" id="professor" required>
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
										<input type="date" name="dataInicio" class="form-control" id="inputDataInicio" value="${curso.dtinicio}" required>
									</div>
									
									<label for="inputDataFim" class="col-lg-2 control-label">Data fim:</label>
									<div class="col-lg-4">
										<input type="date" name="dataFim" class="form-control" id="inputDataFim" value="${curso.dtfim}" required>
									</div>
								</div>
								<div class="form-group">
									<label for="textArea" class="col-lg-2 control-label">Ementa</label>
									<div class="col-lg-10">
										<textarea class="form-control" name="ementa" rows="7" id="textAreaEmenta" placeholder="Introdu��o ao desenvolvimento de aplica��es WEB com acessos a Banco de Dados empregando estruturas para manipula��o dos dados. Apresenta��o e introdu��o de recursos Web atrav�s de Web Forms. Cria��o de controles personalizados. Conceitos de programa��o din�mica." required>${curso.deementa}</textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button class="btn btn-default"  formaction="${pageContext.request.contextPath}/ListaCursoManager">Voltar</button>
										<button type="reset" class="btn btn-default">Limpar</button>
										<button type="submit" class="btn btn-primary">Salvar</button>
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
</body>
</html>