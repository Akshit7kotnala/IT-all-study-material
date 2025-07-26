#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

// Function to perform bubble sort
void bubbleSort(int arr[], int n) {
    int i, j, temp;
    for (i = 0; i < n - 1; i++) {
        for (j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

int main() {
    int n, i;
    
    printf("Enter the number of integers to be sorted: ");
    scanf("%d", &n);

    int arr[n];
    printf("Enter the integers:\n");
    for (i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    pid_t pid = fork(); // Create a child process

    if (pid < 0) {
        printf("Fork failed!\n");
        exit(1);
    }

    // Child Process
    else if (pid == 0) {
        // Orphan demonstration: Parent process exits before the child
        sleep(2);
        printf("\nChild Process ID: %d (Sorting in Child Process)\n", getpid());
        
        bubbleSort(arr, n);
        printf("Sorted array in Child Process:\n");
        for (i = 0; i < n; i++) {
            printf("%d ", arr[i]);
        }
        printf("\n");

        // End child process (will be a zombie briefly if parent hasn't called wait)
        exit(0);
    }

    // Parent Process
    else {
        // Sort in parent process
        bubbleSort(arr, n);
        printf("\nParent Process ID: %d (Sorting in Parent Process)\n", getpid());
        
        printf("Sorted array in Parent Process:\n");
        for (i = 0; i < n; i++) {
            printf("%d ", arr[i]);
        }
        printf("\n");

        // Wait for the child process (avoiding zombie)
        wait(NULL);
        printf("\nParent Process completed. Child process terminated (avoiding zombie state).\n");
    }

    return 0;
}
