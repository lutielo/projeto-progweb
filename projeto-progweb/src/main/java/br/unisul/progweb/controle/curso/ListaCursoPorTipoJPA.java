package br.unisul.progweb.controle.curso;

import java.util.Date;
import java.util.List;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.dao.CursoDAO;

public class ListaCursoPorTipoJPA {
	
	public ListaCursoPorTipoJPA(){
		
	}

	public List<Curso> getListCursoDisponiveis() {
		CursoDAO cursoDAO = new CursoDAO();
		List<Curso> r= cursoDAO.getListCursoDisponiveis(new Date());
		System.out.println(r.size());
		return r;
	}
	
	public List<Curso> getListCursoEmAndamento() {
		CursoDAO cursoDAO = new CursoDAO();
		return cursoDAO.getListCursoEmAndamento(new Date(), new Date());
	}
	
	public List<Curso> getListCursoEmAndamentoPorProfessor() {
		//alterar aqui para pegar session.getatribute obtendo o cdusuario
		CursoDAO cursoDAO = new CursoDAO();
		return cursoDAO.getListCursoEmAndamentoPorProfessor(new Date(),
				new Date(), 6);
	}
	
	public List<Curso> getListCursoEmAndamentoPorAluno() {
		//alterar aqui para pegar session.getatribute obtendo o cdusuario
		CursoDAO cursoDAO = new CursoDAO();
		return cursoDAO.getListCursoEmAndamentoPorAluno(new Date(),
				new Date(), (short) 2);
	}

}
