<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-default">

	<div class="navbar-collapse collapse navbar-responsive-collapse">
		<ul class="nav navbar-nav">
			<!-- MENU PARA ADMINISTRADORES -->
			<c:if test="${sessionScope.usuario.perfil.deperfil == 'administrador'}">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/adminHome.jsp"">Inicial</a>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Cadastros <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/CadastraUsuarioManager">Usuário</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/CadastraCursoManager">Curso</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/cadastroPerfil.jsp">Perfil</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Listagens <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/admin/ListaUsuariosManager">Usuários</a></li>
						<li><a href="${pageContext.request.contextPath}/professor/ListaCursoManager">Cursos</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/ListaPerfilManager">Perfis</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Cursos <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/public/listaCursosEmAndamento.jsp">Em andamento</a></li>
						<li><a href="${pageContext.request.contextPath}/public/listaCursosDisponiveis.jsp">Disponíveis</a></li>
						<li><a href="${pageContext.request.contextPath}/public/PesquisaCurso.jsp">Pesquisa</a></li>
						<li><a href="${pageContext.request.contextPath}/IniciarPesquisaAvancadaCursoJPA">Pesquisa avançada</a></li>
					</ul>
				</li>
			</c:if>
			
			<!-- MENU PARA PROFESSORES -->
			<c:if test="${sessionScope.usuario.perfil.deperfil == 'professor'}">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/professor/professorHome.jsp"">Inicial</a>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Listagens <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/professor/ListaCursoManager">Cursos</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Cursos <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/professor/CursosDoProfessorManager?usuario=${sessionScope.usuario}">Meus cursos</a></li>
						<li><a href="${pageContext.request.contextPath}/public/listaCursosEmAndamento.jsp">Em andamento</a></li>
						<li><a href="${pageContext.request.contextPath}/public/listaCursosDisponiveis.jsp">Disponíveis</a></li>
						<li><a href="${pageContext.request.contextPath}/public/PesquisaCurso.jsp">Pesquisa</a></li>
						<li><a href="${pageContext.request.contextPath}/IniciarPesquisaAvancadaCursoJPA">Pesquisa avançada</a></li>
					</ul>
				</li>
			</c:if>
			
			<!-- MENU PARA ALUNOS -->
			<c:if test="${sessionScope.usuario.perfil.deperfil == 'aluno'}">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/aluno/alunoHome.jsp"">Inicial</a>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Cursos <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/aluno/PesquisaMeusCursos?codigo=${sessionScope.usuario.cdusuario}">Meus cursos</a></li>
						<li><a href="${pageContext.request.contextPath}/public/listaCursosEmAndamento.jsp">Em andamento</a></li>
						<li><a href="${pageContext.request.contextPath}/public/listaCursosDisponiveis.jsp">Disponíveis</a></li>
						<li><a href="${pageContext.request.contextPath}/public/PesquisaCurso.jsp">Pesquisa</a></li>
						<li><a href="${pageContext.request.contextPath}/IniciarPesquisaAvancadaCursoJPA">Pesquisa avançada</a></li>
					</ul>
				</li>
			</c:if>
			
			<!-- MENU PARA CONVIDADOS -->
			<c:if test="${empty sessionScope.usuario}">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/public/home.jsp">Inicial</a>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Cursos <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/public/listaCursosEmAndamento.jsp">Em andamento</a></li>
						<li><a href="${pageContext.request.contextPath}/public/listaCursosDisponiveis.jsp">Disponíveis</a></li>
						<li><a href="${pageContext.request.contextPath}/public/PesquisaCurso.jsp">Pesquisa</a></li>
						<li><a href="${pageContext.request.contextPath}/IniciarPesquisaAvancadaCursoJPA">Pesquisa avançada</a></li>
					</ul>
				</li>
			</c:if>
			
			<!-- LINKS NO MENU PARA TODOS OS TIPOS DE PERFIL -->
			<li><a href="${pageContext.request.contextPath}/public/sobre.jsp">Sobre</a></li>
			<li><a href="${pageContext.request.contextPath}/public/contatoOficial.jsp">Contato</a></li>
		</ul>
		
		<c:if test="${empty sessionScope.usuario}">
			<form name="loginForm" action="../LoginUsuario" method="POST" class="navbar-form navbar-right">
				<ul class="nav navbar-nav">
					<li>
						<input type="text" name="login" placeholder="Login" class="form-control col-lg-8">
					</li>
					<li class="divider">&nbsp;&nbsp;&nbsp;</li>
					<li>
						<input type="password" name="senha" placeholder="Senha" class="form-control col-lg-8">
					</li>
					<li class="divider">&nbsp;&nbsp;&nbsp;</li>
					<li>
						<input type="submit" value="Entrar" class="btn btn-primary" />
					</li>
				</ul>
			</form>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="divider">&nbsp;&nbsp;&nbsp;</li>
				<li><a href="${pageContext.request.contextPath}/CadastraUsuarioManager">Criar conta</a></li>
				<li class="divider">&nbsp;&nbsp;&nbsp;</li>	
			</ul>
		</c:if>
		
		<c:if test="${not empty sessionScope.usuario}">
			<ul class="nav navbar-nav navbar-right">
				<li class="divider">&nbsp;&nbsp;&nbsp;</li>
				<li><a href="${pageContext.request.contextPath}/LogoutUsuario">Logout</a></li>
				<li class="divider">&nbsp;&nbsp;&nbsp;</li>
			</ul>
		</c:if>
	</div>
</div>