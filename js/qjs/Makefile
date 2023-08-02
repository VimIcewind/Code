demoJS : demoJS.js
        # qjsc -o demoJS demoJS.js
	qjsc -e -o demoJS.c demoJS.js
	gcc -o demoJS demoJS.c -O3 -lquickjs -pthread
run : demoJS.js
	qjs demoJS.js "VimIcewind" "fish"
