package br.unisul.progweb.controle.cursoaluno;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Cursoaluno;
import br.unisul.progweb.bean.CursoalunoId;
import br.unisul.progweb.bean.Cursoarquivo;
import br.unisul.progweb.bean.CursoarquivoId;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoAlunoDAO;
import br.unisul.progweb.dao.CursoArquivoDAO;
import br.unisul.progweb.dao.CursoDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/CadastraAlunoNoCursoManager")
public class CadastraAlunoNoCursoManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadastraAlunoNoCursoManager() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		String codigoAluno = request.getParameter("codigoAluno");
		String codigoCurso = request.getParameter("codigoCurso");
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		int codigoAlunoInt = Integer.parseInt(codigoAluno);
		Usuario usuario = usuarioDAO.getSingleUsuarioById(codigoAlunoInt);
		
		CursoDAO cursoDAO = new CursoDAO();
		int codigoCursoInt = Integer.parseInt(codigoCurso);
		Curso curso = cursoDAO.getSingleCurso(codigoCursoInt);
		
		CursoAlunoDAO cursoAlunoDAO = new CursoAlunoDAO();
		Cursoaluno cursoaluno = new Cursoaluno();
		short codigoAlunoShort = (short) codigoAlunoInt;
		short codigoCursoShort = (short) codigoCursoInt;
		
		cursoaluno.setId((new CursoalunoId(codigoCursoShort, codigoAlunoShort)));
		cursoaluno.setCurso(curso);
		cursoaluno.setUsuario(usuario);
		
		cursoAlunoDAO.insert(cursoaluno);
		
		response.sendRedirect("DetalhesCursoManager?codigo="+codigoCursoInt);
	}
}