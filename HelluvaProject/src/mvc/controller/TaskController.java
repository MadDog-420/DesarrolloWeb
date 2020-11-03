package mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import mvc.model.classes.Aula;
import mvc.model.classes.TareaSet;
import mvc.model.classes.TareaUp;
import mvc.model.dao.AsignaturaDAO;
import mvc.model.dao.ClassroomDao;
import mvc.model.dao.Login;
import mvc.model.dao.LoginBean;

/**
 * Servlet implementation class TaskController
 */
@WebServlet("/tasks")
@MultipartConfig(
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*5,
		maxRequestSize=1024*1024*5*3
)
public class TaskController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	AsignaturaDAO asignaturaDAO;
	Login logindao;
	LoginBean user;
	ClassroomDao classroomDao;
	Aula aula;
    
	int aula_id;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskController() {
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
		
		if(request.getParameter("id")!=null) {
			aula_id=(int)Integer.valueOf(request.getParameter("id"));
		}
		if(request.getParameter("message")!=null) {
			request.setAttribute("message", 0);
		}
		
		try {
			if(session.getAttribute("user")!=null) {
				String username = session.getAttribute("user").toString();
				int tipo = (int)Integer.valueOf(session.getAttribute("tipo").toString());
				String user_tipo="";
				user = logindao.getUser(username, tipo);
				request.setAttribute("user", user);
				request.setAttribute("user_tipo", tipo);
				if(tipo==1) {
					listCourse(request,response,user.getId());
				} else if(tipo==2) {
					listCourseDoc(request,response,user.getId());
				}
				
				GetCourseById(request,response);
				listTask(request,response);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("views/task.jsp");
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
		session = request.getSession();
		
		String root="";
		String name="";
		if(request.getParameter("action")!=null) {
			String action = request.getParameter("action").toString();
			if(action.equalsIgnoreCase("set_task")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("views/task_form.jsp");
				dispatcher.include(request, response);
				return;
			}
		}
		if(ServletFileUpload.isMultipartContent(request)){
            try {
                List <FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String task_set="";
                String url="";
                for(FileItem item : items){
                    if(!item.isFormField()){
                    	//root = getServletContext().getContextPath();
                    	root = "C:/Users/RandomUser/git/desarrollo/HelluvaProject";
                        name = new File(item.getName()).getName();
                        item.write( new File(root + "/WebContent/assets/Upload" + File.separator + name));
                    } else {
                    	if(item.getFieldName().equalsIgnoreCase("id")) {
                    		aula_id = (int)Integer.valueOf(item.getString());
                    	}
                    	if(item.getFieldName().equalsIgnoreCase("task_set")) {
                    		task_set = item.getString();
                    	}
                    }
                }
                if(!task_set.isEmpty() || !url.isEmpty()) {
                	try {
                		upTask(request,response,task_set,url);
                	} catch (SQLException ex) {
            			throw new ServletException(ex);
            		}
                }
            
            } catch (Exception ex) {
               request.setAttribute("message", 2);
            }
        }else{
            request.setAttribute("message", 3);
        }
        doGet(request,response);
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
	
	private void GetCourseById(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		aula = classroomDao.selectAulaById(aula_id);
		request.setAttribute("aula", aula);
	}
	
	private void listTask(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<TareaSet> listTareaSet = classroomDao.selectTasks(aula_id);
		request.setAttribute("listTareaSet", listTareaSet);
	}
	
	private void upTask(HttpServletRequest request, HttpServletResponse response, String task_set, String url)
			throws SQLException, IOException, ServletException {
		int tareasset = (int)Integer.valueOf(task_set);
		int alumno_id = (int)Integer.valueOf(session.getAttribute("user_id").toString());
		
		TareaUp task = new TareaUp();
		task.setTareasset(tareasset);
		task.setAlumno(alumno_id);
		task.setUrl(url);
		
		try {
			
			int result = classroomDao.upTask(task);
			if(result == 1) {
				request.setAttribute("message", 1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void setTask(HttpServletRequest request, HttpServletResponse response, String task_set, String url)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/login.jsp");
		dispatcher.include(request, response);
	}

}
