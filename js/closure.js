// 闭包是一种保护私有变量的机制，在函数执行时形成私有的作用域，保护里面的私有变量不受外界干扰。
// 直观的说就是形成一个不销毁的栈环境。
var add = (function() {
    var counter = 0;
    return function () {return counter += 1;}
})();

var counter = 10;
add();
add();
var result = add();
console.log(result);

for (var counter = 0; counter < 10; counter++) {
    var result = add();
    console.log(result);
}



function a() {
    var i = 0;
    return function b() {
        console.info(++i);
    };
};

var c = a();

for (var i = 0; i < 10; i++) {
    c();
}
