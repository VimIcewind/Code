var u = undefined;
var n = null;

if (!undefined) {
    console.log('undefined is false');
}
// undefined is false

if (!null) {
    console.log('null is false');
}
// null is false

if (!false) {
    console.log('false');
}
// false

if (!0) {
    console.log('0 is false');
}
// 0 is false

if (!'') {
    console.log("'' is false");
}
// '' is false

if (!"") {
    console.log('"" is false');
}
// "" is false


console.log(undefined == null);
// true
console.log(undefined === null);
// false

console.log(Number(null))
// 0
console.log(5 + null)
// 5

console.log(Number(undefined))
// NaN
console.log(5 + undefined)
// NaN

// 变量声明了，但没有赋值
var i;
console.log(i)
// undefined


// 调用函数时，应该提供的参数没有提供，该参数等于 undefined
function f(x) {
    return x;
}
console.log(f())
// undefined
console.log(f() == f(undefined))

// 对象没事有赋值的属性
var o = new Object();
console.log(o.p)
// undefined

// 函数没有返回值时，默认返回 undefined
function f() {}
console.log(f())

// boolean 如果 JavaScript 预期某个位置应该是布尔值，会将该位置上现有的值自动
// 转换为布尔值。转换规则是除了下面六个值被转为 false ，其他值都视为 true
// undefined
// null
// false
// 0
// NaN
// "" 或 '' (空字符串)
if ('') {
    console.log('true');
}
// 没有任何输出


// 注意，空数组[] 和空对象{} 对应的布尔值，都是 true
if ([]) {
    console.log('true');
}
// true

if ([]) {
    console.log('true');
}
// true
