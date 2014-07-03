package br.unisul.progweb.controle.usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/admin/DeleteUsuarioManager")
public class DeleteUsuarioManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteUsuarioManager() {
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
		UsuarioDAO usuarioDAO = null;
		Usuario usuario = null;

		if (codigoString != null && !codigoString.equals("")) {
			usuarioDAO = new UsuarioDAO();
			Integer codigo = Integer.parseInt(codigoString);
			usuario = usuarioDAO.getSingleUsuarioById(codigo);
			usuarioDAO.delete(usuario);
			response.sendRedirect("ListaUsuariosManager");
		}
	}
}