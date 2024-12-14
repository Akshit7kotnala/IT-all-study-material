#include<stdio.h>
int main (){

int arr[10],burst[10],temp[10];
int i , time , limit , cnt =0 ; 
float avgw,avgt;
double wait,turn;

printf("ENTER THE NO OF PROCEESS: ");
scanf("%d",&limit );
burst[9] = 9999;
for(time = 0 ; cnt !=limit ; time++){
    int smallest = 9 ; 
    for( i = 0 ; i <limit ; i++){

        if(arr[i]<=time && burst [i]< burst [smallest] && burst [i]>0){
            smallest = i;
        }
    }
    burst[smallest]--;
    if(burst[smallest]==0){
        cnt++;
        end = time +1;
        wait = wait+end
    }
}



}