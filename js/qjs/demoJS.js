import * as std from 'std';

function demoJS(args) {
    if(args.length<2) {
        print("usage: name food\n");
        return;

    }
    var file = std.open('test_outfile.txt','w');
    var r="My name is " + args[0] + ". My favourite food is " + args[1] + ".";
    console.log(r);
    file.puts(r);
    file.close();
}
var args=scriptArgs;
args.shift();
demoJS(args)

