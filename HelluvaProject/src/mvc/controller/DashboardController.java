package mvc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.classes.Aula;
import mvc.model.dao.AsignaturaDAO;
import mvc.model.dao.Login;
import mvc.model.dao.LoginBean;

/**
 * Servlet implementation class CurseController
 */
@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AsignaturaDAO asignaturaDAO;
	Login logindao;
	HttpSession session;
	LoginBean user;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() {
    	asignaturaDAO = new AsignaturaDAO();
    	logindao = new Login();
	}
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("action")!=null) {
			String action = request.getParameter("action");
			try {
				if(action.equalsIgnoreCase("disjoin")) {
					System.out.println("disjoining");
					System.out.println(user.getId());
					disjoinCourse(request, response);
				} else if(action.equalsIgnoreCase("join")) {
					System.out.println("joining");
					joinCourse(request, response);
				}
			} catch (SQLException ex) {
				throw new ServletException(ex);
			}
		}
		doGet(request, response);
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.println("action: "+action);
		session = request.getSession();

		try {
			if(session.getAttribute("user")!=null) {
				String username = session.getAttribute("user").toString();
				int tipo = (int)Integer.valueOf(session.getAttribute("tipo").toString());
				String user_tipo="";
				user = logindao.getUser(username, tipo);
				session.setAttribute("user_id", user.getId());
				request.setAttribute("user", user);
				request.setAttribute("user_tipo", tipo);
				if(tipo==1) {
					listCourse(request,response,user.getId());
					listNoCourse(request,response,user.getId());
				} else if(tipo==2) {
					listCourseDoc(request,response,user.getId());
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher("views/dashboard.jsp");
				dispatcher.include(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("views/login.jsp");
				dispatcher.include(request, response);
			}
			
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listCourse(HttpServletRequest request, HttpServletResponse response,int id)
			throws SQLException, IOException, ServletException {
		List<Aula> listTodo = asignaturaDAO.selectAllCursos(id);
		request.setAttribute("listTodo", listTodo);
	}
	
	private void listCourseDoc(HttpServletRequest request, HttpServletResponse response,int id)
			throws SQLException, IOException, ServletException {
		List<Aula> listTodo = asignaturaDAO.selectAllCursosDoc(id);
		request.setAttribute("listTodo", listTodo);
	}
	
	private void listNoCourse(HttpServletRequest request, HttpServletResponse response,int id)
			throws SQLException, IOException, ServletException {
		List<Aula> listNoTodo = asignaturaDAO.selectNoCursos(id);
		request.setAttribute("listNoTodo", listNoTodo);
	}
	
	private void joinCourse(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		int id_alumno = user.getId();
		int id_aula = (int)Integer.valueOf(request.getParameter("id_aula"));
		
		/*DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-mm-dd");
		LocalDate targetDate = LocalDate.parse(request.getParameter("targetDate"),df);*/
		
		asignaturaDAO.joinAula(id_alumno, id_aula);
	}
	
	private void disjoinCourse(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id_alumno = user.getId();
		int id_aula = (int)Integer.valueOf(request.getParameter("id_aula"));
		
		asignaturaDAO.outAula(id_alumno, id_aula);
	}
	
}
