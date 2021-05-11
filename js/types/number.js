// JavaScript 内部，所有数字都是以64位浮点数形式储存，即使整数也是如此
// 所以，1 与 1.0 是相同的，是一个数
console.log(1 === 1.0)
// true

// 由于浮点数不是精确的值，所以涉及小数的比较和运算要特别小心
console.log(0.1 + 0.2)
// 0.30000000000000004
console.log(0.3)
// 0.3
console.log(0.1 + 0.2 === 0.3)
// false

console.log(0.3 / 0.1)
// 2.9999999999999996

console.log((0.3 - 0.2))
// 0.09999999999999998
console.log((0.2 - 0.1))
// 0.1
console.log((0.3 - 0.2) === (0.2 - 0.1))
// false


// 根据国际标准 IEEE 754, JavaScript 浮点数的64个二进制位，从最左边开始，是这样组成的
// 第1位：符号位，0 表示正数，1 表示负数
// 第2位到第12位（共11位）：指数部分
// 第3位到第64位（共52位）：小数部分（即有效数字）

console.log(Math.pow(2, 53))
// 9007199254740992

console.log(Math.pow(2, 53) + 1)
// 9007199254740992

console.log(Math.pow(2, 53) + 2)
// 9007199254740994

console.log(Math.pow(2, 53) + 3)
// 9007199254740996

console.log(Math.pow(2, 53) + 4)
// 9007199254740996

console.log(Math.pow(2, 53))
// 9007199254740992

// 大于2的53次方以后，多出来的有效数字（最后三位的 111）都会无法保存，变成0。
console.log(9007199254740992111)
// 9007199254740992000

// 如果一个数大于2的1024次方，那么就会发生"正向溢出"，即 JavaScript 无法表示这么大的数，
// 这是就会返回 Infinity
console.log(Math.pow(2, 1024))
// Infinity

// 如果一个数小于2的-1075次方（指数部分最小值-1023，再加上小数部分的52位），那么就会
// 发生"负向溢出"，即 JavaScript 无法表示这么小的数，这时会直接放回0
console.log(Math.pow(2, -1075))
// 0

var x = 0.5;

for (var i = 0; i < 25; i++) {
    x = x * x;
}

console.log(x)
// 0

console.log(Number.MAX_VALUE)
// 1.7976931348623157e+308
console.log(Number.MIN_VALUE)
// 5e-324

console.log(123e3)
// 123000
console.log(123e-3)
// 0.123
console.log(-3.1E+12)
// -3100000000000
console.log(.1e-23)
// 1e-24

// 以下两种情况，JavaScript 会自动将数值转为科学计数法表示，其他情况
// 都采用字面形式直接表示
// (1) 小数点前的数字多于21位
console.log(1234567890123456789012)
// 1.2345678901234568e+21
console.log(123456789012345678901)
// 123456789012345680000

// (2) 小数点后的零多余5个
console.log(0.0000003)
// 3e-7
// 否则，就保持原来的字面形式
console.log(0.000003)
// 0.000003

console.log(0)
console.log(+0)
console.log(-0)
console.log(-0 === +0)
// true
console.log(0 === -0)
// true
console.log(0 === +0)
// true

// 几乎所有场合，正零和负零都会被当作正常的0
console.log(+0)
// +0
console.log(-0)
// -0
console.log((-0).toString())
// 0
console.log((+0).toString())
// 0

// 唯一有区别的场合是，+0 或 -0 当作分母，返回的值是不相等的
console.log((1 / +0) === (1 / -0))
// false
console.log((1 / +0))
// Infinity
console.log((1 / -0))
// -Infinity

// NaN Not a Number
console.log(5 - 'x')
// NaN

console.log(Math.acos(2))
// NaN
console.log(Math.log(-1))
// NaN
console.log(Math.sqrt(-1))
// NaN
console.log(0 / 0)
// NaN

// NaN 不等于任何值，包括它本身
console.log(NaN == NaN)
// false

// 数组 indexOf 方法内部使用的是严格相等运算符，所以该方法对 NaN 不成立
console.log([NaN].indexOf(NaN))
// -1

// NaN 在布尔运算符时被当作 false
console.log(Boolean(NaN))
// false

// NaN 与任何数(包括它自己)的运算，得到的都是 NaN
console.log(NaN + 32)
// NaN
console.log(NaN - 32)
// NaN
console.log(NaN * 32)
// NaN
console.log(NaN / 32)
// NaN


// Infinity 表示"无穷"，用来表示两种场景。一种是一个正的数值太大，
// 或者一个负的数值太小，无法表示；另一种是非0数值除以0，得到
// Infinity

console.log(Math.pow(2, 1023))
// 8.98846567431158e+307
console.log(Math.pow(2, 1024))
// Infinity

console.log(0 / 0)
// NaN
console.log(1 / 0)
// Infinity

