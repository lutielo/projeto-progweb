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
		<div id="header">
			<img src="${pageContext.request.contextPath}/images/BannerV1.jpg">
		</div>		
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<form class="form-horizontal" action="${pageContext.request.contextPath}/admin/PerfilManagerJPA" method="post">
							<fieldset>
								<legend>Cadastro de perfil</legend>
								<c:if test="${not empty perfil.cdperfil}">
									<div class="form-group">
										<label for="inputCodigo" class="col-lg-2 control-label">Codigo:</label>
										<div class="col-lg-10">
											<input type="text" name="codigo" class="form-control" id="inputCodigo" value="${perfil.cdperfil}" readonly>
										</div>
									</div>
								</c:if>
								<div class="form-group">
									<label for="inputDescricao" class="col-lg-2 control-label">Descrição: *</label>
									<div class="col-lg-10">
										<input type="text" name="descricao" class="form-control" id="inputDescricao" placeholder="admin" value="${perfil.deperfil}" required>
									</div>
								</div>	
								<h5 align="left">* campos obrigatórios</h5>					
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="reset" class="btn btn-default">Limpar</button>
										<button type="submit" class="btn btn-primary">Salvar</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>	
			</div>
			<div id="right"></div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>