package br.unisul.progweb.controle;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Perfil;
import br.unisul.progweb.dao.PerfilDAO;

@WebServlet("/PerfilManagerJPA")
public class PerfilManagerJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		Perfil myPerfil = new Perfil("Admin TESTE");
		PerfilDAO perfilDAO = new PerfilDAO();

		perfilDAO.inserir(myPerfil);

		List result = perfilDAO.getList();
		for (Perfil perfil : (List<Perfil>) result) {
			System.out.println("Perfil (" + perfil.getCdperfil() + " /" +  perfil.getDeperfil());
		}
	}

}
