package mvc.model.classes;

public class Material {
	private int id;
	private int aula;
	private String titulo;
	private String descripcion;
	private String url;
	
	public Material() {}

	public Material(int id, int aula, String titulo, String descripcion, String url) {
		super();
		this.id = id;
		this.aula = aula;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.url = url;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
