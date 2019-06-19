package fast.bloc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author angrodboh
 */

@WebServlet("/admins/cyc")
public class ObtenerCycServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ObtenerCycServlet() {
		super();
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String requested = req.getParameter("nombre_usu");
		NotasDAO notas = (NotasDAO) getServletContext().getAttribute("notas");
		
		/*  
		 * 	No hace falta comprobar si usuario es admin ya que esta url esta afectada por el filtro admin.
		 *  Obtenemos ambas listas definiendo el atributo notas que representa la clase NotasDAO y está en contexto de aplicación.
		 */ 
		
		List<String> colores = notas.obtenerCategorias(requested);
		List<String> categorias = notas.obtenerColores(requested);
		List<String> errores = new ArrayList<>();
		
		//Display de errores si cualquiera de las listas estan vacias.
		
		if(colores.size() == 0) errores.add("No se han encontrado colores");
		if(categorias.size() == 0) errores.add("No se han encontrado categorías");
		
		String catjsonlist = "";
		String coljsonlist = "";
		String errjsonlist = "";
		
		for(int i=0; i < categorias.size(); i++) {
			String categoria = categorias.get(i);
			catjsonlist += "\"" + categoria + "\"";
			if(i != categorias.size()-1) catjsonlist += ",";
		}
		
		for(int i=0; i < colores.size(); i++) {
			String color = colores.get(i);
			coljsonlist += "\"" + color + "\"";
			if(i != colores.size()-1) coljsonlist += ",";
		}
		
		for(int i=0; i < errores.size(); i++) {
			String error = errores.get(i);
			errjsonlist += "\"" + error + "\"";
			if(i != errores.size()-1) errjsonlist += ",";
		}
		
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		res.getWriter().println("{ \"categorias\":[" + catjsonlist + "],\"colores\":[" + coljsonlist + "], \"errores\":[" + errjsonlist + "] }");

		
		
		
		
	}
	
	
	
	

}
