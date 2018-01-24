import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SerializationDemo {
    public static void main(String[] args) throws Exception {
        // 定义obj对象
        String obj = "Hello World!";
        // 创建一个包含对象进行反序列化信息的"object"数据文件
        FileOutputStream fos = new FileOutputStream("object");
        ObjectOutputStream os = new ObjectOutputStream(fos);
        // writeObject()方法将obj对象写入object文件
        os.writeObject(obj);
        os.close();

        // 从文件中反序列化obj对象
        FileInputStream fis = new FileInputStream("object");
        ObjectInputStream ois = new ObjectInputStream(fis);
        // 恢复对象
        String obj2 = (String)ois.readObject();
        System.out.print(obj2);
        ois.close();
    }
}
