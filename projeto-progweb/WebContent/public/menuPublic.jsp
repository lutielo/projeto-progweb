<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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