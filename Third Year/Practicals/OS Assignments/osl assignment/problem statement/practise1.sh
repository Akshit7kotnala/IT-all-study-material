cnt = 0 ; 
while [&cnt -eq 0]
do 
    echo "Student Database "
    echo "1. Create 2. Insert 3.Display 4 . Update  5.Delete 6.Search 7.Exit"
    echo "Press the option you want to opt for"

    read choice 

    case $choice in 

    1) if [-f student.txt]
       then 
         echo "File is already Present "
       else 
         touch student.txt
         echo "File created susccessfully "
      fi
      ;;
    2) read -p "Enter the registration no :" regno
       read -p "Enter the Name :" name 
       read -p "Enter the Mobile No :" mobno 
       echo "$regno $name $mobno ">> student.txt
       echo "Record inserted Sussceesfully "
       ;;
    3)echo "1.All records 2. Bottom Records 3.Top records"
      read ch 
      if [ $ch -eq 1]
      then 
      cat student.txt
      elif [$ch -eq 2]
      then 
      tail -5 student.txt
      elif [$ch -eq 3]
      then 
      head -5 student.txt
      fi
      ;;
    4) read -p "Enter the Registration no : " regno 
       grep -w $regno student.txt > temp 
       if [ -s temp  ]
       then 
       echo "Record Present"
       cat temp 
       elif echo "Record not Present" 
       fi
       ;;
    5) read -p "Enter the Registration no : " regno 
       grep -w $regno student.txt > temp 
       if [ -s temp ]
       then 
       grep -v $regno student.tcxt >temp && mv temp student.txt 
       echo "Record Deleted "
       else 
       echo "Record not found "
       fi
       ;;
    6) read -p "Enter the Registration no : " regno 
       grep -w $regno student.txt > temp 
       if [ -s temp ]
       then 
       grep -v $regno student.tcxt >temp && mv temp student.txt 
       read -p "Enter the registration no :" regno
       read -p "Enter the Name :" name 
       read -p "Enter the Mobile No :" mobno 
       echo "$regno $name $mobno ">> student.txt
       echo "Record inserted Sussceesfully "
       else 
       echo "Record not found "
       fi
       ;;
    7)
      exit 
      ;;
    *) echo "invalid choice"
    ;;

    esac 
    echo "Do you want to contnue "
    read cnt 
done 