console.log(Infinity === -Infinity)
// false

console.log(1 / -0)
// -Infinity
console.log(-1 / -0)
// Infinity

// Infinity 大于一切数值(除了NaN)，-Infinity 小于一切数值(除了NaN)
console.log(Infinity > 1000)
// true
console.log(-Infinity < -1000)
// true

// Infinity 与 NaN 比较，总是返回 false
console.log(Infinity > NaN)
// false
console.log(-Infinity > NaN)
// false
console.log(Infinity < NaN)
// false
console.log(-Infinity < NaN)
// false

// Infinity 的四则运算，符合无穷的数学计算规则
console.log(5 * Infinity)
// Infinity
console.log(5 - Infinity)
// -Infinity
console.log(Infinity / 5)
// Infinity
console.log(5 / Infinity)
// 0

// 0 乘以 Infinity，返回 NaN；0 除以 Infinity，返回 0；Infinity 除以0，返回 Infinity
console.log(0 * Infinity)
// NaN
console.log(0 / Infinity)
// 0
console.log(Infinity / 0)
// Infinity

// Infinity 加上或者乘以 Infinity，返回的还是 Infinity
console.log(Infinity + Infinity)
// Infinity
console.log(Infinity * Infinity)
// Infinity

// Infinity 减去或者除以 Infinity，得到NaN
console.log(Infinity - Infinity)
// NaN
console.log(Infinity / Infinity)
// NaN

// Infinity 与 null 计算时，null 会转换成 0，等同于与 0 的计算
console.log(null * Infinity)
// NaN
console.log(null / Infinity)
// 0
console.log(Infinity / null)
// Infinity

// Infinity 与 undefined 计算，返回的都是 NaN
console.log(undefined + Infinity)
// NaN
console.log(undefined - Infinity)
// NaN
console.log(undefined * Infinity)
// NaN
console.log(undefined / Infinity)
// NaN
console.log(Infinity / undefined)
// NaN

// parseInt() 用于将字符串转为整数
console.log('123')
// 123
console.log(typeof '123')
// string
console.log(parseInt('123'))
// 123
console.log(typeof parseInt('123'))
// number

// 如果字符串头部或尾部有空格，空格会被自动去除
console.log(parseInt('    81'))
console.log(parseInt('    81   '))
console.log(parseInt('81    '))

// 如果 parseInt 的参数不是字符串，则会先转为字符串再转换
console.log(parseInt(1.23))
// 1
console.log(parseInt('1.23'))
// 1

// 字符串转为整数的时候，是一个一个字符依次转换，如果遇到不能转为数字的字符，就不再
// 进行下去，返回已经转好的部分
console.log(parseInt('8a'))
// 8
console.log(parseInt('12**'))
// 12
console.log(parseInt('12.34'))
// 12
console.log(parseInt('15e2'))
// 15
console.log(parseInt('15px'))
// 15

// 如果字符串的第一个字符不能转化为数字(后面跟着数字的正负号除外)，返回 NaN
console.log(parseInt('abc'))
// NaN
console.log(parseInt('.3'))
// NaN
console.log(parseInt(''))
// NaN
console.log(parseInt('+'))
// NaN
console.log(parseInt('+1'))
// 1

// 所以，parseInt 的返回值只有两种可能，要么是一个十进制整数，要么是NaN

// 如果字符串以0x或者0X开头，parseInt 会将其按照十六进制数解析
console.log(parseInt('0x10'))
// 16

// 如果字符串是以0开头，将其按照10进行解析
console.log(parseInt('011'))
// 11

// 对于那些会自动转为科学计数法的数字，parseInt 会将科学计数法的表示方法视为字符串，
// 因此导致一些奇怪的结果
console.log(parseInt(1000000000000000000000.5))
// 1
// 等同于
console.log(parseInt('1e+21'))
// 1

console.log(parseInt(100000000000000000000.5))
// 100000000000000000000

console.log(parseInt(0.0000008))
// 8
// 等同于
console.log(parseInt('8e-7'))
// 8

// parseInt 方法还可以接受第二个参数(2到36之间)，表示被解析的值的进制，返回该值对应的十进制。
// 默认情况下，parseInt 的第二个参数为10，即默认是十进制转十进制
console.log(parseInt('1000'))
// 1000
// 等同于
console.log(parseInt('1000', 10))
// 1000


console.log(parseInt('1000', 2))
// 8
console.log(parseInt('1000', 6))
// 216
console.log(parseInt('1000', 8))
// 512

// 如果第二个参数不是数值，会被自动转换成一个整数。这个整数只有在2到36之间，才能得到有意义的结果
// 超过这个范围，则返回NaN。如果第二个参数是0、undefined 和 null，则直接忽略
console.log(parseInt('10', 37))
// NaN
console.log(parseInt('10', 1))
// NaN
console.log(parseInt('10', 0))
// 10
console.log(parseInt('10', null))
// 10
console.log(parseInt('10', undefined))
// 10

