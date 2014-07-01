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
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoAlunoDAO;
import br.unisul.progweb.dao.CursoDAO;

@WebServlet("/MailToAlunosCurso")
public class MailToAlunosCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MailToAlunosCurso() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int cdCurso = Integer.parseInt(request.getParameter("codigo"));
	
		CursoAlunoDAO cursoAlunoDAO = new CursoAlunoDAO();
		List<Usuario> listaUsuarios = cursoAlunoDAO.getAlunosDoCurso(cdCurso);
		
		String mailAlunos = concatMailAlunos(listaUsuarios);
		
		request.setAttribute("mails", mailAlunos);
		
		RequestDispatcher view = request.getRequestDispatcher("confirmaEnvioMail.jsp");
		view.forward(request, response);
	}

	private String concatMailAlunos(List<Usuario> listaUsuarios) {
		String mailAlunos = "";
		
		for(Usuario usuario : listaUsuarios) {
			mailAlunos += usuario.getDeemail() + ", ";
		}
		return mailAlunos;
	}
}
