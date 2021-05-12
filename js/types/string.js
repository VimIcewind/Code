console.log('abc')
console.log("abc")
console.log('key = "value"')
console.log("It's a long journey")
console.log('Did she say \'Hello\'?')
console.log("Did she say \"Hello\"?")

var longString = 'Long \
long \
long \
string';

console.log(longString)
// "Long long long string"

var longString1 = 'Long '
+ 'long '
+ 'long '
+ 'string';

console.log(longString1)
// "Long long long string"

console.log((function () { /*
line 1
line 2
line 3
*/}).toString().split('\n').slice(1, -1).join('\n'))

console.log('1\n2')
// 1
// 2

console.log('\251')
// ©
console.log('\xA9')
// ©
console.log('\u00A9')
// ©

console.log('\172' === 'z')
// true
console.log('\x7A' === 'z')
// true
console.log('\u007A' === 'z')
// true

// 如果在非特殊字符前面使用反斜杠，则反斜杠会被省略
console.log('\a')
// a

console.log("Prev \\ Next")
// Prev \ Next
