package br.unisul.progweb.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.dao.UsuarioDAO;
import br.unisul.progweb.modelo.UsuarioBean;

@WebServlet("/UsuarioBeanServlet")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UsuarioServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processoRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processoRequisicao(request, response);
	}
	
	private void processoRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioDAO usuarioDAO = new UsuarioDAO();
	
		List<UsuarioBean> result = (List<UsuarioBean>) usuarioDAO.getList();
		request.setAttribute("usuarios", result);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		
		rd.forward(request, response);
	}
}