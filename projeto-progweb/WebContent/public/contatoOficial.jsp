<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="../bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="../bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
<link rel="icon" type="image/png" href="../images/favicon.ico" />
<title>Contato</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<img src="../images/BannerV1.jpg">
		</div>
		<jsp:include
			page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		<div id="left"></div>
		<div id="center">
			<c:if test="${not empty sessionScope.msg}">
				<div class="alert alert-dismissable alert-info">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>${sessionScope.msg}</strong>
					<%session.setAttribute("msg", null);%>
				</div>
			</c:if>
			<div class="col-lg-15">
				<div class="well bs-component">
					<h2 align="left">Contato</h2>
					<div class="col-xs-15">
						<hr>
					</div>
					<p>
						Para entrar em contato preencha o formulário abaixo ou envie um e-mail para avasistema@gmail.com <br>
						<br>
					<form class="form-horizontal" name="formulario"
						action="${pageContext.request.contextPath}/MailToContato"
						method="post">
						<div class="form-group">
							<label for="inputNome" class="col-lg-2 control-label">Nome:
								*</label>
							<div class="col-lg-10">
								<input type=text name="nome" class="form-control" id="inputNome"
									placeholder="Bilbo Baggins" autofocus required="required"><br>
							</div>

							<label for="inputEmail" class="col-lg-2 control-label">Email: *</label>
							<div class="col-lg-10">
								<input type=text name="email" class="form-control"
									id="inputEmail" placeholder="bilbo@baggins.com.br"
									required="required"><br>
							</div>

							<label for="inputAssunto" class="col-lg-2 control-label">Assunto: *</label>
							<div class="col-lg-10">
								<input type=text name="assunto" class="form-control"
									id="inputAssunto" required="required"><br>
							</div>

							<label for="textArea" class="col-lg-2 control-label">Mensagem: *</label>
							<div class="col-lg-10">
								<textarea class="form-control" name="mensagem" rows="7"
									id="textMensagem" required="required"></textarea>
								<br>
							</div>

							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default">Limpar Formulário</button>
								<button type="submit" class="btn btn-primary">Enviar Email</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="right"></div>
	</div>
	<div id="footer"></div>
</body>
</html>