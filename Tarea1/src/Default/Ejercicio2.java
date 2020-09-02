package Default;

public class Ejercicio2 {
	
	public Ejercicio2() {}
	
	public void draw(int steps) {
	    for (int x = 0; x < steps; x++) {
	        System.out.format(((steps == (x + 1)) ? "" : ("%"
	                + ((steps - x - 1) * 5) + "s"))
	                + "  o  ******"
	                + ((x == 0) ? "" : ("%" + (x * 5) + "s"))
	                + "*\n", " ", " ");
	        System.out.format(((steps == (x + 1)) ? "" : ("%"
	                + ((steps - x - 1) * 5) + "s"))
	                + " /|\\ *     "
	                + ((x == 0) ? "" : ("%" + (x * 5) + "s"))
	                + "*\n", " ", " ");
	        System.out.format(((steps == (x + 1)) ? "" : ("%"
	                + ((steps - x - 1) * 5) + "s"))
	                + " / \\ *     "
	                + ((x == 0) ? "" : ("%" + (x * 5) + "s"))
	                + "*\n", " ", " ");
	    }
	    for (int i = 0; i < (steps + 1) * 5 + 2; i++) {
	        System.out.print("*");
	    }
	}
}
