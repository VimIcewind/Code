function countdown(n) {
    while (n --> 0)
        console.log(n);
}

countdown(3)
// 2
// 1
// 0
// 上面代码中，n --> 0 实际上会当做 n-- > 0, 因此输出 2 1 0
