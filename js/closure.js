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
