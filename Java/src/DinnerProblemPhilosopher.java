import java.util.Scanner;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class DinnerProblemPhilosopher {
    public static void main(String[] args){
        int no_Philosophers = 10, no_Bites = 5;

        //bites left
        int bitesLeft[] = new int[no_Philosophers];
        // Lock for each philo...
        Lock fork[] = new Lock[no_Philosophers];

        //initializing
        for (int i = 0; i < no_Philosophers; ++i){
            bitesLeft[i] = no_Bites;
            fork[i] = new ReentrantLock();
        }

        for (int i = 0; i < no_Philosophers; ++i){
            int s = i;

            //lambda thread
            new Thread(() -> {
                // Left and right forks
                int leftFork, rightFork;
                if (s - 1 < 0)
                    leftFork = no_Philosophers - 1;
                else leftFork = s - 1;

                if (s + 1 == no_Philosophers)
                    rightFork = 0;
                else rightFork = s + 1;


                while (bitesLeft[s] > 0){
                    boolean f1 = fork[leftFork].tryLock(), f2 = fork[rightFork].tryLock();

                    try {
                        while(! (f1 && f2)){
                            if (f1) fork[leftFork].unlock();
                            if (f2) fork[rightFork].unlock();
                            Thread.sleep(1000);
                            f1 = fork[leftFork].tryLock(); f2 = fork[rightFork].tryLock();
                        }

                        System.out.println(s + " " + bitesLeft[s]--);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    } finally {
                        fork[leftFork].unlock();
                        fork[rightFork].unlock();
                    }
                }
                System.out.println(s + "  Done already");
            }).start();
        }
    }
}
