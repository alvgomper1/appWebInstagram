package metodos;

import java.util.ArrayList;
import java.util.List;

public class metodos {

	public static List<String> convertirStringToList(String cadena) {
		List<String> res = new ArrayList<String>();
		String[] lineas = cadena.split("\\r\\n|\\n|\\r");
		for (int i = 0; i < lineas.length; i++) {
			res.add(lineas[i]);

		}
		return res;

	}
	
	
	public static List<String> listaSoloUsuarios(List<String> lista){
		List<String> res = new ArrayList<String>();
		for (int i = 0; i < lista.size(); i++) {
			if (lista.get(i).startsWith("Foto del perfil de")) {
				res.add(lista.get(i+1));
			}
			else {
				
			}
		}
		return res ;
		
		
		
	}
	
	
	

}
