 cnt = 0 
while [ $cnt -eq 0 ]
do 

echo "Student Database "
echo "1. Create 2. INsert 3. DISPLAY 4. SEARCH 5. DELETE 6. UPDATE 7. EXIT "
echo "Enter your choice "

reacd choice 
case $choise in 
1) if [ -f student.txt ]
then 
echo "File already present"
else 
touch student.txt
echo "File created sussessfully "
fi
;;
2) 
reap -p "Enter the mob no : " mobno 
reap -p "Enter the name : " name
reap -p "Enter the id : " id
echo " $mobno $name $id " >>student.txt
echo "data inserted sussessfully "
fi
;;
3) echo "1. full display 2. top 3. bottom"
read ch 
if [ $ch -eq 1]
then 
cat student.txt 
elif [ $ch -eq 2]
then 
head -5 student.txt 
elif [ $ch -eq 3]
then tail -5 student.txt 
fi;;
4) 
read -p "enter the reg no " regno 
grep -w $regno student.txt  > temp 
if [ -s student.txt ]
then 
cat temp 
echo "file present "
else 
echo "file not present "
fi ;;
5) 
read -p "enter the reg no " regno 
grep -w $regno student.txt  > temp 
if [ -s student.txt ]
then 
grep -v $regno student.text>temp && mv temp student.txt 
else 
echo "file not present "
fi ;;
6)
read -p "enter the reg no " regno 
grep -w $regno student.txt  > temp 
if [ -s student.txt ]
then 
grep -v $regno student.text>temp && mv temp student.txt 
reap -p "Enter the mob no : " mobno 
reap -p "Enter the name : " name
reap -p "Enter the id : " id
echo " $mobno $name $id " >>student.txt
echo "data inserted sussessfully "
else 
echo "file not present "
fi ;;
7) exit 
;;
*) echo "invalid choice"
;;
esac 
echo 

