// void 运算符的作用是执行一个表达式，然后不返回任何值，或者说返回 undefined
console.log(void 0);
// undefined
console.log(void(0));
// undefined

// 上面是 void 运算符的两种写法，都正确。建议采用后一种形式，即总是使用圆括号。
// 因为 void 运算符的优先级很高，如果不使用括号，容易造成错误的结果。
// 比如，void 4 + 7 实际上等同于 (void 4) + 7

console.log(void 4 + 7);
// NaN
console.log((void 4) + 7);
// NaN
console.log(void(4 + 7));
// undefined

// 下面是 void 运算符的一个例子
var x = 3;
console.log(void (x = 5));
// undefined
console.log(x);
// 5

// 这个运算符的主要用途是浏览器的书签工具 (Bookmarklet), 以及在超级链接中插入代码防止网页跳转
// 示例见 void.html


// 逗号运算符用于对两个表达式求值，并返回后一个表达式的值
console.log(('a', 'b'));
// b

var x = 0;
var y = (x++, 10);
console.log(x);
// 1
console.log(y);
// 10
// 上面代码中，逗号运算符返回后一个表达式的值

// 逗号运算符的一个用途是，在返回一个值之前，进行一些辅助操作
var value = (console.log("Hi!"), true);
// Hi!

console.log(value);
// true
// 上面代码中，先执行逗号之前的操作，然后返回逗号后面的值


// 运算顺序
// 优先级
// JavaScript 各种运算符的优先级别 (Operator Precedence) 是不一样的。优先级高的运算符先执行，
// 优先级低的运算符后执行
console.log(4 + 5 * 6);
// 34
console.log(4 + (5 * 6));
// 34

var x = 1;
var arr = [];

var y = arr.length <= 0 || arr[0] === undefined ? x : arr[0];
// 等同于
var y = ((arr.length <= 0) || (arr[0] === undefined)) ? x : arr[0];

// 圆括号的作用
// 圆括号 () 可以用来提高运算的优先级，因为它的优先级是最高的，即圆括号中的表达式会第一个运算
console.log((4 + 5) * 6)
// 54

// 运算符的优先级别十分繁杂，且都是硬性贵的，因此建议总是使用圆括号，保证运算顺序清晰可读，
// 这对代码的维护和除错至关重要

// 顺便说一下，圆括号不是运算符，而是一种语法结构。它一共有两种用法：一种是把表达式放在圆括号之中，
// 提升运算的优先级；另一种是跟在函数的后面，作用是调用函数

// 注意，因为圆括号不是运算符，所以不具有求值作用，只改变运算的优先级
var x = 1;
console.log((x) = 2);
// 2
console.log(x);
// 2
// 上面代码的第二行，如果圆括号具有求值作用，那么就会变成 1 = 2, 这是会报错了。但是，
// 上面的代码可以运行，这验证了圆括号只能改变优先级，不会求值

// 这意味着，如果整个表达式都放在圆括号之中，那么不会有任何效果
// (expression)
// 等同于
// expression

// 函数放在圆括号中，会返回函数本身，如果圆括号紧跟在函数的后面，就表示调用函数
function f() {
    return 1;
}
console.log((f))
// [Function: f]
// ƒ f() {
//     return 1;
// }

// 上面代码中，函数放在圆括号之中会返回函数本身，圆括号跟在函数后面则是调用函数。
// 圆括号之中，只能放置表达式，如果将语句放在圆括号之中，就会报错
// (var a = 1)
// SyntaxError: Unexpected token 'var'

// 左结合和右结合
// 对于优先级别相同的运算符，同时出现的时候，会有计算顺序的问题
// a OP b OP c
// 上面的代码中，OP 表示运算符。它可以有两种解释方式
// 方式一
// (a OP b) OP c
// 方式二
// a OP (b OP c)
// 上面的两种方式，得到的结算结果往往是不一样的。方式一将左侧两个运算数结合在一起，采用
// 这种解释方式的运算符，称为"左结合" (left-to-right associaativity) 运算符；方式二是将
// 右侧两个运算数结合在一起，这样的运算符称为"右结合" (right-toleft associativity)
// JavaScript 语言的大多数运算符是 "左结合"，请看下面加法运算符的例子

// x + y + z
// 引擎解释如下
// (x + y) + z
// 上面的代码中，x 与 y 结合在一起，它们的预算结果再与 z 进行运算

// 少数运算符是"右结合"，其中最主要的是赋值运算符 = 和三元条件运算符 ?:
// w = x = y = z;
// w = (x = (y = z));
// q = a ? b : c ? d : e ? f : g;
// q = a ? b : (c ? d : (e ? f: g));
// 上面代码都是右侧的运算数结合在一起

// 另外，指数运算符 (**) 也是右结合
2 ** 3 ** 2
// 相当于
2 ** (3 ** 2)

console.log(2 ** 3 ** 2)
// 512
console.log(2 ** (3 ** 2))
// 512
