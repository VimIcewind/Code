var obj = {
    foo: 'Hello',
    bar: 'World'
};

console.log(obj);
// { foo: 'Hello', bar: 'World'  }

var obj = {
    'foo': 'Hello',
    'bar': 'World'
};
console.log(obj);
// { foo: 'Hello', bar: 'World'  }

var obj = {
    1: 'a',
    3.2: 'b',
    1e2: true,
    1e-2: true,
    .234: true,
    0xFF: true
};
console.log(obj);
// {
//     '1': 'a',
//     '100': true,
//     '255': true,
//     '3.2': 'b',
//     '0.01': true,
//     '0.234': true
// }
console.log(obj['100']);
// true

// 报错
// var obj = {
//     1p: 'Hello World'
// };

var obj = {
    '1p': 'Hello World',
    'h w': 'Hello World',
    'p+q': 'Hello World'
};
console.log(obj);
// { '1p': 'Hello World', 'h w': 'Hello World', 'p+q': 'Hello World'  }

var obj = {
    p: function (x) {
        return 2 * x;
    }
};
console.log(obj.p(1))
// 2

var o1 = {};
var o2 = {bar: 'hello'};

o1.foo = o2;
console.log(o1.foo.bar);
// hello

// 对象的属性之间用逗号分隔，最后一个属性后面可以加逗号(trailing comma), 也可以不加
var obj = {
    p: 123,
    m: function () {},
};
// 上面的代码中，m 属性后面的那个逗号，有没有都可以

// 属性可以动态创建，不必在对象声明时就指定
var obj = {};
obj.foo = 123;
console.log(obj.foo)

var o1 = {};
var o2 = o1;

o1.a = 1;
console.log(o2.a)
// 1

o2.b = 2;
console.log(o1.b)
// 2

var o1 = {};
var o2 = o1;
// 此时, 如果取消某一个变量对于原对象的引用，不会影响到另一个变量
o1 = 1;
console.log(o2)
// {}

// 但是，这种引用只局限于对象，如果两个变量指向同一个原始类型的值。那么
// 变量这时都是值的拷贝
var x = 1;
var y = x;

x = 2;
console.log(y)
// 1
// 上面的代码中，当 x 的值发生变化后，y 的值并不变，这就表示 y 和 x 并不是
// 指向同一个内存地址

// 无法确定是对象还是代码块，一律解释为代码块
console.log({ foo: 123 })
// { foo: 123 }

// object
console.log(typeof { foo: 123 })

{ console.log(123) }
// 123

// 如果要解释为对象，最好在大括号前加上圆括号。因为圆括号的里面，只能是表达式，
// 所以确保大括号只能解释为对象
console.log(({ foo: 123 }))
// { foo: 123 }
// ({ console.log(123) })
// 错误

// 这种差异在 eval 语句（作用是对字符串求值）中反映最明显
console.log(eval('{foo: 123}'))
// 123
console.log(eval('({foo: 123})'))
// { foo: 123 }
// 上面代码中，如果没有圆括号，eval 将其理解为一个代码块；加上圆括号后，就
// 理解成一个对象

// 属性的读取
// 读取对象的属性，有两种方法，一种是使用点运算符，还有一种是使用方括号运算符
var obj = {
    p: 'Hello World'
};

console.log(obj.p)
// Hello World
console.log(obj['p'])
// Hello World

// 请注意，如果使用方括号运算符，键名必须放在引号里面，否则会被当作变量处理
var foo = 'bar';
var obj = {
    foo: 1,
    bar: 2
};

console.log(obj.foo)
// 1
console.log(obj[foo])
// 2
console.log(obj['foo'])
// 1

// 方括号运算符内部还可以使用表达式
console.log(obj['hello' + ' wrold'])
// undefined
console.log(obj[3 + 3])
// undefined

// 数字键可以不加引号，因为会自动转成字符串
var obj = {
    0.7: 'Hello World'
};

console.log(obj['0.7'])
console.log(obj[0.7])

// 注意，数值键名不能使用点运算符（因为会被当成小数点），
// 只能使用方括号运算符
var obj = {
    123: 'hello world'
};
// console.log(obj.123)
// 报错
console.log(obj[123])
// hello world

// 属性的赋值
// 点运算符和方括号运算符，不仅可以用来读取值，还可以用来赋值
var obj = {};

obj.foo = 'Hello';
obj['bar'] = 'world';
console.log(obj)
// { foo: 'Hello', bar: 'world'  }

// JavaScript 允许属性的"后绑定", 也就是说，你可以在任意时刻新增属性，
// 没必要在定义对象的时候，就定义好属性
var obj = {p: 1};
console.log(obj)
// { p: 1 }
// 等价于
var obj = {};
obj.p = 1;
console.log(obj)
// { p: 1 }

// 属性的查看
// 查看一个对象本身的所有属性，可以使用 Object.keys 方法
var obj = {
    key1: 1,
    key2: 2
};

console.log(Object.keys(obj));
// ['key1', 'key2']


// 属性的删除: delete 命令
// delete 命令用于删除对象的属性，删除成功后返回true

