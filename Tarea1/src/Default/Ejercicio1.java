package Default;

public class Ejercicio1 {
	
	public Ejercicio1() {}
	
	public void capicua(int num) {
		int aux=num,resto=0,invert=0;
		while(aux!=0)
		{
		 resto = aux%10;
		 invert = invert*10+resto;
		 aux = aux/10;
		}
		System.out.print("El n�mero ");
		if (invert==num) {
			System.out.print("es ");
		} else {
			System.out.print("no es ");
		}
		System.out.print("capic�a");
	}
}
