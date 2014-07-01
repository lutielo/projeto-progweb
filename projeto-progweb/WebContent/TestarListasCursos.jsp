<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<title>Resultados da pesquisa por cursos</title>
</head>
<body>

	<div id="container">
		<jsp:include page="header.jsp" />
		
		<div id="content">
			<jsp:include page="left.jsp" />
			<div id="center">
				<jsp:include page="listaCursosDisponiveis.jsp"/>
				<jsp:include page="listaCursosEmAndamento.jsp"/>
				<jsp:include page="listaCursosEmAndamentoPorAluno.jsp"/>
				<jsp:include page="listaCursosEmAndamentoPorProfessor.jsp"/>
			</div>
			<jsp:include page="right.jsp" />
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>