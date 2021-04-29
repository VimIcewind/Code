var a = 1;
console.log(a);

var b;
b = 1;
console.log(b);

var u;
console.log(u);

var c = 1;
// 基本等同
c = 1;
console.log(c);
// 但是，不写 var 的做法，不利于表达意图，而且容易不知不觉地创建全局变量
// 所以建议总是使用 var 命令声明变量

// 如果一个变量没有声明就直接使用，JavaScript 会报错，告诉你变量未定义
// x
// ReferenceError: x is not defined

// 可以在同一条 var 命令中声明多个变量
var d, e;
console.log(d)
console.log(e)

// JavaScript 是一种动态类型语言，也就是说，变量的类型没有限制，变量可以随时更改类型
var f = 1;
console.log(f)
f = 'hello';
console.log(f)

// 如果使用 var 重新声明一个已存在的变量，是无效的
var x = 1;
var x;
console.log(x) // 1
// 上面代码中，变量 x 声明了两次，第二次声明是无效的
//
// 但是，如果第二次声明的时候还进行了赋值，则会覆盖掉前面的值
var x = 1;
var x = 2;
console.log(x) // 2
// 等同于
var x = 1;
var x;
x = 2;
console.log(x) // 2
