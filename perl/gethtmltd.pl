$_ = "<td>��Ŀ</td><td>����ϵͳ</td>";
if(/<td>��Ŀ<\/td><td>(\X*)<\/td>/){ 
print "Result is $1\n"; 
}