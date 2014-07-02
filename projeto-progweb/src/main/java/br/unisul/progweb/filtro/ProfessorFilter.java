package br.unisul.progweb.filtro;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.unisul.progweb.bean.Usuario;

@WebFilter(filterName = "ProfessorFilter", urlPatterns = "/professor/*")
public class ProfessorFilter implements Filter {

	public ProfessorFilter() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		if(usuario != null) {
			if(isAdminOUProfessor(usuario)) {
				chain.doFilter(request, response);
			}
		} else {
			session.setAttribute("msg","Você não tem permissão para visualização ou não está logado! Você não está logado no sistema!");

			((HttpServletResponse)response).sendRedirect("../public/home.jsp");
		}
	}

	private boolean isAdminOUProfessor(Usuario usuario) {
		return (1 == usuario.getPerfil().getCdperfil()) || (3 == usuario.getPerfil().getCdperfil());
	}

	public void destroy() {

	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
