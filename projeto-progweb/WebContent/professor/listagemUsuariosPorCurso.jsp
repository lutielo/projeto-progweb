<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
			
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h1>Lista de alunos de ${curso}</h1>
						<hr>
						<table class="table table-striped table-hover ">
						  <thead>
							<tr>
								<th width="60">Código</th>
								<th>Nome</th>
								<th>Login</th>
								<th>Email</th>
								<th>Perfil</th>
								<th colspan="2">Ações</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach var="usuario" items="${listaUsuarios}">
								<tr>
									<td>${usuario.cdusuario}</td>
									<td>${usuario.nmusuario}</td>
									<td>${usuario.delogin}</td>
									<td>${usuario.deemail}</td>
									<td>${usuario.perfil.deperfil}</td>
									<td align="center"><a href="/admin/AlteraUsuarioManager?codigo=${usuario.cdusuario}"><img src="images/Edit.png" alt="Editar" height="20" width="20"></a></td>
									<td align="center"><a href="/admin/DeleteUsuarioManager?codigo=${usuario.cdusuario}"><img src="images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
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