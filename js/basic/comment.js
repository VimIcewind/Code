// 这是单行注释

/*
 这是
 多行
 注释
*/

<!-- 此外，由于历史上 JavaScript 可以兼容 HTML 代码的注释，所以这行也被视为合法的单行注释 -->

// 下面的代码，只有 x = 1 会执行，其他的部分都被注释掉了
// 需要注意的是，--> 只有在行首，才会被当成单行注释，否则会当做正常的运算
x = 1; <!-- x = 2;
--> x = 3;
console.log(x)
