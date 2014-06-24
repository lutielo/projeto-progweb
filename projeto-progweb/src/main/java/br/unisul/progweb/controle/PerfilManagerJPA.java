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
import br.unisul.progweb.bean.Perfilacesso;
import br.unisul.progweb.bean.PerfilacessoId;
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
		
//		PerfilacessoId perfilacessoId = new PerfilacessoId((short) 1, "/all");
//		Perfilacesso perfilacesso = new Perfilacesso();
//		perfilacesso.setId(perfilacessoId);
		
		Perfil myPerfil = new Perfil("Admin TESTE");
		PerfilDAO perfilDAO = new PerfilDAO();
//		myPerfil.setPerfilacessos(perfilacesso);

		perfilDAO.insert(myPerfil);

		List result = perfilDAO.getList();
		System.out.println("TODOS");
		for (Perfil perfil : (List<Perfil>) result) {
			System.out.println("Perfil (" + perfil.getCdperfil() + " /" +  perfil.getDeperfil());
		}
		System.out.println("-----------------------");
		
		System.out.println("especifico com o codigo 3");
		Perfil perfilTeste = perfilDAO.getSinglePerfil(3);
		System.out.println("Perfil (" + perfilTeste.getCdperfil() + " /" +  perfilTeste.getDeperfil());
	}

}
