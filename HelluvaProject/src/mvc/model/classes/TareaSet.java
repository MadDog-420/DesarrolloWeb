package mvc.model.classes;

public class TareaSet {
	private int id;
	private int aula;
	private String titulo;
	private String descripcion;
	
	public TareaSet() {}

	public TareaSet(int id, int aula, String titulo, String descripcion) {
		super();
		this.id = id;
		this.aula = aula;
		this.titulo = titulo;
		this.descripcion = descripcion;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAula() {
		return aula;
	}

	public void setAula(int aula) {
		this.aula = aula;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}
