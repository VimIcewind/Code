var i = 0;

while (i < 100) {
    console.log('i 当前为：' + i);
    i++;
    if (i === 10)
        break;
}

for (var i = 0; i < 5; i++) {
    console.log(i);
    if (i === 3)
        break;
}
