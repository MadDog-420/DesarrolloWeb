package mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.dao.Login;
import mvc.model.dao.LoginBean;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Login login;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() {
    	login = new Login();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.invalidate();
		ServletContext context= getServletContext();
		RequestDispatcher rd= context.getRequestDispatcher("/views/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		authenticate(request, response);
	}
	
	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);

		try {
			if (login.validate(loginBean)==1) {
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				session.setAttribute("tipo", 1);
				ServletContext context= getServletContext();
				RequestDispatcher rd= context.getRequestDispatcher("/dashboard");
				rd.forward(request, response);
			} else if (login.validate(loginBean)==2) {
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				session.setAttribute("tipo", 2);
				ServletContext context= getServletContext();
				RequestDispatcher rd= context.getRequestDispatcher("/dashboard");
				rd.forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("user", null);
				session.setAttribute("tipo", null);
				response.sendRedirect("views/login.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
