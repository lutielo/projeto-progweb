<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
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
			
		<c:choose>
 			<c:when test="${sessionScope.usuario.perfil.deperfil == 'administrador'}">
	   	 		<jsp:include page="${pageContext.request.contextPath}/../admin/menuAdmin.jsp" />
	   		</c:when>
	
		    <c:when test="${sessionScope.usuario.perfil.deperfil == 'professor'}">
		   		<jsp:include page="${pageContext.request.contextPath}/../professor/menuProfessor.jsp" />
		    </c:when>
		    
		    <c:when test="${sessionScope.usuario.perfil.deperfil == 'aluno'}">
		  		<jsp:include page="${pageContext.request.contextPath}/../aluno/menuAluno.jsp" />
		    </c:when>
		    
   		    <c:when test="${empty sessionScope.usuario}">
		  		<jsp:include page="${pageContext.request.contextPath}/../public/menuPublic.jsp" />
		    </c:when>
		</c:choose>
		
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h1>Lista de usuários</h1>
						<hr>
						<table class="table table-striped table-hover ">
						  <thead>
							<tr>
								<th width="60">Código</th>
								<th>Nome</th>
								<th>Login</th>
								<th>Email</th>
								<th>Perfil</th>
								<th colspan="2">Ações</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach var="usuario" items="${listaUsuarios}">
								<tr>
									<td>${usuario.cdusuario}</td>
									<td>${usuario.nmusuario}</td>
									<td>${usuario.delogin}</td>
									<td>${usuario.deemail}</td>
									<td>${usuario.perfil.deperfil}</td>
									<td align="center"><a href="${pageContext.request.contextPath}/AlteraUsuarioManager?codigo=${usuario.cdusuario}"><img src="${pageContext.request.contextPath}/images/Edit.png" alt="Editar" height="20" width="20"></a></td>
									<td align="center"><a href="${pageContext.request.contextPath}/DeleteUsuarioManager?codigo=${usuario.cdusuario}"><img src="${pageContext.request.contextPath}/images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
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