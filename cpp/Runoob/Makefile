OBJ = hi hello lenth localvar globalvar localglobalvar define const signed \
      static write functions defaultparameter numbers random cmath arrays \
      arrays2 arrayspointer arraysparameter arraysreturn getaddr string \
      stringfunc stringend NULLpointer pointer pointerplusplus \
      pointerminusminus pointercmp pointerVSarrays pointerpointer \
      pointerreturn pointerparameter reference referencesreturn currenttime \
      tm cout cin cerr clog struct structparameter structpoint typedef \
      class classmethod public private protected constructor \
      constructorparameter constructorparameter1 destructor \
      copyconstructor copyconstructor1 friend inline

All : $(OBJ)

write : main.cpp support.cpp
	g++ -o write main.cpp support.cpp
clean :
	rm -rf *.o  $(OBJ)

