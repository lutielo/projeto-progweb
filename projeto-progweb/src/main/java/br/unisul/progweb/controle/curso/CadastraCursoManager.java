package br.unisul.progweb.controle.curso;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/CadastraCursoManager")
public class CadastraCursoManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadastraCursoManager() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("acao", " Cadastro de Curso");
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		List<Usuario> listaProfessores = usuarioDAO.getProfessores();

		request.setAttribute("listaProfessores", listaProfessores);

		RequestDispatcher view = request.getRequestDispatcher("admin/cadastroCurso.jsp");
		view.forward(request, response);
	}
}