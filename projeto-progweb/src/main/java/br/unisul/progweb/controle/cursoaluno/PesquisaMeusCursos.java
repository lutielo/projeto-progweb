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

@WebServlet("/aluno/PesquisaMeusCursos")
public class PesquisaMeusCursos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PesquisaMeusCursos() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cdUsuario = Integer.parseInt(request.getParameter("aluno"));

		CursoAlunoDAO cursoAlunoDAO = new CursoAlunoDAO();
		
		List<Curso> listaCursos = cursoAlunoDAO.getCursosDoAluno(cdUsuario);
		
		request.setAttribute("listaCursos", listaCursos);
		
		RequestDispatcher view = request.getRequestDispatcher("aluno/listagemCursosAluno.jsp");
		view.forward(request, response);
	}
}