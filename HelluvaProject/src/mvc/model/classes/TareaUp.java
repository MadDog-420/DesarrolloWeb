package mvc.model.classes;

public class TareaUp {
	private int id;
	private int tareasset;
	private int alumno;
	private String url;
	
	public TareaUp() {}

	public TareaUp(int id, int tareasset, int alumno, String url) {
		super();
		this.id = id;
		this.tareasset = tareasset;
		this.alumno = alumno;
		this.url = url;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTareasset() {
		return tareasset;
	}

	public void setTareasset(int tareasset) {
		this.tareasset = tareasset;
	}

	public int getAlumno() {
		return alumno;
	}

	public void setAlumno(int alumno) {
		this.alumno = alumno;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
