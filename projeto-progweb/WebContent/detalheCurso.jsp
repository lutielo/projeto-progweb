<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<title>Projeto Unisul</title>
</head>
<body>

	<div id="container">
		<jsp:include page="header.jsp" />
		
		<div id="content">
			<jsp:include page="left.jsp" />
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h3 align="left">Curso:</h3>
						<h5 align="left">${curso.decurso}<br/>
						<div class="col-xs-15"><hr></div>
						
						<h3 align="left">Professor:</h3>
						<h5 align="left">${professor.nmusuario}<br/>
						<div class="col-xs-15"><hr></div>
						
						<h3 align="left">Período:</h3>
						<h5 align="left">
						De: <fmt:formatDate value="${curso.dtinicio}" pattern="dd/MM/yyyy"/>
						&nbsp;&nbsp;&nbsp;Até:<fmt:formatDate value="${curso.dtfim}" pattern="dd/MM/yyyy"/><br/>
						<div class="col-xs-15"><hr></div>
						
						<h3 align="left">Ementa:</h3>
						<p>${curso.deementa}
					</div>
					<form class="form-horizontal" action="AlteraCursoManager?codigo=${curso.cdcurso}" method="post">
						<button class="btn btn-default" formaction="ListaCursoManager">Voltar</button>
						<button type="submit" class="btn btn-primary">Editar</button>
					</form>
				</div>
			</div>
			<jsp:include page="right.jsp" />
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>