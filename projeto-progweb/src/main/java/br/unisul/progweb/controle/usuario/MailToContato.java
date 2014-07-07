package br.unisul.progweb.controle.usuario;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoAlunoDAO;


@WebServlet("/MailToContato")
public class MailToContato extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MailToContato() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String mailFrom = request.getParameter("email");
		String assunto = request.getParameter("assunto");
		String mensagem = request.getParameter("mensagem");
		
		
		SimpleEmail email = new SimpleEmail();
		try {
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new org.apache.commons.mail.DefaultAuthenticator("avasistema@gmail.com", "Vinicius123"));
			email.setSSLOnConnect(true);
			email.addTo("avasistema@gmail.com", "Sistema AVA");
			email.setFrom(mailFrom, nome);
			email.setSubject(assunto);
			email.setMsg(mensagem);
			email.send();
			request.getSession().setAttribute("msg", "E-mail enviado com sucesso!");
		} catch (EmailException e) {
			request.getSession()
					.setAttribute("msg", "Não foi possível processar a sua requisição, por favor tente novamente mais tarde!");
		} finally {
			response.sendRedirect("public/contatoOficial.jsp");
		}
	}
}