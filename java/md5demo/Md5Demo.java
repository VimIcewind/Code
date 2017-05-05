import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by HWD on 2016/4/20.
 */
public class Md5Demo {

    public static void main(String[] args) {
        String text = "appCode=siff@@appSecret=a8931d6c100efc76z18b70ce510@@cityId=021@@method=cinemas@@time=1396938735";
        String sign = "9791135E9972F04DFEF126292FE04642";
        String key = "a8931d6c100efc76z18b70ce510";

        System.out.println(verify(text, sign, key));
    }

    /**
     * MD验签字符串
     *
     * @param text
     *            需要签名的字符串
     * @param sign
     *            签名结果
     * @param key
     *            密钥
     * @param input_charset
     *            编码格式
     * @return 签名结果
     */
    public static boolean verify(String text, String sign, String key, String charset) {
        text = text + key;
        String mysign = DigestUtils.md5Hex(getContentBytes(text, charset));
        if (mysign.equals(sign)) {
            return true;
        } else {
            return false;
        }
    }
}
