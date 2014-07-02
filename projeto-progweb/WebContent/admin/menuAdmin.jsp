<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<%-- 			<c:if test="${sessionScope.usuario.perfil.cdperfil == 1}"> --%>
				<li><a href="${pageContext.request.contextPath}/CadastraUsuarioManager">Cadastro de Usuários</a></li>
				<li><a href="${pageContext.request.contextPath}/CadastraCursoManager">Cadastro de Cursos</a></li>
				<li><a href="${pageContext.request.contextPath}/ListaUsuariosManager">Listagem de Usuários</a></li>
				<li><a href="${pageContext.request.contextPath}/ListaCursoManager">Listagem de Cursos</a></li>
<%-- 			</c:if> --%>
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
			<form name="loginForm" action="LoginUsuario" method="POST"
				class="navbar-form navbar-right">
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
				<li><a
					href="${pageContext.request.contextPath}/public/cadastroUsuarios.jsp">Criar
						conta</a></li>
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