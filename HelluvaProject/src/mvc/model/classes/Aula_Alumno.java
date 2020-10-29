package mvc.model.classes;

public class Aula_Alumno {
	private int alumno;
	private int aula;
	
	public Aula_Alumno() {}
	public Aula_Alumno(int alumno, int aula) {
		super();
		this.alumno = alumno;
		this.aula = aula;
	}


	public int getAlumno() {
		return alumno;
	}

	public void setAlumno(int alumno) {
		this.alumno = alumno;
	}

	public int getAula() {
		return aula;
	}

	public void setAula(int aula) {
		this.aula = aula;
	}
	
}
