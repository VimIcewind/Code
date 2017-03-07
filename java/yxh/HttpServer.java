package yxh;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
/**
 *
 * @author Baron
 * @version 创建时间：2017年1月2日
 * @Dsecription 确定用TCP 作为服务传输协议，首先做一个main函数，建立Socket ，并用一个“死循环” 的形式
 *              监听指定端口。
 */
public class HttpServer {

    public static String ROOT = "./wwwroot";              ///默认root文件夹
    public static String defaultPage = "index.html";       //默认文件的文件名

    public static void main(String[] args) throws IOException {

        ServerSocket server = new ServerSocket(8000);
        while (true) {
            //阻塞，等待浏览器的连接
            Socket sk = server.accept();
            System.out.println("Accepting Connection ...\n");
            //启动服务线程
            new HttpThread(sk).start();
        }
    }

}

