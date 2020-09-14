public class ThrowChain {
    public static void main(String[] args) throws MyFatalException {
        try {
            f(0);
            f(1);
        } catch (MyException e) {
            throw new MyFatalException();
            // ou bien, si on veut forwarder, directement throw e
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
    private static class MyFatalException extends Error {
    }
}
