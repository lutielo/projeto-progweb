<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
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
	<div id="container">
		<div id="header">
			<img src="${pageContext.request.contextPath}/images/BannerV1.jpg">
		</div>
		
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h1 align="left">Lista completa de perfis</h1>
						<hr>
						<table class="table table-striped table-hover ">
						  <thead>
							<tr>
								<th width="60">Código</th>
								<th width="100%">Descrição</th>
								<th width="60">Ações</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach var="perfil" items="${lista}">
								<tr>
									<td width="60">${perfil.cdperfil}</td>
									<td width="100%">${perfil.deperfil}</td>
									<td align="center" width="30"><a href="${pageContext.request.contextPath}/admin/AlteraPerfilManager?codigo=${perfil.cdperfil}"><img src="${pageContext.request.contextPath}/images/Edit.png" alt="Editar" height="20" width="20"></a></td>
									<td align="center" width="30"><a href="${pageContext.request.contextPath}/admin/DeletePerfilManager?codigo=${perfil.cdperfil}"><img src="${pageContext.request.contextPath}/images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>