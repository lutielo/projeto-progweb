<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				<form class="form-horizontal" action="UsuarioManagerJPA" method="post">
					<fieldset>
						<legend>Cadastro de usuário</legend>
						<div class="form-group">
							<label for="inputNome" class="col-lg-2 control-label">Nome Completo</label>
							<div class="col-lg-10">
								<input type="text" name="nomecompleto" class="form-control" id="inputNome" placeholder="Fulano da Silva">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-lg-2 control-label">Email</label>
							<div class="col-lg-10">
								<input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputLogin" class="col-lg-2 control-label">Login</label>
							<div class="col-lg-10">
								<input type="text" name="login" class="form-control" id="inputLogin" placeholder="Login">
							</div>
						</div>
						<div class="form-group">
							<label for="inputSenha" class="col-lg-2 control-label">Senha</label>
							<div class="col-lg-10">
								<input type="password" name="senha" class="form-control" id="inputSenha" placeholder="Senha">
							</div>
						</div>
						<%if("trocar aqui por session.getAttribute(cadastroadm)".equals("true")){  %>
						<div class="form-group">
							<label for="select" class="col-lg-2 control-label">Perfil</label>
							<div class="col-lg-10">
								<select class="form-control" name="perfil" id="perfil">
									<option value="1">Admin</option>
									<option value="2">Aluno</option>
									<option value="3">Professor</option>
								</select>
							</div>
						</div>
						<%} else {%>
						    <input type="hidden" name="perfil" value="2"/>
						<%}%>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button class="btn btn-default" onclick="javascript:history.go(-1)">Voltar</button>
								<button type="reset" class="btn btn-default">Limpar</button>
								<button type="submit" class="btn btn-primary">Cadastrar</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer">
			<p>Rodapé</p>
		</div>
	</div>
</body>
</html>