<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="header">
	<img src="images/BannerV1.jpg">
</div>
<div class="navbar navbar-default">
	<div class="navbar-collapse collapse navbar-responsive-collapse">
		<ul class="nav navbar-nav">
			<li><a href="lsitaCursosDisponiveis.jsp">Cursos Disponíveis</a></li>
		</ul>
		<c:if test="${empty usuario}">
		<form name="loginForm" class="navbar-form navbar-right" action="PerfilAcessoManagerJPA" method="get">
			<ul class="nav navbar-nav">
				<li><input type="text" name="login" placeholder="Login" class="form-control col-lg-8"></li>
				<li class="divider">&nbsp;&nbsp;&nbsp;</li>
				<li><input type="password" name="senha" placeholder="Senha" class="form-control col-lg-8"></li>
				<li class="divider">&nbsp;&nbsp;&nbsp;</li>
				<li><input type="submit" value="Entrar" class="btn btn-primary" /></li>
			</ul>
		</form>
			<form class="navbar-form navbar-left"  action="PesquisaCursoJPA" method="post">
			     <fieldset>
                        <input type="text" name="descricao" class="form-control" id="inputDescricao" placeholder="Qual curso você deseja?">
				     <div class="form-group">
				 	    <div class="col-lg-10 col-lg-offset-2">
						    <button type="submit" class="btn btn-primary">Pesquisar</button>
					    </div>
					</div>
			    </fieldset>
            </form>
		</c:if>
	</div>
</div>

<!-- EXEMPLO PARA MENU
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
 -->