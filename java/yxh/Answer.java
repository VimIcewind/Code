package yxh;

import java.io.*;
/**
 *
* @author Baron
* @version 2017年1月2日
* @Dsecription 返回 Http 数据流
 */
public class Answer {

    OutputStream out = null;
    public Answer(OutputStream output) {
        this.out = output;
    }
    public void Send(String pagefile) throws IOException{
        //这个方法是关键，其目的是返回HTTP数据流
        byte[] bytes = new byte[2048];
        FileInputStream fis = null;
        try{
            //读取指定的文件内容
            File file = new File(HttpServer.ROOT, pagefile);
            if (file.exists()) {
                fis = new FileInputStream(file);
                int ch = fis.read(bytes, 0, 2048);
                @SuppressWarnings("deprecation")
                String sBody = new String(bytes, 0);
                //返回 的信息是在文件的内容的前面加上Http协议的格式内容
                String sendMessage = "HTTP/1.1 200 OK\r\n" +
                "Content-Type:text/html\r\n" +
                "Content-Length:" + ch + "\r\n" +
                "\r\n" + sBody;
                //输出文件
                out.write(sendMessage.getBytes());
            } else{
                //文件不存在的话，返回一个Http协议的格式内容
                @SuppressWarnings("unused")
                String errorMessage = "HTTP/1.1 404 File Not Found\r\n" +
                "Content-Type:text/html\r\n" +
                "Content-Length:23\r\n" +
                "\r\n" +
                "<h1>File Not Found</h1>";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        finally {
            if (fis != null) {
                fis.close();
            }
        }
    }
}

