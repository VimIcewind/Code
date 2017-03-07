package yxh;

import java.io.*;

import java.net.Socket;
/**
 *
 * @author Baron
 * @version 创建时间：2017年1月2日
 * @Dsecription 实现一个多线程，处理每个用户的请求
 */
public class HttpThread extends Thread {

    private Socket sock;
    HttpThread(Socket socktmp) {

        this.sock = socktmp;
    }
    public void run() {

        InputStream ins = null;
        OutputStream outs = null;
        try {
            ins = sock.getInputStream();
            outs = sock.getOutputStream();
            Receive rcv = new Receive(ins);
            String sURL = rcv.parse();  //用Receive 类取得浏览器发过来 的URL请求
            if (sURL.equals("/")) {
                sURL = HttpServer.defaultPage;// 如果没有指定文件，那么给传过来的URL加上默认的文件名
            }
            Answer ans = new Answer(outs);
            ans.Send(sURL);//再将URL执行的文件用Answer类的send方法放回给浏览器
        } catch (IOException e) {
            System.out.println(e.toString());
        }
        finally{
            //最后调用那些类的close方法释放资源
            try{
                if (ins != null) ins.close();
                if (outs != null) outs.close();
                if (sock != null) sock.close();
            } catch (IOException e) {}
        }
    }
}
