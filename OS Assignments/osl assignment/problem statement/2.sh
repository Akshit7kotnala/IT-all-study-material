#!/bin/bash

cont=0
while [ $cont -eq 0 ] 
do
    echo "Employee Database"
    echo "1. Create Employee Book 2. View Employee Data 3. Insert a Record 4. Delete a Record 5. Modify a Record 6. Exit"
    echo "Enter the Choice"
    read choice

    case $choice in 
        1) 
            if [ -f employee.txt ]
            then 
                echo "Employee book already exists."     
            else
                touch employee.txt
                echo "Employee book created successfully."
            fi
            ;;
        2) 
            echo "Viewing Employee Data"
            if [ -f employee.txt ]
            then
                cat employee.txt
            else
                echo "Employee book not found. Please create it first."
            fi
            ;;
        3) 
            read -p "Enter Employee Number (EMPNO): " empno
            read -p "Enter Employee Name: " name
            read -p "Enter Employee Mobile: " mobile
            echo "$empno $name $mobile" >> employee.txt
            echo "Record inserted successfully."
            ;;
        4) 
            read -p "Enter Employee Number (EMPNO) to delete: " empno
            grep -w $empno employee.txt > temp
            if [ -s temp ]
            then
                grep -v $empno employee.txt > temp && mv temp employee.txt
                echo "Record deleted successfully."
            else
                echo "Employee not found."
            fi
            ;;
        5) 
            read -p "Enter Employee Number (EMPNO) to modify: " empno
            grep -w $empno employee.txt > temp
            if [ -s temp ]
            then
                grep -v $empno employee.txt > temp && mv temp employee.txt
                read -p "Enter new Name: " name
                read -p "Enter new Mobile: " mobile
                echo "$empno $name $mobile" >> employee.txt
                echo "Record modified successfully."
            else
                echo "Employee not found."
            fi
            ;;
        6) 
            echo "Exiting the program."
            exit
            ;;
        *) 
            echo "Invalid Choice"
            ;;
    esac

    echo "Do you want to continue? (Press 0 for Yes)"
    read cont
done
