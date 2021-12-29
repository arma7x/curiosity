#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

pthread_mutex_t condition_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t  condition_cond  = PTHREAD_COND_INITIALIZER;

void *cage();
void *kraken();

int main()
{
    pthread_t key;
    pthread_t krakens[20];

    int num = 20;
    pthread_create(&key, NULL, &cage, (void*) &num);
    for (int i=0;i<num;i++)
      pthread_create(&krakens[i], NULL, &kraken, NULL);

    pthread_join(key, NULL);
    for (int i=0;i<num;i++)
      pthread_join(krakens[i], NULL);
    return 1;
}

void *cage(void *n)
{
    int num = *((int*) n);
    printf("Release all krakens in 2 seconds\n");
    sleep(2);
    printf("GO!!!!!!!!!\n");
    //pthread_cond_broadcast(&condition_cond);
    //pthread_mutex_lock(&condition_mutex);
    for (int i=0;i<num;i++)
      pthread_cond_signal(&condition_cond);
    //pthread_mutex_unlock(&condition_mutex);
    return NULL;
}

void *kraken(void *n)
{
    pthread_mutex_lock(&condition_mutex);
    printf("Kraken %ld is ready\n", pthread_self());
    pthread_cond_wait(&condition_cond, &condition_mutex);
    printf("Kraken %ld was released\n", pthread_self());
    pthread_mutex_unlock(&condition_mutex);
    return NULL;
}
