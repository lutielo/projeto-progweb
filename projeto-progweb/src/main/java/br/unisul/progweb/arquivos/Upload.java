package br.unisul.progweb.arquivos;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Cursoarquivo;
import br.unisul.progweb.bean.CursoarquivoId;
import br.unisul.progweb.dao.CursoArquivoDAO;

public class Upload {

	public boolean anexos(HttpServletRequest request, HttpServletResponse response, Curso curso) throws Exception {
		if (ServletFileUpload.isMultipartContent(request)) {
			int cont = 0;
			ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
			List fileItemsList = null;

			try {
				fileItemsList = servletFileUpload.parseRequest(request);
			} catch (FileUploadException e1) {
				e1.printStackTrace();
			}

			String optionalFileName = "";
			FileItem fileItem = null;
			Iterator it = fileItemsList.iterator();

			do {
				cont++;
				FileItem fileItemTemp = (FileItem) it.next();
				if (fileItemTemp.isFormField()) {
					if (fileItemTemp.getFieldName().equals("filename")) {
						optionalFileName = fileItemTemp.getString();
					}
				} else {
					fileItem = fileItemTemp;
				}

				if (cont != (fileItemsList.size())) {
					if (fileItem != null) {
						String fileName = fileItem.getName();
						if (fileItem.getSize() > 0) {
							if (optionalFileName.trim().equals("")) {
								fileName = FilenameUtils.getName(fileName);
							} else {
								fileName = optionalFileName;
							}

							String dirName = "C:/CursosProgWeb/"+curso.getDecurso()+"/";
							//caminho para a pasta do curso
							
							cadastraCursoArquivoNoBanco(curso, fileName);
							
							File saveTo = new File(dirName + fileName);
							try {
								fileItem.write(saveTo);
							} catch (Exception e) {

							}
						}
					}
				}
			} while (it.hasNext());
			return true;
		} else {
			return false;
		}
	}

	private void cadastraCursoArquivoNoBanco(Curso curso, String fileName) {
		CursoArquivoDAO caDAO = new CursoArquivoDAO();
		Cursoarquivo cursoArquivo = new Cursoarquivo();
		
		int codigoCursoInt = curso.getCdcurso(); 
		short codigoCursoShort = (short) codigoCursoInt;
		cursoArquivo.setId((new CursoarquivoId(codigoCursoShort, "C:/CursosProgWeb/"+curso.getDecurso()+"/"+fileName)));
		cursoArquivo.setCurso(curso);
		caDAO.insert(cursoArquivo);
	}
}