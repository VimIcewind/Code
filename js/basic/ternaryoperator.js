var n = 2;
var even = (n % 2 === 0) ? true : false;
console.log(n)
console.log(even)
// 等价于
var even;
if (n % 2 === 0) {
    even = true;
} else {
    even = false;
}
console.log(n)
console.log(even)

var myVar;
console.log(
    myVar ?
    'myVar has a value' :
    'myVar does not have a value'
)

var msg = '数字' + n + '是' + (n % 2 === 0 ? '偶数' : '奇数')
console.log(msg)
