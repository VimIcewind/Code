import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

import javax.net.SocketFactory;
import javax.net.ssl.SSLSocketFactory;

/**
 * Https 单向认证客户端类
 * @author zbuger 
 * 来源：CSDN 
 * 原文：https://blog.csdn.net/zbuger/article/details/51695582 
 */
public class SingleSSLClient {

    private static String CLIENT_KEY_STORE = "/root/Code/java/ssldemo/client_ks";

    public static void main(String[] args) throws Exception {
        // Set the key store to use for validating the server cert.
        System.setProperty("javax.net.ssl.trustStore", CLIENT_KEY_STORE);

        System.setProperty("javax.net.debug", "ssl,handshake");

        SingleSSLClient client = new SingleSSLClient();
        Socket s = client.clientWithoutCert();

        PrintWriter writer = new PrintWriter(s.getOutputStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(s
                .getInputStream()));
        writer.println("hello");
        writer.flush();
        System.out.println(reader.readLine());
        s.close();
    }

    private Socket clientWithoutCert() throws Exception {
        SocketFactory sf = SSLSocketFactory.getDefault();
        Socket s = sf.createSocket("localhost", 8443);
        return s;
    }
}
