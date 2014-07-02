<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<title>Contato</title>
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
					<li class="active"><a href="contatoOficial.jsp">Contato</a></li>
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
<!-- 	INCLUIR AQUI -->
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h2 align="left">Contato</h2>
						<div class="col-xs-15"><hr></div>
						<p>Para entrar em contato preencha o formulário abaixo
						ou envie um e-mail para contato@contato.com.br<br><br>
						<h5 style="color:red">ESTE FORMULÁRIO NÃO ESTÁ FUNCIONANDO POIS NÃO TEMOS UM SERVIDOR DE EMAILS</h5><br>
						<form class="form-horizontal" name="formulario" action="http://scripts.redehost.com.br/formmail.aspx" method="post">
							<input type=hidden name="destino" value="contato@contato.com">
							<input type=hidden name="enviado" value="http://www.seudominio.xxx.yy/enviado.htm">
							
							<div class="form-group">
								<label for="inputNome" class="col-lg-2 control-label">Nome:</label>
								<div class="col-lg-10">
									<input type=text name="nome" class="form-control" id="inputNome" placeholder="Fulano da Silva" autofocus></p><br>
								</div>

								<label for="inputEmail" class="col-lg-2 control-label">Email:</label>
								<div class="col-lg-10">
									<input type=text name="email" class="form-control" id="inputEmail" placeholder="vinicius@unisul.br"></p><br>
								</div>

								<label for="inputAssunto" class="col-lg-2 control-label">Assunto:</label>
								<div class="col-lg-10">
									<input type=text name="assunto" class="form-control" id="inputAssunto"></p><br>
								</div>
								
								<label for="textArea" class="col-lg-2 control-label">Mensagem:</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="Mensagem" rows="7" id="textMensagem" wrap="virtual"></textarea></p><br>
								</div>

								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">Limpar Formulário</button>
									<button type="submit" class="btn btn-primary">Enviar Email</button>
								</div>
							</div>
						</form>
						
					</div>
				</div>


			</div>
			<div id="right"></div>
<!-- 	INCLUIR AQUI -->
		</div>
		<div id="footer"></div>
<!-- 	INCLUIR AQUI -->
	</div>
</body>
</html>