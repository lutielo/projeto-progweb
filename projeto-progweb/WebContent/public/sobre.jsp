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
			<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
			<div id="content">
				<div id="left"></div>
					<div id="center">
						<div class="col-lg-15">
							<div class="well bs-component">
								<h2 align="left">Sobre</h2>
								<div class="col-xs-15"><hr></div>
								<h2 align="left"><span>O que � Lorem Ipsum?</span></h2>
								<p align="justify">
									<strong>Lorem Ipsum</strong> � simplesmente uma simula��o de
									texto da ind�stria tipogr�fica e de impressos, e vem sendo
									utilizado desde o s�culo XVI, quando um impressor desconhecido
									pegou uma bandeja de tipos e os embaralhou para fazer um livro de
									modelos de tipos. Lorem Ipsum sobreviveu n�o s� a cinco s�culos,
									como tamb�m ao salto para a editora��o eletr�nica, permanecendo
									essencialmente inalterado. Se popularizou na d�cada de 60, quando
									a Letraset lan�ou decalques contendo passagens de Lorem Ipsum, e
									mais recentemente quando passou a ser integrado a softwares de
									editora��o eletr�nica como Aldus PageMaker.
							</div>
						</div>
					</div>
				<div id="right"></div>
			</div>
		<div id="footer"></div>
	</div>
</body>
</html>