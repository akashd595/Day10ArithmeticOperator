#!/bin/bash -x

echo "This problem computes different arithmetic expressions and Sorts the results"

read -p "Enter 1st number " a;
read -p "Enter 2nd number " b;
read -p "Enter 3rd number " c;
declare -A CompDic

CompDic["a+b*c"]=`echo "$a+$b*$c"|bc -l`;
CompDic["a*b+c"]=`echo "$a*$b+$c"|bc -l`;
CompDic["c+a/b"]=`echo "$c+$a/$b"|bc -l`;
CompDic["a%b=c"]=`echo "$a%$b+$c"|bc -l`;

echo "Dic : "${!CompDic[@]};
echo "Dic : "${CompDic[@]};

n=0
for key in "${!CompDic[@]}"
do
	Array_com[(($n))]=${CompDic[$key]}
	((n++))
done

echo "Array number: " ${!Array_com[@]}
echo "Array: " ${Array_com[@]}

arraySize=${#CompDic[@]};

for (( i=0; i<$arraySize; ++i ))
do
	for (( j=$(($i+1)); j<$arraySize; ++j ))
	do
		z=`echo "${Array_com[(($i))]}<${Array_com[(($j))]}"|bc -l`
		if [ $z -eq 1 ]
		then
			temp=${Array_com[(($i))]};
			Array_com[(($i))]=${Array_com[(($j))]};
			Array_com[(($j))]=$temp;
		fi
	done
done
echo "Descending order: " ${Array_com[@]};

for (( i=0; i<$arraySize; ++i ))
do
   for (( j=$(($i+1)); j<$arraySize; ++j ))
   do
      z=`echo "${Array_com[(($i))]}>${Array_com[(($j))]}"|bc -l`
      if [ $z -eq 1 ]
      then
         temp=${Array_com[(($i))]};
         Array_com[(($i))]=${Array_com[(($j))]};
         Array_com[(($j))]=$temp;
      fi
   done
done
echo "Ascending order: " ${Array_com[@]};

