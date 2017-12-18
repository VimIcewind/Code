import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class ThreadLoopPrint {
    ReentrantLock reentrantLock = new ReentrantLock();
    Condition aCondition = reentrantLock.newCondition();
    Condition bCondition = reentrantLock.newCondition();

    public static void main(String[] args) throws InterruptedException {
        ThreadLoopPrint tlp = new ThreadLoopPrint();
        A a = tlp.new A();
        B b = tlp.new B();

        a.start();
        b.start();
    }

    class A extends Thread {
        @Override
        public void run() {
            while(true) {
                reentrantLock.lock();
                try {
                    System.out.print("A,");
                    bCondition.signal();
                    aCondition.await();
                } catch(Exception e) {
                    e.printStackTrace();
                }

                reentrantLock.unlock();
            }
        }
    }

    class B extends Thread {
        @Override
        public void run() {
            while(true) {
                reentrantLock.lock();
                try {
                    System.out.println("B");
                    aCondition.signal();
                    bCondition.await();
                } catch(Exception e) {
                    e.printStackTrace();
                }

                reentrantLock.unlock();
            }
        }
    }

}