var obj = { p: 1 };
console.log(Object.keys(obj));
// [ 'p' ]
delete obj.p;
console.log(obj.p);
// undefined
console.log(Object.keys(obj));
// []

// 注意，删除一个不存在的属性，delete 不报错，而且返回 true
var obj = {};
console.log(delete obj.p)
// true
// 上面代码中，对象 obj 并没有 p 属性，但是 delete 命令照样返回 true.
// 因此，不能根据 delete 命令的结果，认定某个属性是存在的

// 只有一种情况，delte 命令会返回 false, 俺就是该属性存在，且不得删除
var obj = Object.defineProperty({}, 'p', {
    value: 123,
    configurable: false
});

console.log(obj.p)
// 123
console.log(delete obj.p)
// false

// 另外，需要注意的是，delete 命令只能删除对象本身的属性，无法删除继承的属性
var obj = {};
console.log(delete obj.toString)
// true
console.log(obj.toString)
// ƒ toString() { [native code]  }
// [Function: toString]
// 上面的代码中，toString 是对象 obj 继承的属性，虽然 delete 命令返回 true,
// 但该属性并没有被删除，依然存在。这个例子还说明，及时 delete 返回 true，该属性
// 依然可能读取到值

// 属性是否存在：in 运算符
var obj = {p: 1};
console.log('p' in obj)
// true
console.log('toString' in obj)
// true
// in 运算符的一个问题是，它不能识别哪些属性是对象自身的，哪些属性是继承的。
// 就像上面代码中，对象 obj 本身并没有 toString 属性，但是 in 运算符会返回 true，
// 因为这个属性是继承的
// 这时，可以使用对象的 hasOwnProperty 方法判断一下，是否为对象自身的属性
var obj = {};
if ('toString' in obj) {
    console.log(obj.hasOwnProperty('toString'))
    // false
}

// 属性的遍历: for...in 循环
var obj = {a: 1, b: 2, c: 3};

for (var i in obj) {
    console.log('键名:', i);
    console.log('键值:', obj[i]);
}
// 键名: a
// 键值: 1
// 键名: b
// 键值: 2
// 键名: c
// 键值: 3

// for...in 循环有两个使用注意点
// 它遍历的是对象所有可遍历(enumerable)的属性，会跳过不可遍历的属性
// 它不仅遍历对象自身的属性，还遍历继承的属性

// 举例来说，对象都继承了 toString 属性，但是 for...in 循环不会遍历到这个属性
var obj = {};
// toString 属性是存在的
console.log(obj.toString)
// ƒ toString() { [native code]  }
// [Function: toString]

for (var p in obj) {
    console.log(p);
}
// 没有任何输出
// 上面代码中，对象 obj 继承了 toString 属性，该属性不会被 for...in 循环遍历到，
// 因为它模式是"不可遍历"的。


// 如果继承的属性是可遍历的，那么就会被 for...in 循环遍历到。但是，一般情况下，
// 都是只想遍历对象的自身的属性，所以使用 for...in 的时候，应该结合使用 hasOwnProperty
// 方法，在循环内部判断一下，某个属性是否为对象自身的属性
var person = { name: '老张' };

for (var key in person) {
    if (person.hasOwnProperty(key)) {
        console.log(key);
    }
}
// name

// with 语句
// with 语句的格式如下：
// with (对象) {
//    语句；
// }
// 它的作用是操作同一个对象的多个属性时，提供一些书写的方便

var obj = {
    p1: 1,
    p2: 2,
};

with (obj) {
    p1 = 4;
    p2 = 5;
}
// 等同于
obj.p1 = 4;
obj.p2 = 5;


// with (document.links[0]) {
//     console.log(href);
//     console.log(title);
//     console.log(style);
// }
// 等同于
// console.log(document.links[0].href);
// console.log(document.links[0].title);
// console.log(document.links[0].style);

// 注意，如果 with 区块内部有变量的赋值操作，必须是当前对象已经存在的属性，否则会
// 创造一个当前作用域的全局变量
var obj = {};
with (obj) {
    p1 = 4;
    p2 = 5;
}

console.log(obj.p1)
// undefined
console.log(p1)
// 4

// 上面代码中，对象 obj 并没有 p1 属性，对 p1 赋值等于创造了一个全局变量 p1 。正确
// 的写法应该是，先定义对象 obj 的属性 p1, 然后在 with 区块内操作它

// 这时因为 with 区块没有改变作用域，它的内部依然是当前作用域。这造成了 with 语句的
// 一个很大的弊病，就是绑定对象不明确
with (obj) {
    console.log(x);
}
// 单纯从上面的代码块，根本无法判断 x 到底是全局变量，还是对象 obj 的一个属性。这非常
// 不利于代码的除错和模块化，编译器也无法对这段代码进行优化，只能留到运行时判断，这就拖慢了
// 运行速度。因此，不建议使用 with 语句，可以考虑用一个临时变量代替 with

// with (obj1.obj2.obj3) {
//     console.log(p1 + p2)
// }
// 可以写成
// var temp = obj1.obj2.obj3;
// console.log(temp.p1 + temp.p2)
