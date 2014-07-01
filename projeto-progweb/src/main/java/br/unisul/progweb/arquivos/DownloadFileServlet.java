package br.unisul.progweb.arquivos;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadFileServlet")
public class DownloadFileServlet extends HttpServlet {
	//ESTE SERVLET FAZ O DOWNLOAD DE UM ARQUIVO QUE ESTA NA MAQUINA LOCAL 
	//POR EXEMPLO "c:/Arquivos"
	
	//localhost:8080/testeUpDownloadArquivo/DownloadFileServlet?filename=nomeArquivo
	//localhost:8080/testeUpDownloadArquivo/DownloadFileServlet?filename=teste1.txt
	final String FILE_LOCATION = "C:/CursosProgWeb/TESTE PASTA NO C/";
	final String[][] contentTypes = {{"xml", "text/xml"}, {"pdf", "application/pdf"}, {"mp3","audio/mpeg"}};
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object requestObject = request.getParameter("filename");
		if (requestObject != null) {
			String fileName = (String) requestObject;
			String contentType = getContentType(fileName.split("\\.")[1]);
			File file = new File(FILE_LOCATION + "/" + fileName);
			response.setContentType(contentType);
			response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
			response.setContentLength((int) file.length());
			
			ServletOutputStream servletOutputStream = response.getOutputStream();
			BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
			int bytesRead = bufferedInputStream.read();
			while (bytesRead != -1){
				servletOutputStream.write(bytesRead);
				bytesRead = bufferedInputStream.read();
			}
			if (servletOutputStream != null) servletOutputStream.close();
			if (bufferedInputStream != null) bufferedInputStream.close();
		}
	}
	
	private String getContentType(String fileType) {
		String returnType = null;
		for (int i = 0; i < contentTypes.length; i++){
			if(fileType.equals(contentTypes[i][0])) { 
				returnType = contentTypes[i][1];
			}
		}
		return returnType;
	}

}
