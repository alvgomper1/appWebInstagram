package controlador;

import java.io.IOException;
import java.util.ArrayList;
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
		List<String> mutuos = new ArrayList<String>();
		List<String> noMeSigue = new ArrayList<String>();
		List<String> noLoSigo = new ArrayList<String>();
		
		String seguidores = request.getParameter("seguidoresTXT"); // Recibo el textArea
		String seguidos = request.getParameter("seguidosTXT");

		if (seguidores.startsWith("Foto del perfil") && seguidos.startsWith("Foto del perfil")) {

			List<String> listaSeguidores = metodos.convertirStringToList(seguidores); // Ya tengo el textArea convertido
																						// a List
			List<String> listaSeguidos = metodos.convertirStringToList(seguidos);
			List<String> listaSoloSeguidos = metodos.listaSoloUsuarios(listaSeguidos);
			List<String> listaSoloSeguidores = metodos.listaSoloUsuarios(listaSeguidores); // La lista solo contiene
																							// usuarios
																							// (los demás datos que no
																							// sirven son eliminados)

			
			for (int i = 0; i < listaSoloSeguidos.size() - 1; i++) {		// crea la lista de mutuos y noMeSigue

				String seguido = listaSoloSeguidos.get(i);
				if (listaSoloSeguidores.contains(seguido)) {

					mutuos.add(seguido);

				} else {
					noMeSigue.add(seguido);
				}

			}

			for (int i = 0; i < listaSoloSeguidores.size() - 1; i++) {		//crea la lista de noLoSigo
				String seguidor = listaSoloSeguidores.get(i);
				if (listaSoloSeguidos.contains(seguidor)) {

				}

				else {
					noLoSigo.add(seguidor);
				}
			}



			request.setAttribute("seguidores", listaSoloSeguidos); // A la variable seguidores, le paso la lista de
																	// seguidores"
			request.setAttribute("seguidos", listaSoloSeguidos); // A la variable seguidos, le paso la lista de
																	// seguidos"
			request.setAttribute("noLoSigo", noLoSigo);
			request.setAttribute("noMeSigue", noMeSigue);
			request.setAttribute("mutuos", mutuos);

//			System.out.println("No sigo a:");
//			System.out.println(noLoSigo);
//			System.out.println("No me siguen:");
//			System.out.println(noMeSigue);
//			System.out.println("Seguidores mutuos:");
//			System.out.println(mutuos);
		} else {																			
			request.setAttribute("errorFormato", "La lista introducida no cumple el formato");// si pongo mal el formato en el textArea, me
																							// dice que esta mal, y me vuelve a redirigir para
																							// introducirlo de nuevo
			System.out.println("La lista introducida no cumple el formato");

		}
		request.getRequestDispatcher("/miPerfil.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
