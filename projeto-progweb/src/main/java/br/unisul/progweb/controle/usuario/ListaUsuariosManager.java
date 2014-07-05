package br.unisul.progweb.controle.usuario;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/admin/ListaUsuariosManager")
public class ListaUsuariosManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListaUsuariosManager() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		List<Usuario> listaUsuarios = usuarioDAO.getList();

		request.setAttribute("listaUsuarios", listaUsuarios);
		
		RequestDispatcher view = request.getRequestDispatcher("listagemUsuarios.jsp");
		view.forward(request, response);
	}
}