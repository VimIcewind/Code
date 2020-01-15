import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

/**
 * Http 客户端类
 * @author zbuger 
 * 来源：CSDN 
 * 原文：https://blog.csdn.net/zbuger/article/details/51695582 
 */
public class Client {

    public static void main(String[] args) throws Exception {

        Socket s = new Socket("localhost", 8080);

        PrintWriter writer = new PrintWriter(s.getOutputStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(s.getInputStream()));
        writer.println("hello");
        writer.flush();
        System.out.println(reader.readLine());
        s.close();
    }

}
