package metodos;

import java.util.ArrayList;
import java.util.List;

public class TextAreaToList {
	
	public static List<String> convertirStringToList(String cadena){
		List<String> res = new ArrayList<String>();
		String[] lineas = cadena.split("\\r\\n|\\n|\\r");
		for (int i = 0; i < lineas.length; i++) {
			res.add(lineas[i]);
			
		}
		return res ;
		
		
	}

}
