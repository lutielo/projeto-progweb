<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="../bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="../bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
<title>Pesquisa curso</title>
</head>
<body>
	<div id="container">
		<c:if test="${not empty sessionScope.msg}">
			<div class="alert alert-dismissable alert-info">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<strong>${sessionScope.msg}</strong>
				<%
					session.setAttribute("msg", null);
				%>
			</div>
		</c:if>
		<div id="header">
			<img src="${pageContext.request.contextPath}/images/BannerV1.jpg">
		</div>
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		<div id="content">
		<div id="left"></div>
			<div id="center">
				 <form class="navbar-form navbar-left"  action="PesquisaCursoJPA" method="post">
				     <fieldset>
                         <input type="text" name="descricao" class="form-control" id="inputDescricao" placeholder="Qual curso você deseja?"">
					     <div class="form-group">
					 	    <div class="col-lg-10 col-lg-offset-2">
							    <button type="submit" class="btn btn-primary">Pesquisar</button>
						    </div>
						</div>
				    </fieldset>
                </form>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>