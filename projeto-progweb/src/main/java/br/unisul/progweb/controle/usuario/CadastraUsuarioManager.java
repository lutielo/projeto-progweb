package br.unisul.progweb.controle.usuario;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/CadastraUsuarioManager")
public class CadastraUsuarioManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadastraUsuarioManager() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("acao", "Cadastro de usuário");

		RequestDispatcher view = request.getRequestDispatcher("cadastroUsuarios.jsp");
		view.forward(request, response);
	}
}