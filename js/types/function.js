// function 命令
function print(s) {
    console.log(s);
}
print('Hi, function!');
// Hi, function!

// 函数表达式
// 除了用 function 命令声明函数, 还可以采用变量赋值的写法
// 这种写法将一个匿名函数赋值给变量。这时，这个匿名函数又称函数表达式(Function Expression),
// 因为赋值语句的等号右侧只能放表达式
var print = function (s) {
    console.log(s);
};
print('Hi, function!');
// Hi, function!

// 采用函数表达式声明函数时，function 命令后面不带有函数名。
// 如果加上函数名，该函数名只在函数体内部有效，在函数体外部无效
var print = function x() {
    console.log(typeof x);
};
// console.log(x);
// x not defined
print();
// function

// 上面的代码再函数表达式中，加入了函数名 x。这个 x 只在函数体内不可用，指代函数表达式本身，
// 其他地方都不可用。这种写法的用处有两个，一个是可以在函数体内部调用自身，二是方便除错（出错工具显示
// 函数调用栈时，将显示函数名，而不再显示这里的一个匿名函数）。
// 因此，下面的形式声明函数也非常常见。
// var f = function f() {};
// 需要注意的是，函数的表达式需要在语句的结尾加上分号，表示语句结束。而函数的声明在结尾的大括号后面
// 不用加分号。总的来说，这两种申明函数的方式，差别很细微，可以近似认为是等价的。

// Function 构造函数
var add = new Function(
    'x',
    'y',
    'return x + y'
);
console.log(add(1, 2))
// 3
// 等同于
function add(x, y) {
    return x + y;
}
console.log(add(1, 2))
// 3

// 上面的代码中，Function 构造函数接受三个参数，除了最后一个参数是 add 函数的"函数体",
// 其他参数都是 add 函数的参数。
// 你可以传递任意数量的参数给 Function 构造函数，只有最后一个参数会被当做函数体，如果只有
// 一个参数，该参数就是函数体
var foo = new Function(
    'return "hello world";'
);
console.log(foo())
// hello world
// 等同于
function foo() {
    return 'hello world';
}
console.log(foo())
// hello world

// 总的来说，这种声明函数的方式非常不直观，几乎无人使用。


// 函数的重复声明
// 如果一个函数被多次声明，后面的声明就会覆盖前面的声明
function f() {
    console.log(1);
}
f()
// 1
// 如果没有下面的函数f()重复声明显示上面的结果
// 2
function f() {
    console.log(2);
}
f()
// 2
// 上面代码中，后一次的函数声明覆盖了前面一次。而且，由于函数名的提升，
// 前一次声明在任何时候都是无效的，这一点要特别注意。


// 圆括号运算符
// 调用函数时，要使用圆括号运算符。圆括号之中，可以加入函数的参数
function add(x, y) {
    return x + y;
}
console.log(add(1, 1))
// 2

// return 语句
// 函数体内部的 return 语句，表示返回。JavaScript 引擎遇到 return 语句，就直接返回
// return 后面的那个表达式的值，后面即使还有语句，也不会得到执行。也就是说，return
// 语句所带的那个表达式，就是函数的返回值。return 语句不是必需的，如果没有的话，该
// 函数就不返回任何值，或者说返回 undefined

// 递归
// 函数可以调用自身，这就是递归(recursion)。下面就是通过递归，计算斐波那契数列的代码
function fib(num) {
    if (num == 0)
        return 0;
    if (num == 1)
        return 1;
    return fib(num - 2) + fib(num -1);
}
console.log(fib(6))
// 8

// 第一等公民
// JavaScript 语言将函数看作一种值，与其它值（数值、字符串、布尔值等等）地位相同。
// 凡是可以使用值的地方，就能使用函数。比如，可以把函数赋值给变量和对象的属性，也
// 可以当做参数传入其他函数，或者作为函数的结果返回。函数只是一个可以执行的值，此
// 外并无特殊之处
// 由于函数与其他数据类型地位平等，所以在 JavaScript 语言中又称函数为第一等公民
function add(x, y) {
    return x + y;
}

