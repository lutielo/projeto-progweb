package br.unisul.progweb.controle;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Event;
import br.unisul.progweb.dao.CursoDAO;

@WebServlet("/CursoManagerJPA")
public class CursoManagerJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Curso curso = new Curso();
		curso.setDecurso("Curso Teste JPA");
		curso.setDeementa("Curso Teste JPA");
		curso.setDtinicio(new Date());
		curso.setDtfim(new Date());
		CursoDAO cursoDAO = new CursoDAO();
		
		cursoDAO.inserir(curso);

		List result = cursoDAO.getList();
		for (Event event : (List<Event>) result) {
			System.out.println("Event (" + event.getDate() + ") : "	+ event.getTitle());
		}
	}
}