<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		<c:if test="${not empty sessionScope.msg}">
			<div class="alert alert-dismissable alert-info">
	  			<button type="button" class="close" data-dismiss="alert">×</button>
	  			<strong>${sessionScope.msg}</strong>
				<%session.setAttribute("msg", null);%>
			</div>
		</c:if>
		<div id="header">
			<img src="${pageContext.request.contextPath}/images/BannerV1.jpg">
		</div>
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h1 align="left">Lista de usuários</h1>
						<hr>
						<table class="table table-striped table-hover ">
						  <thead>
							<tr>
								<th width="60">Código</th>
								<th width="100%">Nome</th>
								<th width="80">Login</th>
								<th width="90">Email</th>
								<th width="60">Perfil</th>
								<th width="60" colspan="2">Ações</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach var="usuario" items="${listaUsuarios}">
								<tr>
									<td width="60">${usuario.cdusuario}</td>
									<td width="100%">${usuario.nmusuario}</td>
									<td width="80">${usuario.delogin}</td>
									<td width="90">${usuario.deemail}</td>
									<td width="60">${usuario.perfil.deperfil}</td>
									<td align="center" width="30"><a href="${pageContext.request.contextPath}/admin/AlteraUsuarioManager?codigo=${usuario.cdusuario}"><img src="${pageContext.request.contextPath}/images/Edit.png" alt="Editar" height="20" width="20"></a></td>
									<td align="center" width="30"><a href="${pageContext.request.contextPath}/admin/DeleteUsuarioManager?codigo=${usuario.cdusuario}"><img src="${pageContext.request.contextPath}/images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
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