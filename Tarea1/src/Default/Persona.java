package Default;

public class Persona {
	
	public String nombre="John", apellidos="Smith";
	public int edad=19;
	public char genero= 'M';

	public Persona() {}
	public Persona (String nombre, String apellidos, int edad, char genero) {
		this.nombre=nombre;
		this.apellidos=apellidos;
		this.edad=edad;
		this.genero=genero;
	}
	
	public void respirar() {}
	public void comer() {}
}
