package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.classes.Aula;
import mvc.model.classes.Material;
import mvc.model.dao.AsignaturaDAO;
import mvc.model.dao.ClassroomDao;
import mvc.model.dao.Login;
import mvc.model.dao.LoginBean;

/**
 * Servlet implementation class CourseController
 */
@WebServlet("/course")
public class CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	AsignaturaDAO asignaturaDAO;
	Login logindao;
	LoginBean user;
	ClassroomDao classroomDao;
	Aula aula;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() {
    	aula = new Aula();
    	classroomDao = new ClassroomDao();
    	logindao = new Login();
    	asignaturaDAO = new AsignaturaDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession();
		try {
			if(session.getAttribute("user")!=null) {
				String username = session.getAttribute("user").toString();
				int tipo = (int)Integer.valueOf(session.getAttribute("tipo").toString());
				String user_tipo="";
				user = logindao.getUser(username, tipo);
				request.setAttribute("user", user);
				if(tipo == 1) {
					user_tipo = "Estudiante";
				} else if(tipo == 2) {
					user_tipo = "Docente";
				}
				request.setAttribute("user_tipo", user_tipo);
				listCourse(request,response,user.getId());
				
				if(request.getParameter("id")!=null) {
					GetCourseById(request,response);
					listMaterial(request,response);
				}
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("views/material.jsp");
				dispatcher.include(request, response);
				
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("views/login.jsp");
				dispatcher.include(request, response);
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void listCourse(HttpServletRequest request, HttpServletResponse response,int id)
			throws SQLException, IOException, ServletException {
		List<Aula> listTodo = asignaturaDAO.selectAllCursos(id);
		request.setAttribute("listTodo", listTodo);
	}
	
	private void GetCourseById(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int aula_id = (int)Integer.valueOf(request.getParameter("id"));
		aula = classroomDao.selectAulaById(aula_id);
		request.setAttribute("aula", aula);
	}
	
	private void listMaterial(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int aula_id = (int)Integer.valueOf(request.getParameter("id"));
		List<Material> listMaterial = classroomDao.selectMaterials(aula_id);
		request.setAttribute("listMaterial", listMaterial);
	}

}
