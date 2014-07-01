<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<title>Listagem de perfil</title>
</head>
<body>

	<div id="container">
<!-- 	INCLUIR AQUI -->
		
		<div id="content">
<!-- 	INCLUIR AQUI -->
			<div id="center">
				<h1>Lista completa de perfil</h1>
				<hr>
				<table class="table table-striped table-hover ">
				  <thead>
					<tr>
						<th width="60">Código</th>
						<th>Descrição</th>
					</tr>
				  </thead>
				  <tbody>
					<c:forEach var="perfil" items="${lista}">
						<tr>
							<td>${perfil.cdperfil}</td>
							<td>${perfil.deperfil}</td>
							<td align="center"><a href="AlteraPerfilManager?codigo=${perfil.cdperfil}"><img src="images/Edit.png" alt="Editar" height="20" width="20"></a></td>
							<td align="center"><a href="DeletePerfilManager?codigo=${perfil.cdperfil}"><img src="images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
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