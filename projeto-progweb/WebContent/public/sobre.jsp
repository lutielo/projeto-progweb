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
				<form class="navbar-form navbar-left">
					<input type="text" class="form-control col-lg-8"
						placeholder="Search">
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Dropdown <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
		</div>

		<!-- 		<div class="navbar navbar-default"> -->
		<!-- 			<div class="navbar-collapse collapse navbar-responsive-collapse"> -->
		<!-- 				<ul class="nav navbar-nav navbar-left"> -->
		<!-- 					<li class="divider">&nbsp;&nbsp;&nbsp;</li> -->
		<!-- 					<li class="active"><a href="contato.jsp" >Fale Conosco</a></li> -->
		<!-- 					<li class="divider">&nbsp;&nbsp;&nbsp;</li> -->
		<!-- 				</ul> -->
		<%-- 				<c:if test="${empty sessionScope.usuario}"> --%>
		<!-- 	    			<form name="loginForm" class="navbar-form navbar-right" action="PerfilAcessoManagerJPA" method="get"> -->
		<!-- 						<ul class="nav navbar-nav"> -->
		<!-- 							<li><input type="text" name="login" placeholder="Login" class="form-control col-lg-8"></li> -->
		<!-- 							<li class="divider">&nbsp;&nbsp;&nbsp;</li> -->
		<!-- 							<li><input type="password" name="senha" placeholder="Senha" class="form-control col-lg-8"></li> -->
		<!-- 							<li class="divider">&nbsp;&nbsp;&nbsp;</li> -->
		<!-- 							<li><input type="submit" value="Entrar" class="btn btn-primary" /></li> -->
		<!-- 						</ul> -->
		<!-- 					</form> -->
		<!-- 					<ul class="nav navbar-nav navbar-right"> -->
		<!-- 						<li class="divider">&nbsp;&nbsp;&nbsp;</li> -->
		<!-- 						<li><a href="cadastroUsuarios.jsp">Criar conta</a></li> -->
		<!-- 						<li class="divider">&nbsp;&nbsp;&nbsp;</li> -->
		<!-- 					</ul> -->
		<%-- 				</c:if> --%>
		<%-- 				<c:if test="${not empty sessionScope.usuario}"> --%>
		<!-- 					<div class="navbar navbar-default"> -->
		<!-- 						<ul class="nav navbar-nav navbar-right"> -->
		<!-- 							<li class="divider">&nbsp;&nbsp;&nbsp;</li> -->
		<%-- 							<li><a href="${pageContext.request.contextPath}/LogoutUsuario">Logout</a></li> --%>
		<!-- 							<li class="divider">&nbsp;&nbsp;&nbsp;</li> -->
		<!-- 						</ul> -->
		<!-- 					</div> -->
		<%-- 				</c:if> --%>
		<!-- 			</div> -->
		<!-- 		</div> -->
		<div id="content">
<!-- 	INCLUIR AQUI -->
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h2 align="left">Sobre</h2>
						<div class="col-xs-15"><hr></div>
						<h2 align="left"><span>O que � Lorem Ipsum?</span></h2>
						<p align="justify"><strong>Lorem Ipsum</strong> � simplesmente uma simula��o de texto da ind�stria tipogr�fica e de impressos, e vem sendo utilizado desde o s�culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu n�o s� a cinco s�culos, como tamb�m ao salto para a editora��o eletr�nica, permanecendo essencialmente inalterado. Se popularizou na d�cada de 60, quando a Letraset lan�ou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editora��o eletr�nica como Aldus PageMaker.
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