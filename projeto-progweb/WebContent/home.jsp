<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css"
	rel="stylesheet" />
<title>Projeto Unisul</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<img src="images/Banner.jpg">
		</div>
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Active</a></li>
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Dropdown <b class="caret"></b></a>
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
				<form name="loginForm" class="navbar-form navbar-right" action="PerfilAcessoManagerJPA" method="get">
					<ul class="nav navbar-nav">
						<li><input type="text" name="login" placeholder="Login" class="form-control col-lg-8"></li>
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>
						<li><input type="password" name="senha" placeholder="Senha" class="form-control col-lg-8"></li>
						<li class="divider">&nbsp;&nbsp;&nbsp;</li>
						<li><input type="submit" value="Entrar"  class="btn btn-primary"/></li>
					</ul>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<p>Conteúdo da Div do Meio</p>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer">
			<p>Rodapé</p>
		</div>
	</div>
</body>
</html>