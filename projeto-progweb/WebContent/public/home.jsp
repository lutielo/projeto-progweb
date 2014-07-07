<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="../bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="../bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>

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
			<img id="img_logo" src="../images/logo_ava.png">
		</div>
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h3 align="left">O Ambiente Virtual de Aprendizagem</h3>
						<div class="col-xs-15"><hr></div>
						<p align="justify">De modo simples, o <strong>Ambiente Virtual de Aprendizagem (AVA)</strong> é um conjunto de elementos tecnológicos disponíveis na internet. É um local virtual onde são disponibilizadas ferramentas que permite o acesso a um curso ou disciplina e também permite a interação entre os alunos, professores e monitories envolvidos no processo de ensino-aprendizagem.


O AVA possibilita a oferta de uma sala de aula virtual para o acompanhamento dos alunos e a realização de atividades de aprendizagem. Os AVAs rompem os limites da sala de aula presencial e favorecem a formação de comunidades virtuais de aprendizagem.


No NEAD a sua principal ferramenta de apoio será o Ambiente Virtual de Aprendizagem (AVA). O aluno recebe um login e uma senha de acesso a este espaço no início do semestre letivo, e é através dele que o aluno desenvolverá as atividades do curso e manterá o contato com a instituição. O AVA pode ser usado para:<br><br>
· Acessar conteúdos e atividades do curso/disciplina;<br>
· Realizar diferentes atividades planejadas para propiciar sua aprendizagem ativa;<br>
· Interagir com os colegas virtuais trocando idéias, debatendo ou colaborando com seus trabalhos; interagir com o professor tutor;<br>
· Acompanhar sua trajetória através do relatório de atividades.
					</div>
				</div>
			</div>
		<div id="right"></div>
	</div>
	<div id="footer"></div>
</div>
</body>
</html>