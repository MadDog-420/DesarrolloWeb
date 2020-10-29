package mvc.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.classes.Alumno;
import mvc.model.dao.AlumnoDao;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlumnoDao alumnoDao;
	
	public void init() {
		alumnoDao = new AlumnoDao();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("views/register.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		registerUser(request, response);
	}
	
	private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int dni = (int)Integer.parseInt(request.getParameter("dni"));
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String contrasena = request.getParameter("contrasena");
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-mm-dd");
		LocalDate nacimiento = LocalDate.parse(request.getParameter("nacimiento"),df);

		Alumno student = new Alumno();
		student.setDni(dni);
		student.setNombre(nombre);
		student.setApellidos(apellidos);
		student.setContrasena(contrasena);
		student.setNacimiento(nacimiento);

		try {
			int result = alumnoDao.registerAlumno(student);
			if(result == 1) {
				request.setAttribute("NOTIFICATION", "Estudiante registrado!");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("views/register.jsp");
		dispatcher.forward(request, response);
	}

}
