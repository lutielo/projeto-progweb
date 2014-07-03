package br.unisul.progweb.controle.perfil;

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
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.PerfilDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/admin/PerfilManagerJPA")
public class PerfilManagerJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
		
		String codigo = request.getParameter("codigo");
		String descricao = request.getParameter("descricao");
		
		System.out.println(codigo + " " + descricao);
		
		PerfilDAO perfilDAO = new PerfilDAO();
		
		if(codigo == null){
			System.out.println("codigo == null");
			Perfil perfil = new Perfil(descricao);
			perfilDAO.insert(perfil);
		} else {
			System.out.println("else");
			Integer codigoInt = Integer.parseInt(codigo);
			Perfil perfil = new Perfil(codigoInt, descricao);
			perfilDAO.update(perfil);
		}
		response.sendRedirect("/admin/ListaPerfilManager");

}

}
