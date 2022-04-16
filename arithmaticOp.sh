#!/bin/bash -x
echo "This problem computes different arithmetic expressions and Sorts the results"
read -p "Enter 1st number " a;
read -p "Enter 2nd number " b;
read -p "Enter 3rd number " c;

firstOp=`echo "$a+$b*$c"|bc -l`;
secondOp=`echo "$a*$b+$c"|bc -l`;
thirdOp=`echo "$c+$a/$b"|bc -l`;
fourthOp=`echo "$a%$b+$c"|bc -l`
echo $fourthOp;
