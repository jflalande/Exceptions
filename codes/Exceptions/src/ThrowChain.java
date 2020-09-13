public class Throw {
    public static void main(String[] args) {
        try {
            f(0);
            f(1);
        } catch (MyException e) {
            e.printStackTrace();
        }
    }
    private static void f(int i) throws MyException {
        if (i ==1)
            throw new MyException("C'est grave: i ne doit pas valoir 1 !");
    }

    private static class MyException extends Exception {
        public MyException(String s) {
            super(s);
        }
    }
}
