// 概述
// 比较运算符用于比较两个值的大小，然后返回一个布尔值，表示是否满足指定的条件
console.log(2 > 1);
// true
// 上面代码比较 2 是否大于 1，返回 true
// 注意，比较运算符可以比较各种类型的值，不仅仅是数值

// JavaScript 一共提供了 8 个比较运算符
// > 大于运算符
// < 小于于运算符
// >= 大于或等于运算符
// <= 小于或等于运算符
// == 相等运算符
// === 严格相等运算符
// != 不相等运算符
// !== 严格不相等运算符

// 这八个比较运算符分成两类：相等比较和非相等比较。两者的规则是不一样的，对于非相等比较，算法是
// 先看两个运算子是否都是字符串，如果是的，就按照字典顺序比较（实际是比较Unicode码点）；否则，将
// 两个运算子都转成数值，再不计较数值的大小

// 非相等运算符：字符串的比较
// 字符串按照字典顺序进行比较
console.log('cat' > 'dog');
// false
console.log('cat' > 'catalog');
// false

console.log('cat' > 'Cat');
// true

// 由于所有的字符都有 Unicode 码点，因此汉字也可以比较
console.log('大' > '小');
// false
// 上面代码中，'大'的 Unicode 码点是 22823，'小'的是 23567，因此返回 false

//
console.log(5 > '4');
// 等同于 5 > Number('4')
// 即 5 > 4
// true
console.log(true > false);
// 等同于 Number(true) > Number(false)
// 即 1 > 0
// true
console.log(2 > true);
// true
// 等同于 2 > Number(true)
// 即 2 > 1
// 上面代码中，字符串和布尔值都会先转成数值，再进行比较

// 这里需要注意与 NaN 的比较。 任何值(包括 NaN 本身) 与 NaN 使用非相等运算符进行比较，返回的都是 false
console.log(1 > NaN);
// false
console.log(1 <= NaN);
// false
console.log('1' > NaN);
// false
console.log('1' <= NaN);
// false
console.log(NaN > NaN);
// false
console.log(NaN <= NaN);
// false


// 如果运算子是对象，会转为原始类型的值，再进行比较
// 对象转换成原始类型的值，算法是先调用 valueOf 方法；如果返回的还是对象，再接着调用 toString 方法
var x = [2];
console.log(x > '11');
// true
// 等同于 [2].valueOf().toString() > '11'
// 即'2' > '11'

x.valueOf = function () { return '1' };
console.log(x > '11');
// false
// 等同于 [2].valueOf() > '11'
// 即 '1' > '11'

// 两个对象之间的比较也是如此
console.log([2] > [1]);
// true
// 等同于 [2].valueOf().toString() > [1].valueOf().tostring()
// 即 '2' > '1'

console.log([2] > [11]);
// true
// 等同于 [2].valueOf().toString() > [11].valueOf().tostring()
// 即 '2' > '11'

console.log({x: 2} >= {x: 1});
// true
// 等同于 {x: 2}.valueOf.toString() >= {x: 1}.valueOf().toString()
// 即 '[object Object]' >= '[object Object]'
console.log({x: 2} <= {x: 1});
// true
// 等同于 {x: 2}.valueOf.toString() <= {x: 1}.valueOf().toString()
// 即 '[object Object]' <= '[object Object]'
console.log({x: 2} == {x: 1});
// false

// 相等运算符 与 严格相等运算符
// JavaScript 提供两种相等运算符： == 和 ===
// 简单说，它们的区别是相等运算符 == 比较两个值是否相等，严格相等运算符 === 比较它们是否为"同一个值"。
// 如果两个值不是同一类型，严格相等运算符 === 直接放回 false，而相等运算符 == 会将它们转换成同一个类型，
// 再用严格相等运算符进行比较

// 严格相等运算符

// 不同类型的值
// 如果两个值的类型不同，直接返回 false
console.log(1 === '1');
// false
console.log(true === 'true');
// false

// 同一类的原始类型值
// 同一类型的原始类型的值(数值、字符串、布尔值) 比较时，值相同就返回 true, 值不相同就返回 false
console.log (1 == 0x1);
// true

// 需要注意的是，NaN 与任何值都不相等(包括自身)。另外，+0 等于 -0
console.log(NaN === NaN);
// false
console.log(+0 === -0);
// true

// 复合类型值
// 两个复合类型(对象、数组、函数)的数据比较时，不是比较它们是否相等，而是比较它们是否指向同一个地址
console.log({} === {});
// false
console.log([] === []);
// false
console.log(function () {} === function () {});
// false

// 上面代码分别比较两个空对象、两个空数组、两个空函数，结果都是不相等。原因是对于复合类型的值，严格相等
// 运算符比较的是，它们是否引用同一个内存地址，而运算符两边的空对象、空数组、空函数的值，都存放在不同的
// 内存地址，结果当然是 false

