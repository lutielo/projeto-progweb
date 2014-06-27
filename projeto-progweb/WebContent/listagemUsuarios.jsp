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
		<div id="header">
			<img src="images/BannerV1.jpg">
		</div>
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Active</a></li>
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Dropdown header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<h1>Lista completa de usuários</h1>
				<hr>
				<table class="table table-striped table-hover ">
				  <thead>
					<tr>
						<th width="60">Código</th>
						<th>Nome</th>
						<th>Login</th>
						<th>Email</th>
					</tr>
				  </thead>
				  <tbody>
					<c:forEach var="usuario" items="${listaUsuarios}">
						<tr>
							<td>${usuario.cdusuario}</td>
							<td>${usuario.nmusuario}</td>
							<td>${usuario.delogin}</td>
							<td>${usuario.deemail}</td>
							<td align="center"><a href="?codigo=${usuario.cdusuario}"><img src="images/Edit.png" alt="Editar" height="20" width="20"></a></td>
							<td align="center"><a href="DeleteUsuarioManager?codigo=${usuario.cdusuario}"><img src="images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer">
			<p>Rodapé</p>
		</div>
	</div>
</body>
</html>