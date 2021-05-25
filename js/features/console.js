console.log('Hello World');
// Hello World
console.log('a', 'b', 'c');
// a b c

console.log(1);
console.log(2);
console.log(3);
// 1
// 2
// 3

console.log(' %s + %s = %s', 1, 1, 2);
//  1 + 1 = 2

var number = 11 * 9;
var color = 'red';

console.log('%d %s balloons', number, color);
// 99 red balloons

// 使用 %c 占位符时，对应的参数必须是css代码，用来对输出内容进行 CSS 渲染
console.log(
    '%cThis text is styled!',
    'color: red; background: yellow; font-size: 24px;'
);
// This text is styled!
// 上面代码在Chrome Console里运行后，输出的内容将显示为黄底红字

console.log(' %s + %s ', 1, 1, '= 2');
//  1 + 1  = 2

// 如果参数是一个对象，console.log 会显示该对象的值
console.log({foo: 'bar'});
// { foo: 'bar'  }
console.log(Date);
// [Function: Date]
// ƒ Date() { [native code]  }

// console.info 是 console.log 方法的别名，用法完全一样。只不过 console.info 方法
// 会在输出信息的前面，加上一个蓝色图标

console.info('Hi, console.info()');
// Hi, console.info()

// console.debug 方法与 console.log 方法类似，会在控制台输出调试信息。但是，默认情况下，
// console.debug 输出的信息不会显示，只有在打开显示级别在 verbose 的情况下，才会显示
console.debug('Hi, console.debug()');
// Hi, console.debug()

// console 对象的所有方法，都可以被覆盖。因此，可以按照自己的需要，定义 console.log 方法

// ['log', 'info', 'warn', 'error'].forEach(function (method) {
//     console[method] = console[method].bind(
//         console,
//         new Date().toISOString()
//     )
// });
//
// console.log("出错了！");
// 2021-05-24T09:06:47.679Z 出错了！

// 上面代码表示，使用自定义的 console.log 方法，可以在显示结果添加当前时间

// warn方法和error方法也是在控制台输出信息，它们与log方法的不同之处在于，
// warn方法输出信息时，在最前面加一个黄色三角，表示警告；error方法输出信息时，
// 在最前面加一个红色的叉，表示出错。同时，还会高亮显示输出文字和错误发生的堆栈。
// 其他方面都一样

console.error('Error: %s (%i)', 'Server is not responding', 500);
// Error: Server is not responding (500)
// console.warn('Warning! Too few nodes (%d)', document.childNodes.length);
// Warning! Too few nodes (2)

// 可以这样理解，log 方法是写入标准输出 (stdout), warn 方法和 error 方法是写入标准错误 (stderr)

// 对于某些复合类型的数据，console.table 方法可以将其转为表格显示
var languages = [
    { name: "JavaScript", fileExtension: ".js" },
    { name: "TypeScript", fileExtension: ".ts" },
    { name: "CoffeeScript", fileExtension: ".coffee" }
];

console.table(languages);

var languages = {
    csharp: { name: "C#", paradigm: "object-oriented" },
    fsharp: { name: "F#", paradigm: "functional" }
};

console.table(languages);

// count 方法用于计数，输出它被调用了多少次

// function greet(user) {
//     console.count();
//     return 'hi '+ user;
// }
// greet('bob')
// // default: 1
// greet('alice')
// // default: 2
// greet('bob')
// // default: 3
// 上面代码每次调用greet函数，内部的console.count方法就输出执行次数


// 该方法可以接受一个字符串作为参数，作为标签，对执行次数进行分类
function greet(user) {
    console.count(user);
    return 'hi '+ user;
}
greet('bob')
// bob: 1
greet('alice')
// alice: 1
greet('bob')
// bob: 2

// dir 方法用来对一个对象进行检查 (inspect)，并以易于阅读和打印的格式显示

console.log({f1: 'foo', f2: 'bar'});
// { f1: 'foo', f2: 'bar' }
console.dir({f1: 'foo', f2: 'bar'});
// Object
// f1: "foo"
// f2: "bar"
// __proto__: Object