// 如果两个变量引用同一个对象，则它们相等
var v1 = {};
var v2 = v1;
console.log(v1 === v2);
// true

// 注意，对于两个对象的比较，严格相等运算符比较的是地址，而大于或小于运算符比较的是值
var obj1 = {};
var obj2 = {};

console.log(obj1 > obj2);
// false
console.log(obj1 < obj2);
// false
console.log(obj1 === obj2);
// false
// 上面三个比较，前两个比较的是值，最后yge比较的是地址，所以都返回 false
console.log(obj1 == obj2);
// false

// undefined 和 null
// undefined 和 null 与自身严格相等
console.log(undefined === undefined);
// true
console.log(null === null);
// true

// 由于变量声明后默认值是 undefined，因此两个只声明未赋值的变量是相等的
var v3;
var v4;
console.log(v3 === v4);
// true


// 严格不相等运算符
// 严格相等运算符有个对应的严格不相等运算符 !==
// 它的算法就是先求严格相等运算符的结果，然后返回相反值
console.log(1 !== '1');
// true
// 等同于
console.log(!(1 === '1'));
// true



// 相等运算符
// 相等运算符用来比较相同数据类型时，与严格相等运算符完全一样
console.log(1 == 1.0);
// true
console.log(1 === 1.0);
// true

// 比较不同类型的数据时，相等运算符会先将数据进行类型转换，然后再用严格相等运算符比较。
// 下面分成几种情况，讨论不同类型的值互相比较的规则

// 原始类型值
// 原始类型的值会转换成数值再进行比较
console.log(1 == true);
// 等同于 1 === Number(true)
// true

console.log(0 == false);
// 等同于 0 === Number(false)
// true

console.log(2 == true);
// 等同于 2 === Number(true)
// false

console.log(2 == false);
// 等同于 2 === Number(false)
// false

console.log('true' == true);
// false
// 等同于 Number('true') == Number(true)
// 等同于 NaN === 1

console.log('' == 0);
// true
// 等同于 Number('') === 0
// 等同于 0 === 0

console.log('' == false);
// true
// 等同于 Number('') === Number(false)
// 等同于 0 === 0

console.log('1' == true);
// true
// 等同于 Number('1') === Number(true)
// 等同于 1 === 1

console.log('\n 123 \t' == 123);
// true
// 因为字符串转为数字时，省略前置和后置的空格

// 上面代码将字符串和布尔值都转为数值，然后再进行比较


// 对象与原始类型值比较
// 对象（这里指广义的对象，包括数组和函数）与原始类型的值比较时，
// 对象转换成原始类型的值，再进行比较。
// 具体来说，先调用对象的 valueOf() 方法，如果得到原始类型的值，就
// 按照上一小节的规则，互相比较； 如果得到的还是对象，则再调用
// toString() 方法，得到字符串形式，再进行比较
console.log([1] == 1);
// true
console.log([1] == '1');
// true
console.log([1, 2] == '1,2');
// true

console.log([1] == true);
// true
console.log([2] == true);
// false
// 上面的例子中，JavaScript 引擎会先对数组 [1] 调用数组的 valueOf() 方法，
// 由于返回的还是一个数组，所以会接着调用数组的 toString() 方法，得到字符串形式，
// 在按照上一小节的规则进行比较

// 下面是一个更直接的例子
const obj = {
    valueOf: function () {
        console.log('执行 valueOf()');
        return obj;
    },
    toString: function () {
        console.log('执行 toString()');
        return 'foo'
    }
};

console.log(obj == 'foo')
// 执行 valueOf()
// 执行 toString()
// true

// 上面例子中，obj 是一个自定义了 valueOf() 和 toString() 方法的对象。
// 这个对象与字符串'foo' 进行比较时，会依次调用 valueOf() 和 toString()
// 方法，最后返回'foo'，所以比较结果是 true

// undefined 和 null 只有与自身比较，或者互相比较时，才会返回 true；
// 与其他类型的值比较时，结果都为 false
console.log(undefined == undefined)
// true
console.log(null == null)
// true
console.log(undefined == null)
// true

console.log(false == null)
// false
console.log(false == undefined)
// false

console.log(0 == null)
// false
console.log(0 == undefined)
// false

// 相等运算符的缺点
// 相等运算符隐藏的类型转换，会带来一些反直觉的结果
console.log(0 == '')
// true
console.log(0 == '0')
// true
console.log(2 == true)
// false
console.log(2 == false)
// false
console.log(false == 'false')
// false
console.log(false == '0')
// true

console.log(false == undefined)
// false
console.log(false == null)
// false
console.log(null == undefined)
// true

console.log(' \t\r\n ' == 0)
// true

// 上面这些表达式都不同于直觉，很容易出错。因此建议不要使用相等运算符 ==，
// 最好使用严格相等运算符 ===

// 不相等运算符 
console.log(1 != '1')
// false
// 等同于
console.log(!(1 == '1'))
// false

