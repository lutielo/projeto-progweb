package br.unisul.progweb.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FuncoesData {
	
	public static Date formataData(String data) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Date dataFormatada = null;
		try {
			if(data!=null&&(!data.equals(""))){
				dataFormatada = fmt.parse(data);
			}
		} catch (ParseException e) {
			System.err.println("QUEBROU TENTANDO FORMATAR");
			e.printStackTrace();
		}
		return dataFormatada;
	}

}
