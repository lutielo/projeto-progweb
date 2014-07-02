<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />

<c:choose>
    <c:when test="${sessionScope.usuario.perfil.deperfil == 'administrador'}">
    <meta http-equiv="refresh" content="0; url=http://localhost:8080/projeto-progweb/admin/adminHome.jsp" />
    </c:when>

    <c:when test="${sessionScope.usuario.perfil.deperfil == 'professor'}">
    <meta http-equiv="refresh" content="0; url=http://localhost:8080/projeto-progweb/professor/professorHome.jsp" />
    </c:when>
    
    <c:when test="${sessionScope.usuario.perfil.deperfil == 'aluno'}">
    <meta http-equiv="refresh" content="0; url=http://localhost:8080/projeto-progweb/aluno/alunoHome.jsp" />
    </c:when>
</c:choose>

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
			<img src="../images/BannerV1.jpg">
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
				<jsp:useBean id="lista" class="br.unisul.progweb.controle.curso.ListaCursoPorTipoJPA" scope="request" />
				<h1>Cursos disponíveis</h1>
				<hr>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Descrição</th>
							<th>Data inicial</th>
							<th>Data final</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="curso" items="${lista.listCursoDisponiveis}">
							<tr>
								<td align="center"><a href="${pageContext.request.contextPath}/DetalhesCursoManager?codigo=${curso.cdcurso}">${curso.decurso}</a></td>
								<td><fmt:formatDate value="${curso.dtinicio}" pattern="dd/MM/yyyy" /></td>
								<td><fmt:formatDate value="${curso.dtfim}" pattern="dd/MM/yyyy" /></td>
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