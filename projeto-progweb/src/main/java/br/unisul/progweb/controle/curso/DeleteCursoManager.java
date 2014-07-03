package br.unisul.progweb.controle.curso;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/admin/DeleteCursoManager")
public class DeleteCursoManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteCursoManager() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		String codigoString = request.getParameter("codigo");
		CursoDAO cursoDAO = null;
		Curso curso = null;

		if (codigoString != null && !codigoString.equals("")) {
			cursoDAO = new CursoDAO();
			Integer codigo = Integer.parseInt(codigoString);
			curso = cursoDAO.getSingleCurso(codigo);
			cursoDAO.delete(curso);
			response.sendRedirect("ListaCursoManager");
		}
	}
}