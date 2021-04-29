top:
for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
        if (i === 1 && j === 1)
            break top;
        console.log('i=' + i + ', j=' + j);
    }
}

// 标签也可以用于跳出代码块
foo: {
    console.log(1);
    break foo;
    console.log('本行不会输出');
}
console.log(2);

topfor:
for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
        if (i === 1 && j === 1)
            continue topfor;
        console.log('i=' + i + ', j=' + j);
    }
}
