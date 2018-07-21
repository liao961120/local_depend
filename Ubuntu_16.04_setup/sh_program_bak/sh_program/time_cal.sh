if [[ $# -eq 3 ]]
then
	expr 60 \* 60 \* $1 + 60 \* $2 + $3
elif [[ $# -eq 2 ]]
then
	expr 60 \* $1 + $2
elif [[ $# -eq 1 ]]
then	
	expr $1
else
	echo "Input Error"
fi
