package br.unisul.progweb.controle.curso;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Cursoarquivo;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoArquivoDAO;
import br.unisul.progweb.dao.CursoDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/professor/CursosDoProfessorManager")
public class CursosDoProfessorManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CursosDoProfessorManager() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		List<Curso> listaCursos = new ArrayList<Curso>();
		
		Usuario professor = (Usuario) request.getSession().getAttribute("usuario");
		
		ListaCursoPorTipoJPA listaCursoPorTipoJPA = new ListaCursoPorTipoJPA();
		listaCursos = listaCursoPorTipoJPA.getListCursoEmAndamentoPorProfessor(professor);
		
		request.setAttribute("listaCursos", listaCursos);
		
		RequestDispatcher view = request.getRequestDispatcher("../public/listagemCurso.jsp");
		view.forward(request, response);
	}
}