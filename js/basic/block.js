// JavaScript 使用大括号，将多个相关的语句组合在一起，成为"区块" (block)
// 对于 var 命令来说，JavaScript 的区块不构成单独的作用域(scope)
{
    var a = 1;
}

console.log(a) // 1

// 上面代码在区块内部，使用 var 命令声明并赋值了变量 a，然后在区块外部，变量 a 依然有效，
// 区块对于 var 命令不构成单独的作用域，与不是用区块的情况没有任何区别。
// 在 JavaScript 语言中，单独使用区块并不常见，区块往往用来构成其他更复杂的语法结构，比如
// for、if、while、function 等
