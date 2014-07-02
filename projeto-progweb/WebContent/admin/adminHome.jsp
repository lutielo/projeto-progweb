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
				<form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/PesquisaCursoJPA" method="POST">
					<fieldset>
						<input type="text" name="descricao" class="form-control" id="inputDescricao" placeholder="Qual curso você deseja?">
						<div class="form-group">
							<div class="col-lg-6 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">Pesquisar</button>
							</div>
						</div>
					</fieldset>
				</form>
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
								<td align="center"><a href="${pageContext.request.contextPath}/DetalhesCursoManager?codigo=${curso.cdcurso}">${curso.decurso}</a></td>
								<td><fmt:formatDate value="${curso.dtinicio}" pattern="dd/MM/yyyy" /></td>
								<td><fmt:formatDate value="${curso.dtfim}" pattern="dd/MM/yyyy" /></td>
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