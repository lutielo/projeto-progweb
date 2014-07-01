<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<title>Projeto Unisul</title>
</head>
<body>
	<div id="container">
<!-- 	INCLUIR AQUI -->
		
		<div id="content">
<!-- 	INCLUIR AQUI -->
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h1>Lista de usuários</h1>
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
									<td align="center"><a href="AlteraUsuarioManager?codigo=${usuario.cdusuario}"><img src="images/Edit.png" alt="Editar" height="20" width="20"></a></td>
									<td align="center"><a href="DeleteUsuarioManager?codigo=${usuario.cdusuario}"><img src="images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
<!-- 	INCLUIR AQUI -->
		</div>
<!-- 	INCLUIR AQUI -->
	</div>
</body>
</html>