// 如果字符串包含对于制定进制无意义的字符，则从最高位开始，只返回可以转换的数值
// 如果最高位无法转换，则直接返回 NaN
console.log(parseInt('1546', 2))
// 1
console.log(parseInt('546', 2))
// NaN

// 如果 parseInt 的第一个参数不是字符串，会被先转为字符串。这会导致一些令人意外的结果
// 下面的代码中，十六进制的0x11 会仙贝转为十进制的17，再转为字符串。然后，再用36进制
// 或者二进制解读字符串17，最后返回结果43和1
console.log(parseInt(0x11, 36))
// 43
console.log(parseInt(0x11, 2))
// 1
// 等同于
console.log(parseInt(String(0x11), 36))
// 43
console.log(parseInt(String(0x11), 2))
// 1
// 等同于
console.log(parseInt('17', 36))
// 43
console.log(parseInt('17', 2))
// 1

// 这种处理方式，对于八进制的前缀0，尤其需要注意
console.log(parseInt(011, 2))
// NaN
// 等同于
console.log(parseInt(String(011), 2))
console.log(parseInt(String(9), 2))
// 上面的代码中，第一行 011 会被先转为字符串9，因为9不是二进制的有效数字，所以返回NaN
// 如果直接计算 parseInt('011', 2), 011则是会被当做二进制处理，返回3
console.log(parseInt('011', 2))
// 3
// JavaScript 不再允许将带有前缀0的数字视为八进制数，二十要求忽略这个0
// 但是，为了保证兼容性，大部分浏览器并没有部署这一条规定


// parseFloat() 用于将一个字符串转为浮点数
console.log(parseFloat('3.14'))
// 3.14
console.log(parseFloat('314e-2'))
// 3.14
console.log(parseFloat('0.0314E+2'))
// 3.14
// 如果字符串不包含不能转为浮点数的字符，则不再进行往后转换，返回已经转好的部分
console.log(parseFloat('3.14more non-digit characters'))
// 3.14

// parseFloat() 会自动过滤字符串前导的空格
console.log(parseFloat('\t\v\r12.34\n'))
// 12.34

// 如果参数不是字符串，或者字符串的第一个字符不能转化为浮点数，则返回NaN
console.log(parseFloat([]))
// NaN
console.log(parseFloat('FF2'))
// NaN
console.log(parseFloat(''))
// NaN
// 上面代码中，尤其值得注意，parseFloat 会将空字符串转为 NaN
// 这些特点使得 parseFloat 的转换结果不同于 Number 函数
console.log(parseFloat(true))
// NaN
console.log(Number(true))
// 1

console.log(parseFloat(null))
// NaN
console.log(Number(null))
// 0

console.log(parseFloat(''))
// NaN
console.log(Number(''))
// 0

console.log(parseFloat('123.45#'))
// 123.45
console.log(Number('123.45#'))
// NaN

// isNaN() 可以用来判断一个值是否为NaN
console.log(isNaN(NaN))
// true
console.log(isNaN(123))
// false

// 但是，isNaN 只对数值有效，如果传入其他值，会仙贝转成数值。比如，传入字符串的时候，
// 字符串会仙贝转成 NaN，所以最后返回 true，这一点特别要引起注意。也就是说，isNaN为
// true的值，有可能不是NaN，而是一个字符串
console.log(isNaN('Hello'))
// true
console.log(isNaN(Number('Hello')))
// true

// 出于同样的原因，对于对象和数组，isNaN也返回true
console.log(isNaN({}))
// true
// 等同于
console.log(isNaN(Number({})))
// true

console.log(isNaN(['xyz']))
// true
// 等同于
console.log(isNaN(Number(['xyz'])))
// true
// 但是，对于空数组和只有一个数值成员的数组，isNaN 返回 false
console.log(isNaN([]))
// false
console.log(isNaN([123]))
// false
console.log(isNaN(['123']))
// false
// 上面代码之所以返回 false，原因是这些数组能被 Number 函数转成数值，请参见《数据类型转换》一章

// 因此，使用isNaN之前，最好判断下数据类型
function myIsNaN(value) {
    return typeof value == 'number' && isNaN(value);
}

// 判断 NaN 更可靠的方法是，利用 NaN 为唯一不等于自身的这个特点，进行判断
function myIsNaN(value) {
    return value !== value;
}


// isFinite() 返回一个布尔值，表示某个值是否为正常的数值
console.log(isFinite(Infinity))
// false
console.log(isFinite(Infinity))
// false
console.log(isFinite(NaN))
// false
console.log(isFinite(undefined))
// false
console.log(isFinite(null))
// true
console.log(isFinite(-1))
// true
// 除了 Infinity、-Infinity、NaN 和 undefined 这几个值会返回 false，isFinite() 对其他
// 的数值都会返回 true
