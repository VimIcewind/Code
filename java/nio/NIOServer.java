import java.io.*;
import java.net.*;
import java.nio.*;
import java.nio.channels.*;
import java.util.*;

public class NIOServer {
    @SuppressWarnings("unused")
    public static void main(String[] args) throws IOException {
        Selector selector = Selector.open();
        ServerSocketChannel socketChannel = ServerSocketChannel.open();
        InetSocketAddress socketAddress = new InetSocketAddress("localhost", 12200);
        socketChannel.bind(socketAddress);
        socketChannel.configureBlocking(false);

        int ops = socketChannel.validOps();
        SelectionKey selectKy = socketChannel.register(selector, ops, null);

        // 无限循环，保持服务端运行
        while (true) {
            logInfo("Server Started and Waiting for new connection or data");
            // 多路选择阻塞
            selector.select();
            // 选择感兴趣的
            Set<SelectionKey> selectionKeys = selector.selectedKeys();
            Iterator<SelectionKey> iterator = selectionKeys.iterator();

            while (iterator.hasNext()) {
                SelectionKey myKey = iterator.next();
                // 如果有连接
                if (myKey.isAcceptable()) {
                    SocketChannel accept = socketChannel.accept();
                    accept.configureBlocking(false);
                    accept.register(selector, SelectionKey.OP_READ);
                    logInfo("Connection Accepted: " + accept.getLocalAddress() + "\n");

                    // 如果有数据可读
                } else if (myKey.isReadable()) {
                    SocketChannel clientChannel = (SocketChannel) myKey.channel();
                    ByteBuffer bufferReader = ByteBuffer.allocate(256);
                    clientChannel.read(bufferReader);
                    String result = new String(bufferReader.array()).trim();
                    logInfo("Message received: " + result);
                }
                iterator.remove();
            }
        }
    }

    private static void logInfo(String str) {
        System.out.println(str);
    }
}
