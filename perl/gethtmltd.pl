$_ = "<td>项目</td><td>财务系统</td>";
if(/<td>项目<\/td><td>(\X*)<\/td>/){ 
print "Result is $1\n"; 
}