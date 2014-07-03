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
							<td align="center"><a href="${pageContext.request.contextPath}/admin/AlteraPerfilManager?codigo=${perfil.cdperfil}"><img src="${pageContext.request.contextPath}/images/Edit.png" alt="Editar" height="20" width="20"></a></td>
							<td align="center"><a href="${pageContext.request.contextPath}/admin/DeletePerfilManager?codigo=${perfil.cdperfil}"><img src="${pageContext.request.contextPath}/images/Trash.png" alt="Excluir" height="20" width="20"></a></td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>