// 将函数赋值给一个变量
var operator = add;

function a(op) {
    return op;
}
console.log(a(add)(1, 1))
// 2

// 函数名的提升
// JavaScript 引擎将函数名视同变量名，所以采用 function 命令声明函数时，整个函数会像
// 变量声明一样，被提升到代码头部。所以下面的代码不会报错。
func();

function func() {}

// 表面上，上面代码好像是在声明之前就调用了函数f。但是实际上，由于"变量提升", 函数 f
// 被提升到了代码头部，也就是在调用之前已经声明了。
// 但是，如果采用赋值语句定义函数，JavaScript 就会报错
// f1();
// var f1 = function () {};
// f1 is not a function
// 等同于
// var f1;
// f1();
// f1 = function () {};
// f1 is not a function

// 注意，如果像下面例子那样，采用 function 命令和 var 赋值语句声明同一个函数，由于存在
// 函数提升，最后会采用 var 赋值语句的定义
var f = function () {
    console.log('1');
}

function f() {
    console.log('2');
}

f();
// 1
// 上面例子中，表面上后面声明的函数 f，应该覆盖前面 var 赋值语句，但是由于存在函数提升，
// 实际上正好反过来

// 函数的属性和方法
function f1() {}
console.log(f1.name)
// f1

var f2 = function () {};
console.log(f2.name)
// f2

var f3 = function myName() {};
console.log(f3.name)
// myName

// name 属性的一个用处，就是获取参数函数的名字
var myFunc = function () {};

function test(f) {
    console.log(f.name);
}

test(myFunc)
// myFunc

var mf = myFunc
test(mf)
// myFunc

// 上面代码中，函数 test 内部通过 name 属性，就可以知道传入的参数是什么函数


// 函数的 length 属性返回函数预期传入的参数个数，即函数定义之中的参数个数
function fl(a, b) {}
console.log(fl.length)
// 2
// 上面代码定义了空函数 f，它的 length 属性就是定义时的参数个数。不管调用时输入了
// 多少个参数，length 属性始终等于2
// length 属性提供了一种机制，判断定义时和调用时参数的差异，以便实现面向对象编程的
// "方法重载"(overload)

// toString()
// 函数 toString() 方法返回一个字符串，内容是函数的源码
function fs() {
    a();
    b();
    c();
}
console.log(fs.toString())
// function fs() {
//     a();
//     b();
//     c();
// }

// 对于那些原生的函数，toString() 方法返回 function () {[native code]}
console.log(Math.sqrt.toString())
// function sqrt() { [native code]  }

// 函数内部的注释也可以返回
function fm() {/*
    这是一个
    多行注释
*/}
console.log(fm.toString())
// function fm() {/*
//     这是一个
//     多行注释
// */}

var multiline = function (fn) {
    var arr = fn.toString().split('\n');
    return arr.slice(1, arr.length - 1).join('\n');
};

console.log(multiline(fm));
//    这是一个
//    多行注释

// 函数作用域

// 全局变量
var v = 1;
function fs() {
    console.log(v);
}

fs()
// 1

// 局部变量
function fl() {
    var l = 1;
}
// console.log(l);
// ReferenceError: v is not defined

var v = 1;
function fsl() {
    var v = 2;
    console.log(v);
}
fsl()
// 2
console.log(v)
// 1

// 注意，对于 var 命令来说，局部变量只能在函数内部声明，在其他区域中声明，一律
// 都是全局变量
if (true) {
    var x = 5;
}
console.log(x);
// 5
// 上面代码中，变量 x 在条件判断区块之中声明，结果就是一个全局变量，可以在区块之外读取

// 函数内部的变量提升
function foo(x) {
    if (x > 100) {
        var tmp = x - 100;
    }
}
// 等同于
function foo(x) {
    var tmp;
    if (x > 100) {
        tmp = x - 100;
    }
}

