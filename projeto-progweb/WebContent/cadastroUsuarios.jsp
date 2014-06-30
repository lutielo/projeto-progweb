<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<div class="col-lg-15">
					<div class="well bs-component">
						<form class="form-horizontal" action="UsuarioManagerJPA" method="post">
							<fieldset>
								<legend>${acao}</legend>
								<c:if test="${not empty usuario.cdusuario}">
									<div class="form-group">
										<label for="inputCodigo" class="col-lg-2 control-label">Codigo:</label>
										<div class="col-lg-2">
											<input type="text" name="codigo" class="form-control" id="inputCodigo" value="${usuario.cdusuario}" readonly>
										</div>
									</div>
								</c:if>
								<div class="form-group">
									<label for="inputNome" class="col-lg-2 control-label">Nome:</label>
									<div class="col-lg-10">
										<input type="text" name="nomecompleto" class="form-control" id="inputNome" placeholder="Fulano da Silva" value="${usuario.nmusuario}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail" class="col-lg-2 control-label">Email:</label>
									<div class="col-lg-10">
										<input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email" value="${usuario.deemail}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputLogin" class="col-lg-2 control-label">Login:</label>
									<div class="col-lg-10">
										<input type="text" name="login" class="form-control" id="inputLogin" placeholder="Login" value="${usuario.delogin}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputSenha" class="col-lg-2 control-label">Senha:</label>
									<div class="col-lg-10">
										<input type="password" name="senha" class="form-control" id="inputSenha" placeholder="Senha" value="${usuario.desenha}">
									</div>
								</div>
								<%if("trocar aqui por session.getAttribute(cadastroadm)".equals("true")){  %>
								<div class="form-group">
									<label for="select" class="col-lg-2 control-label">Perfil:</label>
									<div class="col-lg-10">
										<select class="form-control" name="perfil" id="perfil">
											<option value="1">Admin</option>
											<option value="2">Aluno</option>
											<option value="3">Professor</option>
										</select>
									</div>
								</div>
								<%} else {%>
								    <input type="hidden" name="perfil" value="2"/>
								<%}%>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button class="btn btn-default" onclick="javascript:history.go(-1)">Voltar</button>
										<button type="reset" class="btn btn-default">Limpar</button>
										<button type="submit" class="btn btn-primary">Salvar</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<jsp:include page="right.jsp" />
		</div>
		
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>