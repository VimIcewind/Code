import java.io.*;
import java.net.*;
import java.util.concurrent.*;

public class IOServer {
    static ExecutorService executor = Executors.newFixedThreadPool(100); // 线程池

    @SuppressWarnings("unused")
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket();
        InetSocketAddress socketAddress = new InetSocketAddress("localhost", 12200);
        serverSocket.bind(socketAddress);
        while (!Thread.currentThread().isInterrupted()) { // 主线程死循环等待新连接到来
            Socket socket = serverSocket.accept();
            executor.submit(new IOnHandler(socket)); // 为新的连接创建新的线程
        }
    }

    static class IOnHandler extends Thread {
        private Socket socket;

        public IOnHandler(Socket socket) {
            this.socket = socket;
        }

        public void run() {
            while (!Thread.currentThread().isInterrupted() && !socket.isClosed()) {
                try {
                    // 演示代码
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                    String data = bufferedReader.readLine();
                    BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
                    bufferedWriter.write(data);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
