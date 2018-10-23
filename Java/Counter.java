public class Counter extends Thread{

    public static class Count{
        int count = 0;

        public int getCount() {
            synchronized (this) {
                return count++;
            }
        }
    }

    public static class X extends Thread{
        Count count;

        X(Count count) {
            this.count = count;
        }

    }
}