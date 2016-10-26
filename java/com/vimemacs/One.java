package com.vimemacs;
import java.util.Scanner;
import java.util.List;

public class One {
    public static void main(String[] args) {
        // 声明可以接受用户输入的对象的实例
        Scanner sc = new Scanner(System.in);
        // 输出一个提示
        System.out.println("请输入你的姓名");
        // 声明一个字符串，接收用户的输入
        String name = sc.nextLine();
        // 再输出你叫什么名
        System.out.println("你好，你叫：" + name);
    }
}
