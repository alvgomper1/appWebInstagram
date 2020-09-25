package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metodos.metodos;

@WebServlet("/RecibirTXT")
public class RecibirTXT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RecibirTXT() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String seguidores = request.getParameter("seguidoresTXT");						// Recibo el tesxtArea
		String seguidos = request.getParameter("seguidosTXT");
		
		if (seguidores.startsWith("Foto del perfil") && seguidos.startsWith("Foto del perfil")) {
			
		
		List<String> listaSeguidores = metodos.convertirStringToList(seguidores);		// Ya tengo el textArea convertido a List
		List<String> listaSeguidos = metodos.convertirStringToList(seguidos);
		List<String> listaSoloSeguidos = metodos.listaSoloUsuarios(listaSeguidos);
		List<String> listaSoloSeguidores = metodos.listaSoloUsuarios(listaSeguidores);	//La lista solo contiene usuarios 
																						//(los demás datos que no sirven son eliminados)
				

		System.out.println("-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.-.-.-.-.-.-.");
		System.out.println("Tienes "+listaSoloSeguidores.size()+" seguidores");
		System.out.println("Tienes "+listaSoloSeguidos.size()+" seguidos");
		
		request.setAttribute("seguidores", listaSoloSeguidos);			// A la variable seguidores, le paso la lista de seguidores"
		request.setAttribute("seguidos", listaSoloSeguidos);			// A la variable seguidos, le paso la lista de seguidos"

	}
		else {
			request.setAttribute("errorFormato", "La lista introducida no cumple el formato");	
			System.out.println("La lista introducida no cumple el formato");
			
		}
		request.getRequestDispatcher("/miPerfil.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
