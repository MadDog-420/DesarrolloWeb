package mvc.controller;

import java.io.File;
import java.io.IOException;

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
@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024,
maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
@WebServlet("/tasks")
public class TaskController extends HttpServlet {
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
					listTask(request,response);
				}
				
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
		if(ServletFileUpload.isMultipartContent(request)){
            try {
                List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        item.write( new File("c:/Upload" + File.separator + name));
                    }
                }
               //File uploaded successfully
               request.setAttribute("gurumessage", "File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("gurumessage", "File Upload Failed due to " + ex);
            }         		
        }else{

            request.setAttribute("gurumessage","No File found");
        }
        doGet(request,response);

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
	
	private void listTask(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int aula_id = (int)Integer.valueOf(request.getParameter("id"));
		List<TareaSet> listTareaSet = classroomDao.selectTasks(aula_id);
		request.setAttribute("listTareaSet", listTareaSet);
	}
	
	private void upTask(HttpServletRequest request, HttpServletResponse response, String url)
			throws SQLException, IOException, ServletException {
		int tareasset = (int)Integer.valueOf(request.getParameter("task_set"));
		int alumno_id = (int)Integer.valueOf(session.getAttribute("user_id").toString());
		
		TareaUp task = new TareaUp();
		task.setTareasset(tareasset);
		task.setAlumno(alumno_id);
		task.setUrl(url);
		
		try {
			
			int result = classroomDao.upTask(task);
			if(result == 1) {
				request.setAttribute("NOTIFICATION", "Tarea entregada!");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
