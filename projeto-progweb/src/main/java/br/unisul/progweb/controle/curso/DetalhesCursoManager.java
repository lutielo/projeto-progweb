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

@WebServlet("/DetalhesCursoManager")
public class DetalhesCursoManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetalhesCursoManager() {
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
			request.setAttribute("curso", curso);
			
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			Usuario professor = usuarioDAO.getSingleUsuarioById(curso.getUsuario().getCdusuario());
			request.setAttribute("professor", professor);
			
			CursoArquivoDAO cursoArquivoDAO = new CursoArquivoDAO();
			List<Cursoarquivo> listaCaminhosDosArquivosDoCurso = cursoArquivoDAO.getArquivosDoCurso(codigo);
			
			List<File> listaFileArquivos = new ArrayList<File>();
			
			for (Cursoarquivo arquivo : listaCaminhosDosArquivosDoCurso) {
				File file = new File(arquivo.getId().getDepatharquivo());
				listaFileArquivos.add(file);
			}
			request.setAttribute("listaFileArquivos", listaFileArquivos);
			
			RequestDispatcher view = request.getRequestDispatcher("professor/detalheCurso.jsp");
			view.forward(request, response);
		}
	}
}