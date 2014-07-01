<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css"
	rel="stylesheet" />
<title>Resultados da pesquisa por cursos</title>
</head>
<body>

	<div id="container">
<!-- INSERIR AQUI -->

		<div id="content">
<!-- INSERIR AQUI -->
			<div id="center">
				<h1>Envio de e-mail</h1>
				<hr>
				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<th>Confirma</th>
							<th>Cancela</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center"><a href="mailto:${mails}" target="_top"><img src="images/Accept-32.png" alt="Envia" height="20" width="20"></a></td>
							<td align="center"><a href="PesquisaCursoAluno?codigo=${curso.cdcurso}"><img src="images/List-32.png" alt="Listar alunos" height="20" width="20"></a></td>
						</tr>
					</tbody>
				</table>
			</div>
<!-- INSERIR AQUI -->
		</div>
<!-- INSERIR AQUI -->
	</div>
</body>
</html>