<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="../bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="../bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
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
								<h2 align="left"><span>O que � AVA?</span></h2>
								<p align="justify">
									O <strong>Ambiente Virtual de Aprendizagem (AVA)</strong>, por ser uma institui��o com car�ter filantr�pico, 
									busca sempre o ensino de qualidade e principalmente que seja acess�vel � maior parte da popula��o. 
									E � buscando a democratiza��o do ensino que a Funda��o trabalhou para trazer o EAD � Florian�polis, 
									dando assim maior oportunidade para que mais pessoas de Florian�polis e regi�o possam iniciar um curso superior.
							</div>
						</div>
					</div>
				<div id="right"></div>
			</div>
		<div id="footer"></div>
	</div>
</body>
</html>