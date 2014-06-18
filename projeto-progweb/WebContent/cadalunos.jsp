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
		<div id="header">
			<img src="images/BannerV1.jpg">
		</div>
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Active</a></li>
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Dropdown header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div id="left"></div>
			<div id="center">
				<form action="UsuarioManagerJPA" method="post">
					<fieldset style="width: 600px">
						<legend>
							<b>Cadastro de usuário TABLE</b>
						</legend>
						<table>
							<tr>
								<td align="right"><label>Nome completo: </label><input type="text" name="nomecompleto" size="50" /></td>
							</tr>
							<tr><td></td></tr>
							<tr>
								<td align="right"><label>E-mail: </label><input type="email" name="email" size="50" /></td>
							</tr>
							<tr>
								<td align="right"><label>Login: </label><input type="text" name="login" size="50" /></td>
							</tr>
							<tr>
								<td align="right"><label>Senha: </label><input type="password" name="senha" size="50" /></td>
							</tr>
							<tr>
								<td align="center">
									<%if("trocar aqui por session.getAttribute(cadastroadm) ".equals("true")){  %>
									<label>Perfil: </label>
									<select name="perfil">
										<option value="1">Admin</option>
									  	<option value="2">Aluno</option>
									  	<option value="3">Professor</option>
									</select>
									<%} else {%>
									    <input type="hidden" name="perfil" value="2"/>
									<%}%>
								</td>
							</tr>
						</table>
					</fieldset>
					<br/>
					<input type="submit" value="Cadastrar" /> 
					<input type="reset" value="Limpar" />
					<input type="button" value="Voltar" onclick="javascript:history.go(-1)" />
				</form>
				<br/><br/><br/><br/><br/><br/>
				<form action="UsuarioManagerJPA" method="post">
					<b>Cadastro de usuário TABLELESS</b><br/><br/>
					Nome completo: <input type="text" name="nomecompleto" size="50" /><br/><br/>
					E-mail: <input type="email" name="email" size="50" /><br/><br/>
					Login: <input type="text" name="login" size="50" /><br/><br/>
					Senha: <input type="password" name="senha" size="50" /><br/><br/>
					<br/>
					<%if("trocar aqui por session.getAttribute(cadastroadm)".equals("true")){  %>
					<label>Perfil:</label>
					<select name="perfil">
						<option value="1">Admin</option>
					  	<option value="2">Aluno</option>
					  	<option value="3">Professor</option>
					</select>
					<%} else {%>
					    <input type="hidden" name="perfil" value="2"/>
					<%}%>
					<br>
					<input type="submit" value="Cadastrar" /> 
					<input type="reset" value="Limpar" />
					<input type="button" value="Voltar" onclick="javascript:history.go(-1)" />
				</form>
			</div>
			<div id="right"></div>
		</div>
		<div id="footer">
			<p>Rodapé</p>
		</div>
	</div>
</body>
</html>