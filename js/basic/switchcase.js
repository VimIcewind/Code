// 需要注意的是，switch 语句后面的表达式，与 case 语句后面的表示比较运行结果时，
// 采用的是严格相等运算符 (===)，而不是相等运算符 (==)，这意味着比较时不会发生类型转换
var x = 1;

switch (x) {
case true:
    console.log('x 发生类型转换')
    break;
default:
    console.log('x 没有发生类型转换')
}
