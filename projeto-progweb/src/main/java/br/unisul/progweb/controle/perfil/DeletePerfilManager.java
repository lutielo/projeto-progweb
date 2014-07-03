package br.unisul.progweb.controle.perfil;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Perfil;
import br.unisul.progweb.dao.PerfilDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/admin/DeletePerfilManager")
public class DeletePerfilManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeletePerfilManager() {
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
		PerfilDAO perfilDAO = null;
		Perfil perfil = null;

		if (codigoString != null && !codigoString.equals("")) {
			perfilDAO = new PerfilDAO();
			Integer codigo = Integer.parseInt(codigoString);
			perfil = perfilDAO.getSinglePerfil(codigo);
			perfilDAO.delete(perfil);
			response.sendRedirect("/admin/ListaPerfilManager");
		}
	}
}
