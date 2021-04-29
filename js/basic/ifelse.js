var m = 1;
var n = 2;

if (m !== 1)
    if (n === 2)
        console.log('hello');
    else
        console.log('world');
// else 代码块总是与离自己最近的那个if语句配对
if (m !== 1) {
    if (n === 2) {
        console.log('hello');
    } else {
        console.log('world');
    }
}

if (m !== 1)
    if (n === 2)
        console.log('hello');
    else
        console.log('hello');
else
    console.log('!');
// else 代码块总是与上面离自己最近的那个未被else配对的if语句配对
if (m !== 1) {
    if (n === 2) {
        console.log('hello');
    } else {
        console.log('world');
    }
} else {
    console.log('!');
}
