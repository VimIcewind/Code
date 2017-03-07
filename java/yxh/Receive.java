package yxh;

import java.io.IOException;
import java.io.InputStream;
/**
 *
 * @author Baron
 * @version 创建时间：2017年1月2日
 * @Dsecription 取得浏览器传过来的 URL 字符串
 */
public class Receive {

    InputStream in  = null;

    public Receive(InputStream input) {
        this.in = input;
    }
    //这个方法 的目的是将URL 请求的文件返回
    public String parse() {
        StringBuffer receiveStr = new StringBuffer(2048);//这个变量就是实际从浏览器取得的请求数据流
        int i;
        byte[] buffer = new byte[2048];
        try {
            i = in.read(buffer);//从Socket读出数据
        } catch (IOException e) {
            i = -1;
        }
        for (int j = 0; j < i; j++) {
            receiveStr.append((char)buffer[j]);//将请求到的信息循环追加到receiverStr变量中
        }
        return getUri(requestStr.toString());
    }
    private String getUri(String receiveStr) {
        int index1, index2;
        index1 = receiveStr.indexOf(' ');
        if (index1 != -1) {
            index2 = receiveStr.indexOf(' ', index1 + 1);
            if (index2 > index1) {
                return receiveStr.substring(index1 + 1, index2);
            }
        }
        return null;
    }
}

