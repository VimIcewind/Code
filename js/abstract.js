// const cube = x => x * x * x;
// const square = x => x * x;

const power = (x, n) => n === 0 ? 1 : x * power(x, n - 1);
const cube = x => power(x, 3);
const square = x => power(x, 2);

console.log(cube(3));
console.log(square(2));

