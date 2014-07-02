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
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/public/home.jsp">Inicial</a>
			</div>
			
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/CadastraUsuarioManager">Cadastro de Usuários</a></li>
					<li><a href="${pageContext.request.contextPath}/CadastraCursoManager">Cadastro de Cursos</a></li>
					<li><a href="${pageContext.request.contextPath}/ListaUsuariosManager">Listagem de Usuários</a></li>
					<li><a href="${pageContext.request.contextPath}/ListaCursoManager">Listagem de Cursos</a></li>
				</ul>
				
				<c:if test="${empty sessionScope.usuario}">
					<form name="loginForm" action="LoginUsuario" method="POST" class="navbar-form navbar-right">
						<ul class="nav navbar-nav">
							<li><input type="text" name="login" placeholder="Login" class="form-control col-lg-8"></li>
							<li class="divider">&nbsp;&nbsp;&nbsp;</li>
							<li><input type="password" name="senha" placeholder="Senha" class="form-control col-lg-8"></li>
							<li class="divider">&nbsp;&nbsp;&nbsp;</li>
							<li><input type="submit" value="Entrar" class="btn btn-primary" /></li>
						</ul>
					</form>
					
					<ul class="nav navbar-nav navbar-right">
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/public/cadastroUsuarios.jsp">Criar conta</a></li>
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>	
				</ul>
				</c:if>
				
				<c:if test="${not empty sessionScope.usuario}">
					<ul class="nav navbar-nav navbar-right">
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/LogoutUsuario">Logout</a></li>
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>
					</ul>
				</c:if>
				
			</div>
		</div>
		
		<div id="content">
<div id="left"></div>
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
									<td align="center"><a href="${pageContext.request.contextPath}/AlteraUsuarioManager?codigo=${usuario.cdusuario}"><img src="images/Edit.png" alt="Editar" height="20" width="20"></a></td>
									<td align="center"><a href="${pageContext.request.contextPath}/DeleteUsuarioManager?codigo=${usuario.cdusuario}"><img src="images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
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