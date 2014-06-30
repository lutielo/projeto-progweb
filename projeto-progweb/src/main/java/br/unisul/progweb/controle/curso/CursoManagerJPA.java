package br.unisul.progweb.controle.curso;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.dao.CursoDAO;
import br.unisul.progweb.dao.UsuarioDAO;

@WebServlet("/CursoManagerJPA")
public class CursoManagerJPA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processaRequisicao(request, response);
	}

	private void processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("codigo");
		String deCurso = request.getParameter("descricao");
		String cdProfessor = request.getParameter("professor");
		Date dataInicioFormatada = formataData(request.getParameter("dataInicio"));
		Date dataFimFormatada = formataData(request.getParameter("dataFim"));
		String deEmenta = request.getParameter("ementa");
		
		System.out.println(codigo+ " / " +deCurso+ " / " +cdProfessor+ " / " +dataInicioFormatada+ " / " +dataFimFormatada+ " / " +deEmenta);

		CursoDAO cursoDAO = new CursoDAO();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario professor = usuarioDAO.getSingleUsuarioById(Integer.parseInt(cdProfessor));
		
		if(codigo == null){
			System.out.println("codigo == null");
			Curso curso = new Curso(professor, deCurso, deEmenta, dataInicioFormatada, dataFimFormatada);
			cursoDAO.insert(curso);
		} else {
			System.out.println("else");
			Integer codigoInt = Integer.parseInt(codigo);
			Curso curso = new Curso(codigoInt, professor, deCurso, deEmenta, dataInicioFormatada, dataFimFormatada);
			cursoDAO.update(curso);
		}
		
		//TODO CRIAR PASTA NO PROJETO COM NOME DO CURSO 
		//E EDITAR O NOME QUANDO FOR ALTERADO O NOME DO CURSO
		criaPastaCurso(deCurso);
		
		response.sendRedirect("ListaCursoManager");	
		
		//rapha
		//List result = cursoDAO.getListCursoEmAndamentoPorAluno(new Date(),new Date(), (short)3);
		//List result = cursoDAO.getListPesquisaCurso("al");
		//for (Curso c : (List<Curso>) result) {
		//	System.out.println("Event (" + c.getCdcurso() + ") : "	+ c.getDecurso());
		//}
	}

	private void criaPastaCurso(String deCurso) {
		//System.getProperty("user.dir") 
		String caminhoAtual = new File("").getAbsolutePath();  
		File pastaRaiz = new File("Cursos"); 
		if (!pastaRaiz.exists()){ 
			pastaRaiz.mkdir(); 
		}
		System.out.println("Pasta existe :" + pastaRaiz.getAbsolutePath());
		
		File novaSubPasta = new File("Cursos/"+deCurso); 
		if (!novaSubPasta.exists()){
			novaSubPasta.mkdir();
		}
		System.out.println("Pasta existe :" +novaSubPasta.getAbsolutePath());
	}

	private Date formataData(String data) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Date dataFormatada = null;
		try {
			dataFormatada = fmt.parse(data);
		} catch (ParseException e) {
			System.err.println("QUEBROU TENTANDO FORMATAR");
			e.printStackTrace();
		}
		return dataFormatada;
	}
}