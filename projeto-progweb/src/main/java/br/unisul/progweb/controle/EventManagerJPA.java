package br.unisul.progweb.controle;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Event;
import br.unisul.progweb.dao.EventDAO;

@WebServlet("/EventManagerJPA")
public class EventManagerJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}
	
	private void processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Event myEvent = new Event("My Event", new Date());
		EventDAO eventDAO = new EventDAO();
		
		eventDAO.inserir(myEvent);

		List result = eventDAO.getList();
		for (Event event : (List<Event>) result) {
			System.out.println("Event (" + event.getDate() + ") : "	+ event.getTitle());
		}
	}
}