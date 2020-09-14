public class TryMCatch {
    public static void main(String[] args) {
        int tab[] = new int[10];
        try {
            for (int i = 0; i <= 10; i++)
                System.out.println("Tab[i]=" + tab[i]);
        }
        catch (ClassCastException e) {  } // Erreur de cast !
        catch (ArrayIndexOutOfBoundsException e) { // Dépassement de bornes
            System.err.println("There is an error but we can continue.");
        } catch (Exception | Error e) { // Union d'exceptions
            System.err.println("There is a more general error ! Abort ! " + e);
            System.exit(-5);
        }
    }
}