// 函数本身的作用域
// 函数本身也是一个值，也有自己的作用域。它的作用域与变量一样，就是其声明所在的作用域，
// 与其运行时所在的作用域无关
var a = 1;
var x = function () {
    console.log(a);
};

function fx() {
    var a = 2;
    x();
}

fx()
// 1

// 很容易犯错的一点是，如果函数 A 调用函数 B, 却没有考虑到函数 B 不会引用函数 A 的
// 内部变量
// var x = function () {
//     console.log(xa);
// };
//
// function y(f) {
//     var xa = 2;
//     f();
// }
//
// y(x)
// ReferenceError: xa is not defined

// 同样的，函数体内部声明的函数，作用域绑定函数体内部
function foo1() {
    var x = 1;
    function bar() {
        console.log(x);
    }
    return bar;
}

var x = 2;
var ff = foo1();
ff();
// 1
// TypeError: ff is not a function
// 上面代码中，函数 foo 内部声明了一个函数 bar，bar 的作用域绑定 foo。当我们在
// foo 外部取出 bar 执行时， 变量 x 指向的是 foo 内部的 x，而不是 foo 外部的 x。
// 正是这种机制，构成了下文要讲解的"闭包"现象


// 参数
function square(x) {
    return x * x;
}

console.log(square(2))
// 4
console.log(square(3))
// 9
console.log(square())
// NaN


// 参数的省略
function fa(a, b) {
    return a;
}

console.log(fa(1, 2, 3))
// 1
console.log(fa(1))
// 1
console.log(fa())
// undefined

console.log(fa.length)
// 2
// 上面代码的函数 f 定义了两个参数，但是运行时无论提供多少个参数（或者不提供参数），
// JavaScript 都不会报错。省略的参数的值就变为 undefined。需要注意的是，函数的 length
// 属性与实际传入的参数的个数无关，只反映函数预期传入的参数的个数

function fu(a, b) {
    return a;
}
// f( , 1)
// SyntaxError: Unexpected token ','
console.log(f(undefined, 1))
// undefined
// 上述代码中，如果省略第一个参数，就会报错

// 传递方式
// 函数参数如果是原始类型的值(数值、字符串、布尔值)，传递方式是传值传递(passes by value)
// 这意味着，在函数体内部修改参数值，不会影响到函数外部
var p = 2;

function fv(p) {
    p = 3;
}
fv(p);
console.log(p);
// 2
// 上面的代码中，变量 p 是一个原始类型的值，传入函数 f 的方式四传值传递。因此，在函数内部，
// p 的值是原始值的拷贝，无论怎么修改，都不会影响到原始值

// 但是，如果函数参数是复合类型的值(数组、对象、其他函数)，传递方式是传址传递(pass by reference)
// 也就是说，传入函数的原始值的地址，因此在函数内部修改参数，将会影响到原始值
var obj = {p: 1};

function fr(o) {
    o.p = 2;
}
fr(obj);
console.log(obj.p)
// 2

// 注意，如果函数内部修改的，不是参数对象的某个属性，二十替换掉整个参数，这时不会影响到原始值
var obj = [1, 2, 3];

function fc(o) {
    o = [2, 3, 4];
}
fc(obj);

console.log(obj)
// [ 1, 2, 3 ]
// 上面代码中，在函数 fc() 内部，参数对象 obj 被整个替换成另一个值。这时不会影响到原始值。
// 这是因为，形式参数(o)的值实际是参数 obj 的地址，重新对 o 赋值导致 o 指向另一个地址，保存
// 在原地址上的值当然不受影响


// 同名参数
// 如果有同名的参数，则取最后出现的那个值
function fs(a, a) {
    console.log(a);
}

