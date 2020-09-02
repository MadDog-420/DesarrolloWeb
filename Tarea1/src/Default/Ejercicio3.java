package Default;

public class Ejercicio3 {
	
	Alumno estu=new Alumno();
	
	public void set_alumno (String nombre, String apellidos, int edad, char genero, String carrera) {
		String cod=this.gen_code(edad, genero, carrera);
		estu=new Alumno(nombre,apellidos,edad,genero,cod,carrera);
	}
	
	private String gen_code(int edad, char genero, String carrera) {
		String cod="";
		char sub_cod[]=new char[4];
		sub_cod[0]='U';
		sub_cod[3]=genero;
		if (edad>17 && edad<25) {
			sub_cod[1]='A';
		} else {
			sub_cod[1]='B';
		}
		switch(carrera) {
		case "sistemas": sub_cod[2]='1'; break;
		case "derecho": sub_cod[2]='2'; break;
		case "industrial": sub_cod[2]='3'; break;
		case "psicología": sub_cod[2]='4'; break;
		default: sub_cod[2]='5';
		}
		cod=String.valueOf(sub_cod);
		return cod;
	}
	
	public String ToString() {
		return "Alumno: "+estu.nombre+" "+estu.apellidos+
				"\nEdad: "+estu.edad+
				"\nGénero: "+estu.genero+
				"\nCarrera: "+estu.carrera+
				"\nCódigo: "+estu.cod;
	}
}
