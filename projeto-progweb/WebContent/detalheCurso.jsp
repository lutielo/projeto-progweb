<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<c:if test="${enviou == true}">
					<div class="alert alert-dismissable alert-success">
					  <button type="button" class="close" data-dismiss="alert">�</button>
					  <strong><img src="images/Accept-32.png" alt="Excluir" height="20" width="20"></strong> Arquivo enviado com sucesso.
					</div>
				</c:if>
				
				<c:if test="${enviou == false}">
					<div class="alert alert-dismissable alert-danger">
					  <button type="button" class="close" data-dismiss="alert">�</button>
					  <strong>Erro!</strong> N�o foi poss�vel fazer o upload do seu arquivo.
					</div>
				</c:if>
				
				<div class="col-lg-15">
					<div class="well bs-component">
						<h3 align="left">Curso:</h3>
						<h5 align="left">${curso.decurso}<br/>
						<div class="col-xs-15"><hr></div>
						
						<h3 align="left">Professor:</h3>
						<h5 align="left">${professor.nmusuario}<br/>
						<div class="col-xs-15"><hr></div>
						
						<h3 align="left">Per�odo:</h3>
						<h5 align="left">
						De: <fmt:formatDate value="${curso.dtinicio}" pattern="dd/MM/yyyy"/>
						&nbsp;&nbsp;&nbsp;At�:<fmt:formatDate value="${curso.dtfim}" pattern="dd/MM/yyyy"/><br/>
						<div class="col-xs-15"><hr></div>
						
						<h3 align="left">Ementa:</h3>
						<p>${curso.deementa}
					</div>
					
					<div class="col-lg-15">
						<div class="well bs-component">
							<h1>Aulas</h1>
							<hr>
							<table class="table table-striped table-hover ">
							  <thead>
								<tr>
									<th>Descri��o</th>
									<th>Download</th>
								</tr>
							  </thead>
							  <tbody>
								<c:forEach var="aula" items="${listaFileArquivos}">
									<tr>
										<td>${aula.name}</td>
										<td align="center"><a href="DownloadFileServlet?filename=${aula}"><img src="images/Download.png" alt="Excluir" height="20" width="20"></a></td>
									</tr>
								</c:forEach>
							  </tbody>
							</table>
						</div>
					</div>
					
					<div class="col-lg-15">
						<div class="well bs-component">
							<form class="form-horizontal" action="Upload?codigo=${curso.cdcurso}" method="post" name="form" enctype="multipart/form-data">
						        <fieldset>
									<legend>Uploads de arquivos para o curso</legend>
							        Upload: <input type="file" name="arquivo" /><br />
							        <input type="submit" class="btn btn-primary" name="enviar" value="Enviar" />
			        			</fieldset>
							</form>
						</div>
					</div>
					
					<form class="form-horizontal" action="AlteraCursoManager?codigo=${curso.cdcurso}" method="post">
						<button class="btn btn-default" formaction="ListaCursoManager">Voltar</button>
						<button type="submit" class="btn btn-primary">Editar</button>
					</form>
				</div>
			</div>
			<jsp:include page="right.jsp" />
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>