// 注意，if后面的表达式之中，不要混淆值表达式 (=)、严格相等运算符 (===) 和相等运算符 (==)
// 尤其是赋值表达式不具有比较作用
var x = 1;
var y = 2;

if (x = y) {
    console.log(x);
}
// 上面代码的愿意是，当 x 等于 y 的时候，才执行相关的语句。但是，不小心将严格相等运算符写成赋值表达式，
// 结果变成了将 y 赋值给变量 x，再判断变量 x 的值(等于2) 的布尔值(结果为 true)