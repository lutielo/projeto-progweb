<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css"
	rel="stylesheet" />
<title>Projeto Unisul</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<img src="../images/BannerV1.jpg">
		</div>
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home.jsp">Inicial</a>
			</div>
			
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li><a href="sobre.jsp">Sobre</a></li>
					<li><a href="contato.jsp">Contato</a></li>
				</ul>
				
				<c:if test="${empty sessionScope.usuario}">
					<form name="loginForm" action="../LoginUsuario" method="POST" class="navbar-form navbar-right">
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
						<li><a href="cadastroUsuarios.jsp">Criar conta</a></li>
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>	
				</ul>
				</c:if>
				
				<c:if test="${not empty sessionScope.usuario}">
					<ul class="nav navbar-nav navbar-right">
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>
						<li><a href="../LogoutUsuario">Logout</a></li>
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>
					</ul>
				</c:if>
				
			</div>
		</div>
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<jsp:useBean id="lista" class="br.unisul.progweb.controle.curso.ListaCursoPorTipoJPA" scope="request" />
				<h1>Cursos disponíveis</h1>
				<hr>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Descrição</th>
							<th>Data inicial</th>
							<th>Data final</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="curso" items="${lista.listCursoDisponiveis}">
							<tr>
								<td align="center"><a href="DetalhesCurso?codigo=${curso.cdcurso}">${curso.decurso}</a></td>
								<td>${curso.dtinicio}</td>
								<td>${curso.dtfim}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		<div id="right"></div>
	</div>
	<div id="footer"></div>
</div>
</body>
</html>