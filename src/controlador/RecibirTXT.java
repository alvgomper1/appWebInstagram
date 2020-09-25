package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metodos.TextAreaToList;

@WebServlet("/RecibirTXT")
public class RecibirTXT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RecibirTXT() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String seguidores = request.getParameter("seguidoresTXT");
		String seguidos = request.getParameter("seguidosTXT");
		List<String> listaSeguidores = TextAreaToList.convertirStringToList(seguidores);		// Ya tengo el textArea convertido a List
		List<String> listaSeguidos = TextAreaToList.convertirStringToList(seguidos);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
