package br.unisul.progweb.controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Perfil;
import br.unisul.progweb.bean.Perfilacesso;
import br.unisul.progweb.bean.PerfilacessoId;
import br.unisul.progweb.dao.PerfilAcessoDAO;

@WebServlet("/PerfilAcessoManagerJPA")
public class PerfilAcessoManagerJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {

		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		
		Perfil myPerfil = new Perfil();
		myPerfil.setCdperfil(3);
		
		Perfilacesso perfilacesso = new Perfilacesso();
		perfilacesso.setId(new PerfilacessoId((short) 3, "/all"));
		perfilacesso.setPerfil(myPerfil);
		
		PerfilAcessoDAO perfilAcessoDAO = new PerfilAcessoDAO();
		perfilAcessoDAO.insert(perfilacesso);

		List result = perfilAcessoDAO.getList();
		//AQUI TEM ALGUM PROBLEMA PARA LISTAR. MAS ESTAMOS NO METODO DE INSERÇÃO.
		//NOS PREOCUPAMOS COM ISSO MAIS PRA FRENTE.
//		for (PerfilacessoId perfilAcesso : (List<PerfilacessoId>) result) {
//			System.out.println("PerfilAcesso (" + perfilAcesso.getCdperfil() + " /" +  perfilAcesso.getDeurl());
//		}
	}

}
