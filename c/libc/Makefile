all : assert EDOM ERANGE errno float isalnum isalpha iscntrl isdigit isgraph islower isprint ispunct isspace isupper isxdigit limit localeconv setlocale tolower toupper
EDOM : EDOM.o
	gcc -o EDOM -lm EDOM.o
ERANGE : ERANGE.o
	gcc -o ERANGE -lm ERANGE.o
clean :
	rm -rf assert EDOM ERANGE errno float isalnum isalpha iscntrl isdigit isgraph islower isprint ispunct isspace isupper isxdigit limit localeconv setlocale tolower toupper *.o
