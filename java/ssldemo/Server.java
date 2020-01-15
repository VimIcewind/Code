import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * Http 服务端类
 * @author zbuger 
 * 来源：CSDN 
 * 原文：https://blog.csdn.net/zbuger/article/details/51695582 
 */
public class Server extends Thread  {
    private Socket socket;

    public Server(Socket socket)  {
        this.socket  =  socket;
    }

    public void run()  {
        try {
            BufferedReader reader  =  new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter writer  =  new PrintWriter(socket.getOutputStream());

            String data  =  reader.readLine();
            writer.println(data);
            writer.close();
            socket.close();
        } catch (IOException e) {

        }
    }

    public static void main(String[] args) throws Exception  {
        while (true) {
            new Server((new ServerSocket(8080)).accept()).start();
        }
    }
}
