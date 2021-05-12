console.log('abc')
console.log("abc")
console.log('key = "value"')
console.log("It's a long journey")
console.log('Did she say \'Hello\'?')
console.log("Did she say \"Hello\"?")

var longString = 'Long \
long \
long \
string';

console.log(longString)
// "Long long long string"

var longString1 = 'Long '
+ 'long '
+ 'long '
+ 'string';

console.log(longString1)
// "Long long long string"

console.log((function () { /*
line 1
line 2
line 3
*/}).toString().split('\n').slice(1, -1).join('\n'))

console.log('1\n2')
// 1
// 2

console.log('\251')
// ©
console.log('\xA9')
// ©
console.log('\u00A9')
// ©

console.log('\172' === 'z')
// true
console.log('\x7A' === 'z')
// true
console.log('\u007A' === 'z')
// true

// 如果在非特殊字符前面使用反斜杠，则反斜杠会被省略
console.log('\a')
// a

console.log("Prev \\ Next")
// Prev \ Next

// 字符串可以被视为字符数组，因此可以使用数组的方括号运算符，用来返回某个位置的字符
var s = 'hello';
console.log(s[0]);
// h
console.log(s[1]);
// e
console.log(s[4]);
// o
// 直接对字符串使用方括号运算符
console.log('hello'[1])
// e

console.log('abc'[3])
// undefined
console.log('abc'[-1])
// undefined
// console.log('abc'[x])
// x is not defined

// 但是，字符串与数组的相似性仅此而已。实际上，无法改变字符串中的的单个字符
var s = 'hello';
delete s[0]
console.log(s)
// hello
s[1] = 'a'
console.log(s)
// hello
s[5] = '!'
console.log(s)
// hello
// 上面的代码表示，字符串内部的单个字符无法改变和增删，这些操作会默默地失败

// length 属性返回字符串的长度，该属性也是无法改变的
var s = 'hello';
console.log(s.length)
// 5
s.length = 3;
console.log(s.length)
// 5
s.length = 7;
console.log(s.length)
// 5
// 上面代码表示字符串的 length 属性无法改变，但是不会报错

// 字符集
// JavaScript 使用 Unicode 字符集。JavaScript 引擎内部，所有字符都用 Unicode表示
var s = '\u00A9';
console.log(s)
// ©

console.log("f\u006F\u006F")
var f\u006F\u006F = 'abc';
console.log(foo)
// abc

// 我们还需要知道，每个字符在 JavaScript 内部都是以 16 位（即2个字节）的 UTF-16 格式
// 储存。也就是说， JavaScript 的单位字符长度固定为 16 位长度，即2个字节
console.log('\u4DC0')
console.log('\u4DC0'.length)

var string = 'Hello World!';
// console.log(btoa(string))
// SGVsbG8gV29ybGQh
// console.log(atob('SGVsbG8gV29ybGQh'))
// Hello Wrold!

function b64Encode(str) {
    return btoa(encodeURIComponent(str));
}

function b64Decode(str) {
    return decodeURIComponent(atob(str));
}

// b64Encode('你好')
// JUU0JUJEJUEwJUU1JUE1JUJE
// b64Decode('JUU0JUJEJUEwJUU1JUE1JUJE')
// 你好