// 上面代码显示 dir 方法的输出结果，比 log 方法更易读，信息也更丰富

// console.dir(document.body);
//

var obj = {name: 'dir'};
console.dir(obj, {colors: true});
// { name: 'dir'  }

// dirxml 方法主要用于以目录树的形式，显示 DOM 节点

// console.dirxml(document.body);
//

// 如果参数不是 DOM 节点，而是普通的 JavaScript 对象，console.dirxml 等同于 console.dir

console.dirxml([1, 2, 3]);
// [ 1, 2, 3  ]
console.dir([1, 2, 3]);
// [ 1, 2, 3  ]

// console.assert() 方法主要用于程序运行过程中，进行条件判断，如果不满足条件，就显示一个错误，
// 但不会中断程序的执行。这样就相当于提示用户，内部状态不正确

// 它接受两个参数，第一个参数是表达式，第二个参数是字符串。只有当第一个参数为 false，才会提示有错误，
// 在控制台输出第二个参数，否则不会有任何结果

console.assert(false, '判断条件不成立')
// Assertion failed: 判断条件不成立

// 相当于

// try {
//     if (!false) {
//         throw new Error('判断条件不成立');
//     }
// } catch (e) {
//     console.error(e);
// }
// Error: 判断条件不成立
//     at Object.<anonymous> (/root/Code/js/features/console.js:164:15)
//     at Module._compile (internal/modules/cjs/loader.js:1063:30)
//     at Object.Module._extensions..js (internal/modules/cjs/loader.js:1092:10)
//     at Module.load (internal/modules/cjs/loader.js:928:32)
//     at Function.Module._load (internal/modules/cjs/loader.js:769:14)
//     at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:72:12)
//     at internal/main/run_main_module.js:17:47

// 下面是一个例子，判断子节点的个数是否大于等于 500
// console.assert(list.childNodes.length < 500, '节点个数大于等于500')
// 上面代码中，如果符合条件的节点小于500个，不会有任何输出；只有大于等于500时，
// 才会在控制台提示错误，并且显示指定文本

// console.time(), console.timeEnd()
// 这两个方法用于计时，可以算出一个操作所花费的准确时间
console.time('Array initialize');

var array = new Array(1000000);
for (var i = array.length - 1; i >= 0; i--) {
    array[i] = new Object();
};

console.timeEnd('Array initialize');
// Array initialize: 321.96ms

// time 方法表示计时开始，timeEnd 方法表示计时结束。它们的参数是计时器的名称。
// 调用 timeEnd 方法之后，控制台会显示"计时器名称: 所耗费的时间"

// console.group 和 console.groupEnd 这两个方法用于将显示的信息分组。它只在输出大量
// 信息时有用，分在一组的信息，可以用鼠标折叠/展开
console.group('一级分组');
console.log('一级分组的内容');
console.group('二级分组');
console.log('二级分组的内容');
// 一级分组
//   一级分组的内容
//   二级分组
//       二级分组的内容

// 上面代码会将 "二级分组" 显示在 "一级分组" 内部，并且 "一级分组" 和 "二级分组"
// 前面都有一个折叠符号，可以用来折叠本级的内容

// console.groupCollapsed 方法与 console.group 方法很类似，唯一的区别是该组的内容，
// 在第一次显示时是收起的 (collapsed)，而不是展开的
console.groupCollapsed('Fetching Data');
console.log('Request Sent');
console.error('Error: Server not responding (500)');
console.groupEnd();
//     Fetching Data
//       Request Sent
//       Error: Server not responding (500)

// console.trace 方法显示当前执行的代码在堆栈中的调用路径
console.trace();
// Trace
//     at Object.<anonymous> (/root/Code/js/features/console.js:223:9)
//     at Module._compile (internal/modules/cjs/loader.js:1063:30)
//     at Object.Module._extensions..js (internal/modules/cjs/loader.js:1092:10)
//     at Module.load (internal/modules/cjs/loader.js:928:32)
//     at Function.Module._load (internal/modules/cjs/loader.js:769:14)
//     at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:72:12)
//     at internal/main/run_main_module.js:17:47

