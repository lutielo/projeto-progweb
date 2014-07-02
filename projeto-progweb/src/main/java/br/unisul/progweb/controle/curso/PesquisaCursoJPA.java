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
import br.unisul.progweb.dao.CursoDAO;

/**
 * Servlet implementation class PesquisaCursoJPA
 */
@WebServlet("/PesquisaCursoJPA")
public class PesquisaCursoJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PesquisaCursoJPA() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		String descricao = request.getParameter("descricao");
		CursoDAO cursoDAO = new CursoDAO();
		List<Curso> curso = cursoDAO.getListPesquisaCurso(descricao);

		request.setAttribute("lista", curso);
		
		RequestDispatcher view = request.getRequestDispatcher("public/resultadoPesquisaCurso.jsp");
		view.forward(request, response);
	}

}
