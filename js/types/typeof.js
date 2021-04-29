console.log(typeof 123)   // "number"
console.log(typeof '123') // "string"
console.log(typeof false) // "boolean"

function f() {}
console.log(typeof f)   // "function"

console.log(typeof undefined)   // "undefined"

// v
// ReferenceError: v is not defined

typeof v
// "undefined"
console.log(typeof v)

// 错误的写法
// if (v) {
       // ...
// }

// 正确的写法
if (typeof v === "undefined") {
    console.log('v is undefined')
}

console.log(typeof window) // "object" in browser and "undefine" in node
console.log(typeof {}) // "object"
console.log(typeof []) // "object"
console.log(typeof null) // "object"
