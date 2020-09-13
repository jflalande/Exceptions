public class TryCatch {

    public static void main(String[] args) {
        int tab[] = new int[10];

        try {
            for (int i = 0; i <= 10; i++)
                System.out.println("Tab[i]=" + tab[i++]);
        }
        catch (ArrayIndexOutOfBoundsException e)
        {
            System.err.println("There is an error ! " + e);
            System.exit(-5);
        }
    }
}
