<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="../bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="../bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
<link rel="icon" type="image/png" href="../images/favicon.ico" />
<title>Projeto Unisul</title>
</head>
<body>
	<jsp:useBean id="lista" class="br.unisul.progweb.controle.curso.ListaCursoPorTipoJPA" scope="request" />
	<div id="center">
		<h1>Cursos em andamento por aluno</h1>
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
				<c:forEach var="curso" items="${lista.listCursoEmAndamentoPorAluno}">
					<tr>
						<td align="center"><a
							href="DetalhesCursoManager?codigo=${curso.cdcurso}">${curso.decurso}</a></td>
						<td>${curso.dtinicio}</td>
						<td>${curso.dtfim}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>