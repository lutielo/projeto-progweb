<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th>#</th>
				      <th>Nome</th>
				      <th>Apelido</th>
				      <th>E-Mail</th>
				      <th>Criação</th>
				      <th>Último Login</th>
				      <th>Data Nascimento</th>
				      <th>Ativo</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${usuarios}" var="usr">
				  		<tr>
				     		<td>${usr.id}</td>
						    <td>${usr.nmCompleto}</td>
					    	<td>${usr.apelido}</td>
						    <td>${usr.email}</td>
						    <td>${usr.criado}</td>
						    <td>${usr.ultimoLogin}</td>
						    <td>${usr.dtNascimento}</td>
						    <td>${usr.ativo}</td>
				   		</tr>
					</c:forEach>
				  </tbody>
				</table> 
			</div>
			<jsp:include page="right.jsp" />
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>