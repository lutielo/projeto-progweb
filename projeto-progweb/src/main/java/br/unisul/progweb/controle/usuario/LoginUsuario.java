package br.unisul.progweb.controle.usuario;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.UsuarioDAO;

/**
 * Servlet implementation class LoginUsuairo
 */
@WebServlet("/LoginUsuario")
public class LoginUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// A posição no array corresponde ao código do perfil na base de dados
	String[] perfil = {"admin/adminHome.jsp", "aluno/alunoHome.jsp", "professor/professorHome.jsp"};

    public LoginUsuario() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processar(request, response);
	}

	private void processar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usuario = request.getParameter("login");
		String senha = request.getParameter("senha");
				
		UsuarioDAO u = new UsuarioDAO();
		Usuario usuarioObj = u.getSingleUsuarioByLogin(usuario);
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		if((usuarioObj!=null)&&(usuarioObj.getDesenha().equals(senha))){
			session.setAttribute("usuario", usuarioObj);
			((HttpServletResponse)response).sendRedirect(getPaginaPorCodigoDePerfil(usuarioObj));
		}else{
			session.setAttribute("msg","Usuario ou senha incorretos.");
			((HttpServletResponse)response).sendRedirect("public/home.jsp");
		}
	}
	
	private String getPaginaPorCodigoDePerfil(Usuario usuario){
		return perfil[usuario.getPerfil().getCdperfil() - 1];
	}
	
	

}
