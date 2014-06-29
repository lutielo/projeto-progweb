<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<title>Pesquisa curso</title>
</head>
<body>
	<div id="container">
		<jsp:include page="header.jsp" />
		
		<div id="content">
			<jsp:include page="left.jsp" />
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
			<jsp:include page="right.jsp" />
		</div>
		
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>