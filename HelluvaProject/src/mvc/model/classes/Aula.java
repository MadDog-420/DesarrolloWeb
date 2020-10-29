package mvc.model.classes;

public class Aula {
	private int id;
	private String descripcion;
	private String docente;
	private String asignatura;
	
	public Aula() {}
	public Aula(int id, String descripcion, String docente, String asignatura) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.docente = docente;
		this.asignatura = asignatura;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getDocente() {
		return docente;
	}
	public void setDocente(String docente) {
		this.docente = docente;
	}
	public String getAsignatura() {
		return asignatura;
	}
	public void setAsignatura(String asignatura) {
		this.asignatura = asignatura;
	}
	
	
}
