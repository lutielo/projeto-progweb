<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html">
<script src="../bootstrap-3.1.1/dist/js/jquery.min.js"></script>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link href="../bootstrap-3.1.1/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="../bootstrap-3.1.1/dist/js/bootstrap.js" type="text/javascript"></script>
<title>Contato</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<img src="../images/BannerV1.jpg">
		</div>
		<jsp:include page="${pageContext.request.contextPath}/../public/menuOficial.jsp" />
		<div id="left"></div>
			<div id="center">
				<div class="col-lg-15">
					<div class="well bs-component">
						<h2 align="left">Contato</h2>
						<div class="col-xs-15"><hr></div>
						<p>Para entrar em contato preencha o formulário abaixo ou envie um
							e-mail para contato@contato.com.br<br><br>
						<h5 style="color: red">ESTE FORMULÁRIO NÃO ESTÁ FUNCIONANDO
							POIS NÃO TEMOS UM SERVIDOR DE EMAILS</h5><br>
						<form class="form-horizontal" name="formulario"	action="http://scripts.redehost.com.br/formmail.aspx" method="post">
							<input type=hidden name="destino" value="contato@contato.com">
							<input type=hidden name="enviado" value="http://www.seudominio.xxx.yy/enviado.htm">

							<div class="form-group">
								<label for="inputNome" class="col-lg-2 control-label">Nome:</label>
								<div class="col-lg-10">
									<input type=text name="nome" class="form-control" id="inputNome" placeholder="Fulano da Silva" autofocus></p><br>
								</div>

								<label for="inputEmail" class="col-lg-2 control-label">Email:</label>
								<div class="col-lg-10">
									<input type=text name="email" class="form-control" id="inputEmail" placeholder="vinicius@unisul.br"></p><br>
								</div>

								<label for="inputAssunto" class="col-lg-2 control-label">Assunto:</label>
								<div class="col-lg-10">
									<input type=text name="assunto" class="form-control" id="inputAssunto"></p><br>
								</div>

								<label for="textArea" class="col-lg-2 control-label">Mensagem:</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="Mensagem" rows="7" id="textMensagem" wrap="virtual"></textarea></p><br>
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
	</div>
</body>
</html>