fs(1, 2)
// 2
// 上面代码中，函数 fs() 有两个参数，且参数都是 a。取值的时候，以后面的 a 为准，即使后面的 a 没有值
// 或被省略，也是以其为准
function ft(a, a) {
    console.log(a);
}

ft(1)
// undefined
// 调用函数 f() 的时候，没有提供第二个参数，a 的取值就变成了 undefined。这时，如果要获得第一个 a
// 的值，可以使用 arguments 对象
function funcarg0(a, a) {
    console.log(arguments[0]);
}

funcarg0(1)
// 1

// arguments 对象
var fargs = function (one) {
    console.log(arguments[0]);
    console.log(arguments[1]);
    console.log(arguments[2]);
}

fargs(1, 2, 3)
// 1
// 2
// 3

var fcargs = function (a, b) {
    arguments[0] = 3;
    arguments[1] = 2;
    return a + b;
}
console.log(fcargs(1, 1))
// 5
// 上面代码中，函数 fcargs() 调用时传入的参数，在函数内部被修改为 3 和 2

// 严格模式下，arguments 对象与函数参数不具有联动关系。也就是说，修改
// arguments 对象不会影响到实际的函数参数
var fus = function (a, b) {
    'use strict'; // 开启严格模式
    arguments[0] = 3;
    arguments[1] = 2;
    return a + b;
}
console.log(fus(1, 1))
// 2
// 上面代码中，函数体内是严格模式，这时修改 arguments 对象，不会影响到真实参数 a 和 b

// 通过 arguments 对象的 length 属性，可以判断函数调用时到底带几个参数
function fal() {
    return arguments.length;
}
console.log(fal(1, 2, 3))
// 3
console.log(fal(1))
// 1
console.log(fal())
// 0

// arguments 与数组的关系
// 需要注意的是，虽然 arguments 很像数组，但它是一个对象。数组专有的方法（比如
// alice 和 forEach），不能在 arguments 对象上直接使用。
// 如果要让 arguments 对象使用数组方法，真正的解决方法是将 arguments 转为真正的数组。
// 下面是两种常用的转换方法: slice 方法和逐一填入新数组
function args2array() {
    console.log(arguments);
    var args = Array.prototype.slice.call(arguments);
    // or
    var args;
    for (var i = 0; i < arguments.length; i++) {
        args.push(arguments[i]);
    }
    return args;
}

console.log(args2array(1, 2, 3))
// [Arguments] { '0': 1, '1': 2, '2': 3  }
// [ 1, 2, 3, 1, 2, 3  ]


// arguments 对象带有一个 callee 属性，返回它所对应的原函数
var fca = function () {
    console.log(arguments.callee === fca);
}

fca()
// true
// 可以通过 arguments.callee, 达到调用函数自身的目的。这个属性在严格模式里面
// 是禁用的，因此不建议使用


// 闭包
function fout() {
    var n = 999;
    function fin() {
        console.log(n);
    }
    return fin;
}
var result = fout();
result();
// 999
// 上面代码中，函数 fout 的方回执就是函数 fin， 由于 fin 可以读取 fout 的内部变量，
// 所以就可以在外部获得 fout 的内部变量了。

// 闭包就是函数 fin，即能够读取其他函数内部变量的函数。由于 JavaScript 语言中，只有
// 函数内部的子函数才能读取内部变量，因此可以把闭包简单理解成"定义在一个函数内部的函数"。
// 闭包最大的特点，就是它可以"记住"诞生的环境，比如 fin 记住了它诞生的环境 fout，所以从
// fin 可以 得到 fout 的内部变量。在本质上，闭包就是将函数内部和函数外部链接起来的一座桥梁

// 闭包的最大用处有两个，一个是可以读取外层函数内部的变量，另一个是让这些变量始终保持在内存中，
// 即闭包可以使得它诞生环境一直存在。
// 请看下面的例子，闭包使得内部变量记住了上一次调用时的运算结果
function createIncrementor(start) {
    return function () {
        return start++;
    };
}

