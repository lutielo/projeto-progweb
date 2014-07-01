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
	//localhost:8080/testeUpDownloadArquivo/DownloadFileServlet?filename=nomeArquivo
	
	final String FILE_LOCATION = "C:/CursosProgWeb/";
	final String[][] contentTypes = {{"xml", "text/xml"}, {"pdf", "application/pdf"}, {"mp3","audio/mpeg"}};
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object requestObject = request.getParameter("filename");
		if (requestObject != null) {
			String fileCaminho = (String) requestObject;
			File file = new File(fileCaminho);
//			String contentType = getContentType(fileName.split("\\.")[1]);
//			File file = new File(FILE_LOCATION + "/" + fileName);
//			File file = new File(fileName);
			response.setContentType(file.getName());
			response.addHeader("Content-Disposition", "attachment; filename=" + file.getName());
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
