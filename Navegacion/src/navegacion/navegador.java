package navegacion;

import java.io.IOException;
import java.io.Serializable;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ManagedBean (name="consulta")
@RequestScoped
@SessionScoped
public class navegador{
	
	private String page;
	private String content;

	public String outcome(){
        
        FacesContext fc = FacesContext.getCurrentInstance();
        this.page = getPageParam(fc);
        return "page";
    
	}

    //get value from "f:param"
    public String getPageParam(FacesContext fc){
        
        Map<String,String> params = fc.getExternalContext().getRequestParameterMap();
        String result = params.get("page");
        switch(result) {
        case "sonrisa":
        	this.content="<img src='https://res.cloudinary.com/mundo/image/upload/f_auto,q_auto/h_338,w_400/v1559233282/shutterstock-d%C3%ADa-sonrisa-2_bxgc7e.jpg?cld_params=f_auto,q_auto/h_338,w_400'>";
        	break;
        case "Ejemplos de elementos UI":
        	this.content="<input type=\"checkbox\" id=\"vehicle1\" name=\"vehicle1\" value=\"Bike\">"
        			+ "<label for=\"vehicle1\"> I have a bike</label></br></br>"
        			+ "<input type=\"radio\" id=\"male\" name=\"gender\" value=\"male\">\r\n" + 
        			"<label for=\"male\">Male</label></br></br>"
        			+ "<button type=\"button\">Click Me!</button>";
        	break;
        case "Facelet":
        	this.content="<h2>Esto es un facelet</h2>";
        	break;
        }
        return result;
        
    }

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