var inc = createIncrementor(5);
console.log(inc())
// 5
console.log(inc())
// 6
console.log(inc())
// 7

// 上面代码中，start 是函数 createIncrementor 的内部变量。通过闭包，start 的状态被保留了，
// 每一次调用都是在上一次调用的基础上进行计算。从中可以看到，闭包 inc 使得函数 createIncrementor
// 的内部环境，一直存在。所以，闭包可以看作是函数内部作用域的一个接口。
// 为什么闭包能够返回外层函数的内部变量？原因是闭包(上例的 inc)用到了外层变量(start)，导致外层函数
// (createIncrementor)不能从内存释放。只要闭包没有被垃圾回收机制清除，外层函数提供的运行环境也不会被清除，
// 它的内部变量就始终保存着当前值，供闭包读取。

// 闭包的另一个用处，是封装对象的私有属性和私有方法
function Person(name) {
    var _age;
    function setAge(n) {
        _age = n;
    }
    function getAge() {
        return _age;
    }

    return {
        name: name,
        getAge: getAge,
        setAge: setAge
    };
}

var p1 = Person('张三');
p1.setAge(25);
console.log(p1.getAge());
// 25
// 上面代码中，函数 Person 的内部变量 _age, 通过闭包 getAge 和 setAge, 变成了返回对象 p1 的私有变量

// 注意，外层函数每次运行，都会生成一个新的闭包，而这个闭包又会保留外层函数的内部变量，所以内存消耗
// 很大。因此不能滥用闭包，否则会造成网页的性能问题。


// 立即调用的函数表达式(IIFE)

// 根据 JavaScript 的语法，圆括号 () 跟在函数名之后，表示调用该函数。比如，print() 就表示调用 print函数。
// 有时，我们需要在定义函数之后，立即调用该函数。这时，你不能在函数的定义之后加上圆括号，这会产生语法错误。
// function () { /* code */ }();
// SyntaxError: Function statements require a function name
// function errorFuncUse() { /* code */ }();
// SyntaxError: Unexpected token ')'
// 产生这个错误的原因是，function 这个关键字即可以当作语句，也可以当作表达式。

// 语句
function f() {}

// 表达式
var f = function f() {}

// 当作表达式时，函数可以定义后直接加圆括号调用
var one = function f() {return 1}();
console.log(one);
// 1
console.log(typeof one);
// number
// 上面的代码中，函数定义后直接加圆括号调用，没有报错。原因就是 function 作为表达式，
// 引擎就把函数定义当做一个值。这种情况下，就不会报错。

// 为了避免解析的歧义，JavaScript 规定，如果 function 关键字出现在行首，一律解释成语句。
// 因此，引擎看到行首是 function 关键字之后，认为这一段都是函数的定义，不应该以圆括号结尾，
// 所以就报错了。

// 函数定义后立即调用的解决方法，就是不要让 function 出现在行首，让引擎将其理解成一个表达式。
// 最简单的处理，就是将其放在一个圆括号里面。
(function () { /* code */ }());
(function () { /* code */ })();
// 上面两种写法都是以圆括号开头，引擎就会认为后面跟的是一个表达式，而不是函数定义语句，所以就可以避免了错误。
// 这就叫做"立即调用的函数表达式" (Immediately-Invoked Function Expression)，简称 IIFE。

// (function () { /* code */ }())
// (function () { /* code */ }())
// 上面两行之间没有分号，JavaScript 会将它们连在一起解释，将第二行解释为第一行的参数。

// 推而广之，任何让解释器以表达式来处理函数定义的方法，都能产生同样的效果，比如下面三种写法。
var i = function () {return 10;}();
true && function () {/* code */}();
0, function (){/* code */}();
//甚至像下面这样写，也是可以的
!function () { /* code */ }();
~function () { /* code */ }();
-function () { /* code */ }();
+function () { /* code */ }();

