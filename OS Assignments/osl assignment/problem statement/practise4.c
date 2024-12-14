#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<pthread.h>
#include<semaphore.h>

sem_t ch[5];
void *philosopher(void *arg){
    int i = (int)arg;
    int right , left ; 
    printf("%d pHILOSOPHER IS CREATED :",arg);
    sleep(5);

    left = i ; 
    right = (i+1)%5;
    printf("%d pHILOSOPHER IS Hungary:",arg);
    sem_wait(%ch[left]);
    sem_wait(%ch[right]);
    printf("%d pHILOSOPHER IS Eating:",arg);
    sleep(5);
    sem_post(%ch[left]);
    sem_post(%ch[right]);
    

}