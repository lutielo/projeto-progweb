package br.unisul.progweb.arquivos;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Cursoarquivo;
import br.unisul.progweb.bean.CursoarquivoId;
import br.unisul.progweb.bean.Perfilacesso;
import br.unisul.progweb.bean.PerfilacessoId;
import br.unisul.progweb.dao.CursoArquivoDAO;
import br.unisul.progweb.dao.CursoDAO;

@WebServlet("/Upload")
public class ServletUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ServletUpload() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		String codigoString = request.getParameter("codigo");
		CursoDAO cursoDAO = new CursoDAO();
		
		Integer codigo = Integer.parseInt(codigoString);
		Curso curso = cursoDAO.getSingleCurso(codigo);
		
		try {
			if (new Upload().anexos(request, response, curso)) {
				request.setAttribute("enviou", true);
				RequestDispatcher view = request.getRequestDispatcher("DetalhesCursoManager?codigo=" + curso.getCdcurso());
				view.forward(request, response);
			} else {
				request.setAttribute("enviou", false);
				RequestDispatcher view = request.getRequestDispatcher("DetalhesCursoManager?codigo=" + curso.getCdcurso());
				view.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}