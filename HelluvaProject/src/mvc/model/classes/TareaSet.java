package mvc.model.classes;

public class TareaSet {
	private int id;
	private int aula;
	private String titulo;
	private String descripcion;
	private boolean estado;
	
	public TareaSet() {}

	public TareaSet(int id, int aula, String titulo, String descripcion, boolean estado) {
		super();
		this.id = id;
		this.aula = aula;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.estado = estado;
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

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
}
