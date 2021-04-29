switch (1 + 3) {
case 2 + 2:
    f();
    break;
default:
    neverHappens();
}

function f() {
    console.log('f()')
}
