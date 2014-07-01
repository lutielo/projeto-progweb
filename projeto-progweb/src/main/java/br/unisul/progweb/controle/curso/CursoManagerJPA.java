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
			criaPastaCurso(deCurso);
		} else {
			System.out.println("else");
			Integer codigoInt = Integer.parseInt(codigo);
			Curso cursoTela = new Curso(codigoInt, professor, deCurso, deEmenta, dataInicioFormatada, dataFimFormatada);
			Curso cursoBanco = cursoDAO.getSingleCurso(codigoInt);
			cursoDAO.update(cursoTela);
			
			alteraNomePasta(cursoTela, cursoBanco);
		}
		
		response.sendRedirect("ListaCursoManager");	
		
		//rapha
		//List result = cursoDAO.getListCursoEmAndamentoPorAluno(new Date(),new Date(), (short)3);
		//List result = cursoDAO.getListPesquisaCurso("al");
		//for (Curso c : (List<Curso>) result) {
		//	System.out.println("Event (" + c.getCdcurso() + ") : "	+ c.getDecurso());
		//}
	}

	private void alteraNomePasta(Curso cursoTela, Curso cursoBanco) {
		if(!cursoBanco.getDecurso().equals(cursoTela.getDecurso())){
			File pastaCursoTela = new File("C:/CursosProgWeb/"+cursoTela.getDecurso()); 
			File pastaASerAlterada = new File("C:/CursosProgWeb/"+cursoBanco.getDecurso());
			if (pastaASerAlterada.exists()){
				pastaASerAlterada.renameTo(pastaCursoTela);
			} else {
				pastaCursoTela.mkdir();
			}
			System.out.println("Nome da pasta alterado :" +pastaASerAlterada.getAbsolutePath());
		}
	}

	private void criaPastaCurso(String deCurso) {
		File pastaRaiz = new File("C:/CursosProgWeb"); 
		if (!pastaRaiz.exists()){ 
			pastaRaiz.mkdir(); 
		}
		System.out.println("Pasta existe :" + pastaRaiz.getAbsolutePath());
		
		File novaSubPasta = new File("C:/CursosProgWeb/"+deCurso); 
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