// 通常情况下，只对匿名函数使用这种"立即执行的函数表达式"。它的目的有两个：
// 一是 不必为函数命名，避免了污染全局变量；
// 二是 IIFE 内部形成了一个单独的作用域，可以封装一些外部无法读取的私有变量。

// 写法一
// var tmp = newData;
// processData(tmp);
// storeData(tmp);

// 写法二
// (function () {
//     var tmp = newData;
//     processData(tmp);
//     storeData(tmp);
// }())
// 上面代码中，写法二比写法一更好，因为完全避免了污染全局变量。


// eval 命令
// eval 命令接受一个字符串作为参数，并将这个字符串当作语句执行
eval('var a = 1;');
console.log(a);
// 1
// 上面代码将字符串当作语句运行，生成了变量 a


// 如果参数字符串无法当作语句运行，那么就会报错
// eval('3x');
// SyntaxError: Invalid or unexpected token

// 放在 eval 中的字符串，应该有独自存在的意义，不能用来与 eval 以外的命令配合使用。
// 举例来说，下面的代码将会报错
// eval('return;');
// SyntaxError: Illegal return statement
// 上面代码会报错，因为 return 不能单独使用，必须在函数中使用

// 如果 eval 的参数不是字符串，那么会原样返回
console.log(eval(123));
// 123

// eval 没有自己的作用域，都在当前作用域内执行，因此可能会修改当前作用域的变量的值，造成安全问题
var a = 1;
eval('a = 2');
console.log(a);
// 2
// 上面代码中，eval 命令修改了外部变量 a 的值，由于这个原因，eval 有安全风险。
// 为了防止这种风险，JavaScript 规定，如果使用严格模式，eval 内部声明的变量，
// 不会影响到外部作用域
// (function f() {
//     'use strict';
//     eval('var foox = 123');
//     console.log(foox)
// })();
// ReferenceError: foox is not defined
// 上面代码中，函数 f 内部是严格模式，这时 eval 内部声明的 foo 变量，就不会影响到外部。
// 不过，即使在严格模式下，eval 依然可以读写当前作用域的变量
(function f() {
    'use strict';
    var foo = 1;
    eval('foo = 2')
    console.log(foo);
})();
// 2
// 上面代码中，严格模式下，eval 内部还是改写了外部变量，可见安全风险依然存在

// 总之，eval 的本质是在当前作用域之中，注入代码。由于安全风险和不利于JavaScript引擎
// 优化执行速度，所以一般不推荐使用。通常情况下，eval 最常见的场合是解析 JSON 数据的字符串，
// 不过正确的做法应该是使用原生的 JSON.parse 方法


// eval 的别名调用
// 前面说过 eval 不利于引擎优化执行速度。更麻烦的是，还有下面这种情况，引擎在静态代码分析阶段，
// 根本无法分辨执行的是 eval
var m = eval;
m('var x1 = 1');
console.log(x1);
// 1
// 上面代码中，变量 m 是 eval 的别名。静态代码分析阶段，引擎分辨不出 m('var x1 = 1') 执行的是
// eval 命令

// 为了保证 eval 的别名不影响代码优化，JavaScript 的标准规定，凡是使用别名执行 eval, eval 内部
// 一律是全局作用域
// var aa = 1;
//
// function fe() {
//     var aa = 2;
//     var e = eval;
//     e('console.log(aa)');
// }
//
// fe();
// 1
// ReferenceError: aa is not defined

// 上面代码中，eval 是别名调用，所以即使它是在函数中，它的作用域还是全局作用域，
// 因此对输出 a 为全局变量。这样的话，引擎就能确认 e() 不会对当前的作用域产生
// 影响，优化的时候就可以把这一行排除掉

eval.call(null, 'console.log("eval")');
// window.eval('console.log("window.eval")');
(1, eval)('console.log("(1, eval)")');
(eval, eval)('console.log("(eval, eval)")');
// 上面这些形式都是 eval 的别名调用，作用域都是全局作用域
