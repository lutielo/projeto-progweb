<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
<link rel="icon" type="image/png" href="../images/favicon.ico" />
<title>Projeto Unisul</title>
</head>
<body>
	<div id="container">
		<c:if test="${not empty sessionScope.msg}">
			<div class="alert alert-dismissable alert-info">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<strong>${sessionScope.msg}</strong>
				<% session.setAttribute("msg", null); %>
			</div>
		</c:if>
		<div id="header">
			<img src="images/BannerV1.jpg">
		</div>
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<c:if test="${enviou == true}">
					<div class="alert alert-dismissable alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong><img src="images/Accept-32.png" alt="Excluir" height="20" width="20"></strong> Arquivo enviado com sucesso.
					</div>
				</c:if>

				<c:if test="${enviou == false}">
					<div class="alert alert-dismissable alert-danger">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Erro!</strong> Não foi possível fazer o upload do seu arquivo.
					</div>
				</c:if>

				<div class="col-lg-15">
					<div class="well bs-component">
						<h3 align="left">Curso:</h3>
						<h5 align="left">${curso.decurso}<br />
							<div class="col-xs-15">
								<hr>
							</div>

							<h3 align="left">Professor:</h3>
							<h5 align="left">${professor.nmusuario}<br />
								<div class="col-xs-15">
									<hr>
								</div>

								<h3 align="left">Período:</h3>
								<h5 align="left">
									De:
									<fmt:formatDate value="${curso.dtinicio}" pattern="dd/MM/yyyy" />
									&nbsp;&nbsp;&nbsp;Até:
									<fmt:formatDate value="${curso.dtfim}" pattern="dd/MM/yyyy" />
									<br />
									<div class="col-xs-15">
										<hr>
									</div>

									<h3 align="left">Ementa:</h3>
									<p>${curso.deementa}

										<c:set var="contains" value="false" />
										<c:forEach var="cursoalunos"
											items="${sessionScope.usuario.cursoalunos}">
											<c:if test="${cursoaluno.curso == curso.cdcurso}">
												<c:set var="contains" value="true" scope="request" />
											</c:if>
										</c:forEach>

										<c:if test="${!contains and (not empty sessionScope.usuario) and (sessionScope.usuario.perfil.deperfil eq 'aluno')}">
											<form class="form-horizontal"
												action="${pageContext.request.contextPath}/aluno/CadastraAlunoNoCursoManager?codigoAluno=${sessionScope.usuario.cdusuario}&codigoCurso=${curso.cdcurso}"
												method="post">
												<fieldset>
													<div class="form-group">
														<div class="col-lg-2">
															<input type="submit" class="btn btn-primary btn-lg" name="enviar" value="Cadastra-se no Curso" />
														</div>
													</div>
												</fieldset>
											</form>
										</c:if>
					</div>

					<c:if test="${(contains and (not empty sessionScope.usuario)) or (sessionScope.usuario.perfil.deperfil == 'administrador') or (sessionScope.usuario.perfil.deperfil == 'professor')}">
						<div class="col-lg-15">
							<div class="well bs-component">
								<h1>Aulas</h1>
								<hr>
								<table class="table table-striped table-hover ">
									<thead>
										<tr>
											<th>Descrição</th>
											<th>Download</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="aula" items="${listaFileArquivos}">
											<tr>
												<td>${aula.name}</td>
												<td align="center"><a
													href="DownloadFileServlet?filename=${aula}"><img
														src="images/Download.png" alt="Excluir" height="20"
														width="20"></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</c:if>

					<c:if
						test="${(sessionScope.usuario.perfil.deperfil == 'professor') or (sessionScope.usuario.perfil.deperfil == 'administrador')}">
						<div class="col-lg-15">
							<div class="well bs-component">
								<form class="form-horizontal"
									action="Upload?codigo=${curso.cdcurso}" method="post"
									name="form" enctype="multipart/form-data">
									<fieldset>
										<legend>Uploads de arquivos para o curso</legend> Upload: 
										<input type="file" name="arquivo" /><br/> 
										<input type="submit" class="btn btn-primary" name="enviar" value="Enviar" />
									</fieldset>
								</form>
							</div>
						</div>
					</c:if>

					<c:if
						test="${(sessionScope.usuario.perfil.deperfil == 'professor') or (sessionScope.usuario.perfil.deperfil == 'administrador')}">
						<form class="form-horizontal"
							action="/admin/AlteraCursoManager?codigo=${curso.cdcurso}"
							method="post">
							<button class="btn btn-default" formaction="ListaCursoManager">Voltar</button>
							<button type="submit" class="btn btn-primary">Editar</button>
						</form>
					</c:if>
				</div>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>