package br.unisul.progweb.controle.usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Perfil;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.PerfilDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/UsuarioManagerJPA")
public class UsuarioManagerJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("codigo");
		String nome = request.getParameter("nomecompleto");
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String cdPerfil = request.getParameter("perfil");
		
		PerfilDAO perfilDAO = new PerfilDAO();
		Perfil perfil = perfilDAO.getSinglePerfil(Integer.parseInt(cdPerfil));
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		if(codigo == null){
			Usuario usuario = new Usuario(perfil, nome, login, senha, email);
			usuarioDAO.insert(usuario);
		} else {
			Integer codigoInt = Integer.parseInt(codigo);
			Usuario usuario = new Usuario(codigoInt, perfil, nome, login, senha, email);
			usuarioDAO.update(usuario);
		}
		
		//Código do lutielo
		Usuario usuarioLuti = usuarioDAO.getSingleUsuarioByLogin(login);
		if(usuarioLuti.getDesenha().equals(senha)) {
			System.out.println("Senha OK");
		}
		
		response.sendRedirect("ListaUsuariosManager");
	}
}