// console.clear 方法用于清除当前控制台的所有输出，将光标回置到第一行。如果用户
// 选中了控制台的 "Preserve log" 选项，console.clear 方法将不起作用
console.clear();


// 控制台命令行 API

// $_ 属性返回上一个表达式的值
2 + 2
// 4
// $_
// 4

// $0 - $4 控制台保存了最近 5 个 Elements 面板选中的 DOM 元素，$0 代表倒数第一个（最近一个），
// $1 代表倒数第二个，以此类推直到 $4

// $(selector) 返回第一个匹配的元素，等同于 document.querySelector()。注意，如果页面脚本对 $ 有定义，
// 则会覆盖原始定义。比如，页面里有 jQuery，控制台执行 $(selector) 就会采用 jQuery 的实现，返回一个数组


// $$(selector) 返回选中的 DOM 对象，等同于 document.querySelectorAll

// $x(path) 犯法返回一个数组，包含匹配特定 XPath 表达式的所有 DOM 元素

// $x("//p[a]")
// 上面代码返回所有包含 a 元素的 p 元素

// inspect(object) 方法打开相关面板，并选中相应的元素，显示它的细节。 DOM 元素在 Element 面板中显示，比如
// inspect(document) 会在 Elemenets 面板显示 document 元素。JavaScript 对象在控制台面板 Profiles 面板中显示，
// 比如 inspect(window)

// getEventListeners(object) 方法返回一个对象，该对象的成员为 object 登记了回调函数的各种事件(比如 click 或 keydown )
// 每个事件对应一个数组，数组的成员为该事件的回调函数

// keys(object) 方法返回一个数组，包含 object 的所有键名
// values(object) 方法返回一个数组，包含 object 的所有键值
var o = {'p1': 'a', 'p2': 'b'};
// keys(o)
// (2)["p1", "p2"]
// values(o)
// (2)["a", "b"]

// monitorEvents(object[, events]) 方法监听特定对象上发生的特定事件。事件发生时，会返回一个 Event 对象，
// 包含该事件的相关信息。事件发生时，会返回一个 Event 对象，包含该事件的相关信息。
// unmonitorEvents 方法用于停止监听

// monitorEvents(windows, "resize");
// monitorEvents(windows, ["resize", "scroll"]);
// 上面代码分别表示单个事件和多个事件的监听方法

// monitorEvents($0, 'mouse');
// unmonitorEvents($0, 'mousemove');
// 上面的代码表示如何停止监听

// monitorEvents 允许监听同一大类的事件。所有事件可以分成四个大类
// mouse: "mousedown", "mouseup", "click", "dblclick", "mousemove", "mouseover", "mouseout", "mousewheel"
// key: "keydown", "keyup", "keypress", "textInput"
// touch: "touchstart", "touchmove", "touchend", "touchcancel"
// control: "resize", "scroll", "zoom", "focus", "blur", "select", "change", "submit", "reset"

// monitorEvents($("#msg"), "key");
// 上面代码表示监听所有 key 大类的事件

// 其他方法
// 命令行 API 还提供以下方法。
// clear(): 清除控制台历史
// copy(object): 复制特定 DOM 元素到剪贴板
// dir(object): 显示特定对象的所有属性，是 console.dir 方法的别名
// dirxml(object): 显示特定对象的 XML 形式，是 console.dirxml 方法的别名


// debugger 语句
// debugger 语句 主要用于除错，作用是设置断点。如果有正在运行的除错工具，程序运行到 debugger 语句时会自动停下。
// 如果没有除错工具，debugger 语句不会产生任何结果，JavaScript 引擎自动跳过这一句

// Chrome 浏览器中，当代码运行到 debugger 语句时，就会暂停运行，自动打开脚本源码界面
for (var i = 0; i < 5; i++) {
    console.log(i);
    if (i == 2) debugger;
}
// 上面代码打印出 0, 1, 2 以后，就会暂停，自动打开源码界面，等待进一步处理
