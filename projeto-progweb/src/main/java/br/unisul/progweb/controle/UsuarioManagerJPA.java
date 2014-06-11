package br.unisul.progweb.controle;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Event;
import br.unisul.progweb.bean.Perfil;
import br.unisul.progweb.bean.Perfilacesso;
import br.unisul.progweb.bean.PerfilacessoId;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/UsuarioManagerJPA")
public class UsuarioManagerJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Perfil myPerfil = new Perfil();
		myPerfil.setCdperfil(3);
		
		Perfilacesso perfilacesso = new Perfilacesso();
		perfilacesso.setId(new PerfilacessoId((short) 3, "/all"));
		perfilacesso.setPerfil(myPerfil);
		
		Usuario usuario = new Usuario();
		usuario.setNmusuario("userTeste");
		usuario.setPerfil(myPerfil);
		usuario.setDelogin("teste");
		usuario.setDesenha("teste");
		usuario.setDeemail("teste@teste");

		UsuarioDAO usuarioDAO = new UsuarioDAO();
		usuarioDAO.inserir(usuario);
		
		List result = usuarioDAO.getList();
		for (Event event : (List<Event>) result) {
			System.out.println("Event (" + event.getDate() + ") : "	+ event.getTitle());
		}
	}
}