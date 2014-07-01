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
<!-- 	INCLUIR AQUI -->
		
		<div id="content">
<!-- 	INCLUIR AQUI -->
			<div id="center">
				<h1>Resultados da pesquisa por cursos</h1>
				<hr>
				<table class="table table-striped table-hover ">
				  <thead>
					<tr>
						<th>Descrição</th>
						<th>Data inicial</th>
						<th>Data final</th>
					</tr>
				  </thead>
				  <tbody>
					<c:forEach var="curso" items="${lista}">
						<tr>
							<td align="center"><a href="DetalhesCursoManager?codigo=${curso.cdcurso}">${curso.decurso}</a></td>
							<td>${curso.dtinicio}</td>
							<td>${curso.dtfim}</td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
<!-- 	INCLUIR AQUI -->
		</div>
<!-- 	INCLUIR AQUI -->
	</div>
</body>
</html>