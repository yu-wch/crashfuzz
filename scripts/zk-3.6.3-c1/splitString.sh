string="hello,shell,haha"  
array=(${string//,/ })  
for var in ${array[@]}  
do  
echo $var  
done  
