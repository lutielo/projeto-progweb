package br.unisul.progweb.controle.curso;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.dao.CursoDAO;
import br.unisul.progweb.util.FuncoesData;

/**
 * Servlet implementation class PesquisaCursoJPA
 */
@WebServlet("/PesquisaAvancadaCursoJPA")
public class PesquisaAvancadaCursoJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PesquisaAvancadaCursoJPA() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		;
		String deCurso = request.getParameter("descricao");
		String cdProfessor = request.getParameter("professor");
		Date dataInicioFormatada = FuncoesData.formataData(request.getParameter("dataInicio"));
		Date dataFimFormatada = FuncoesData.formataData(request.getParameter("dataFim"));
		Integer professor = null;
		if(cdProfessor!=null){
			professor = Integer.parseInt(cdProfessor);
		}
		
		System.out.println(deCurso);
		System.out.println(cdProfessor);
		System.out.println(dataInicioFormatada);
		System.out.println(dataFimFormatada);
		
		CursoDAO cursoDAO = new CursoDAO();
		List<Curso> curso = cursoDAO.getListPesquisaCursoAvancada(deCurso, dataInicioFormatada, dataFimFormatada, professor);

		request.setAttribute("lista", curso);
		
		RequestDispatcher view = request.getRequestDispatcher("resultadoPesquisaCurso.jsp");
		view.forward(request, response);
	}

}
