package br.unisul.progweb.controle.perfil;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Perfil;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.PerfilDAO;
import br.unisul.progweb.dao.UsuarioDAO;

/**
 * Servlet implementation class ListaPerfilManager
 */
@WebServlet("/admin/ListaPerfilManager")
public class ListaPerfilManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListaPerfilManager() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		PerfilDAO perfilDAO = new PerfilDAO();
		
		List<Perfil> lista = perfilDAO.getList();

		request.setAttribute("lista", lista);
		
		RequestDispatcher view = request.getRequestDispatcher("listagemPerfil.jsp");
		view.forward(request, response);
	}

}
