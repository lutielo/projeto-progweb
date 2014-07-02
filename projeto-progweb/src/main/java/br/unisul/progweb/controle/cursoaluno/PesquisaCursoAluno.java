package br.unisul.progweb.controle.cursoaluno;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Cursoaluno;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoAlunoDAO;
import br.unisul.progweb.dao.CursoDAO;

@WebServlet("/PesquisaCursoAluno")
public class PesquisaCursoAluno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PesquisaCursoAluno() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cdCurso = Integer.parseInt(request.getParameter("codigo"));

		CursoAlunoDAO cursoAlunoDAO = new CursoAlunoDAO();
		CursoDAO cursoDAO = new CursoDAO();
		
		List<Usuario> listaUsuarios = cursoAlunoDAO.getAlunosDoCurso(cdCurso);
		Curso curso = cursoDAO.getSingleCurso(cdCurso);
		
		request.setAttribute("listaUsuarios", listaUsuarios);
		request.setAttribute("curso", curso.getDecurso());
		
		RequestDispatcher view = request.getRequestDispatcher("professor/listagemUsuariosPorCurso.jsp");
		view.forward(request, response);
	}
}