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

@WebFilter(filterName = "AdminFilter", urlPatterns = "/admin/*")
public class AdminFilter implements Filter {

	public AdminFilter() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		if(usuario != null){
			if( 1 == usuario.getPerfil().getCdperfil()) {
				chain.doFilter(request, response);
			} else {
				session.setAttribute("msg","Você não tem permissão para visualização!");

				((HttpServletResponse)response).sendRedirect("../public/home.jsp");
			}
		} else {
			session.setAttribute("msg","Você não está logado!");
			((HttpServletResponse)response).sendRedirect("../public/home.jsp");
		}
	}

	public void destroy() {

	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
