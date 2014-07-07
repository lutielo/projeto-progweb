<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="../bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="../bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
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
						<form class="form-horizontal" action="${pageContext.request.contextPath}/UsuarioManagerJPA" method="post">
							<fieldset>
								<legend>${sessionScope.acao}</legend>
								<c:if test="${not empty usuarioASerEditado.cdusuario}">
									<div class="form-group">
										<label for="inputCodigo" class="col-lg-2 control-label">Codigo:</label>
										<div class="col-lg-2">
											<input type="text" name="codigo" class="form-control" id="inputCodigo" value="${usuarioASerEditado.cdusuario}" readonly>
										</div>
									<%session.setAttribute("acao", null);%>
									</div>
								</c:if>
								<div class="form-group">
									<label for="inputNome" class="col-lg-2 control-label">Nome:</label>
									<div class="col-lg-10">
										<input type="text" name="nomecompleto" class="form-control" id="inputNome" placeholder="Fulano da Silva" value="${usuarioASerEditado.nmusuario}" autofocus required>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail" class="col-lg-2 control-label">Email:</label>
									<div class="col-lg-10">
										<input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email" value="${usuarioASerEditado.deemail}" required>
									</div>
								</div>
								<div class="form-group">
									<label for="inputLogin" class="col-lg-2 control-label">Login:</label>
									<div class="col-lg-10">
										<input type="text" name="login" class="form-control" id="inputLogin" placeholder="Login" value="${usuarioASerEditado.delogin}" required>
									</div>
								</div>
								<div class="form-group">
									<label for="inputSenha" class="col-lg-2 control-label">Senha:</label>
									<div class="col-lg-10">
										<input type="password" name="senha" class="form-control" id="inputSenha" placeholder="Senha" value="${usuarioASerEditado.desenha}" required>
									</div>
								</div>
								<c:choose>
									<c:when test="${sessionScope.usuario.perfil.deperfil == 'administrador'}">
										<div class="form-group">
											<label for="select" class="col-lg-2 control-label">Perfil:</label>
											<div class="col-lg-10">
												<select class="form-control" name="perfil" id="perfil">
													<option value="1">Admin</option>
													<option value="2" selected>Aluno</option>
													<option value="3">Professor</option>
												</select>
											</div>
										</div>
									</c:when>
									<c:otherwise>						
									    <input type="hidden" name="perfil" value="2"/>
								    </c:otherwise>
							    </c:choose>		
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