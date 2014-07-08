package br.unisul.progweb.controle.cursoaluno;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoAlunoDAO;
import br.unisul.progweb.dao.CursoDAO;

@WebServlet("/EnviaEmail")
public class EnviaEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EnviaEmail() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if (request.getSession().getAttribute("mails") == null) {

			int cdCurso = Integer.parseInt(request.getParameter("codigo"));

			CursoAlunoDAO cursoAlunoDAO = new CursoAlunoDAO();
			List<Usuario> listaUsuarios = cursoAlunoDAO
					.getAlunosDoCurso(cdCurso);

			CursoDAO cursoDAO = new CursoDAO();
			Curso curso = cursoDAO.getSingleCurso(cdCurso);

			List<String> mailsAlunos = concatMailAlunos(listaUsuarios);

			request.setAttribute("nomecurso", curso.getDecurso());
			request.getSession().setAttribute("mails", mailsAlunos);

			RequestDispatcher view = request.getRequestDispatcher("public/enviaEmail.jsp");
			view.forward(request, response);

		} else {
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
			String nome = usuario.getNmusuario();
			String mailFrom = usuario.getDeemail();
			String assunto = request.getParameter("assunto");
			String mensagem = request.getParameter("mensagem");

			SimpleEmail email = new SimpleEmail();
			try {
				email.setHostName("smtp.googlemail.com");
				email.setSmtpPort(465);
				email.setAuthenticator(new org.apache.commons.mail.DefaultAuthenticator("avasistema@gmail.com", "Vinicius123"));
				email.setSSLOnConnect(true);
				
				List<String> mailAlunos = (List<String>) request.getSession().getAttribute("mails");
				for(String contato : mailAlunos) {
					email.addTo(contato);
				}
				email.setFrom(mailFrom, nome);
				email.setSubject(assunto);
				email.setMsg(mensagem);
				email.send();
				request.getSession().setAttribute("msg", "E-mail enviado com sucesso!");
			} catch (EmailException e) {
				request.getSession().setAttribute("msg", "Não foi possível processar a sua requisição, por favor tente novamente mais tarde!");
			} finally {
				request.setAttribute("nomecurso", null);
				request.getSession().setAttribute("mails", null);
				response.sendRedirect("public/home.jsp");
			}
		}
	}

	private List<String> concatMailAlunos(List<Usuario> listaUsuarios) {
		List<String> mails = new ArrayList<>();

		for (Usuario usuario : listaUsuarios) {
			mails.add(usuario.getDeemail());
		}
		return mails;
	}
}
