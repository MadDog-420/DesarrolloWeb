package navegacion;

import java.io.IOException;
import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

@ManagedBean (name="consulta")
@RequestScoped
public class navegador implements Serializable{

	public String metodo1() {
		return "/page.xhtml?page=sonrisa";
	}
	
	public String metodo2() {
		return "/page.xhtml?page=ui";
	}
	
	public String metodo3() {
		return "/page.xhtml?page=facelet";
	}
	
}
