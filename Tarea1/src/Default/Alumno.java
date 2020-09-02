package Default;

public class Alumno extends Persona{
	
	public String cod="UA1M", carrera="sistemas";
	
	public Alumno() {
		super();
	}
	public Alumno(String nombre, String apellidos, int edad, char genero, String cod, String carrera) {
		super(nombre,apellidos,edad,genero);
		this.cod=cod;
		this.carrera=carrera;
	}
	
	private void Aprender() {}
	
	public void Estudiar() {
		this.Aprender();
	}
	public void Entregar_tarea() {}
	
}
