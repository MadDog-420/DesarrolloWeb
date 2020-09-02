package Default;
import java.util.Scanner;

public class Tarea1 {

	public static void main(String[] args) {
		int num = 0;
		Scanner scan=new Scanner(System.in);
		
		Ejercicio1 uno=new Ejercicio1();
		System.out.print("Ingresa un número: ");
		num=scan.nextInt();
		uno.capicua(num);
		
		System.out.println("\n************************************\n");
		
		Ejercicio2 dos=new Ejercicio2();
		dos.draw(3);
		
		System.out.println("\n************************************\n");
		
		Ejercicio3 tres=new Ejercicio3();
		System.out.println("Ingresa nombre: ");
		String nombre=scan.next();
		System.out.println("Ingresa apellidos: ");
		String apellidos=scan.next();
		System.out.println("Ingresa edad: ");
		int edad=scan.nextInt();
		System.out.println("Ingresa genero (M/F): ");
		char genero=scan.next().charAt(0);
		System.out.println("Ingresa carrera: ");
		String carrera=scan.next();
		tres.set_alumno(nombre, apellidos, edad, genero, carrera);
		System.out.println(tres.ToString());
	}

}
