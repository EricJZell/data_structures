// A simple queue: A first in, first out data structure
#include <stdio.h>
#include <stdlib.h>
#include <cs50.h>
#define CAPACITY 20
#define GROUPS 4
// This 'queue' structure stores the index of the front of the queue (front),
// a pointer to the array of passengers in the queue (*passengers)
// and the total number of items in the queue (size)
typedef struct
{
    unsigned int group;
}
passenger;

typedef struct queue
{
    int front;
    passenger passengers[CAPACITY];
    int size;
}
queue;

typedef struct pqueue
{
    queue *queues[GROUPS];
}
pqueue;

// Add an item to the queue
bool enqueue(pqueue *pq, passenger n)
{
	// Check if the capacity is reached
	queue *q = pq->queues[n.group];
	if (q->size < CAPACITY)
	{
        q->passengers[q->size] = n;
        q->size++;
        return true;
	}
	else
	{
	    return false;
	}
}

// Remove an item from the front of the queue, and return it
passenger dequeue(queue *q)
{
    passenger p = q->passengers[q->front];
    //Don't move all the passengers left in the queue, just move the front of the line!
    q->front = (q->front + 1);
    q->size = (q->size - 1);
    return p;
}
passenger pdequeue(pqueue *pq)
{
    for (int i = 0; i < GROUPS; i++)
    {
        if (pq->queues[i]->size > 0)
        {
            return dequeue(pq->queues[i]);
        }
    }
    passenger p;
    p.group = -1;
    return p;
}

int main(void)
{
    pqueue *pq = malloc(sizeof(struct pqueue));
    for (int i = 0; i < GROUPS; i++)
    {
        pq->queues[i] = malloc(sizeof(struct queue));
        pq->queues[i]->front = 0;
        pq->queues[i]->size = 0;
    }

    // Add a few passengers to the queue
    printf("enqueue 3, then 2, then 1...\n");
    passenger p0;
    p0.group = 0;
    passenger p1;
    p1.group = 1;
    passenger p2;
    p2.group = 2;
    passenger p3;
    p3.group = 3;
    enqueue(pq, p3);
    enqueue(pq, p2);
    enqueue(pq, p1);
    enqueue(pq, p0);
    enqueue(pq, p3);
    enqueue(pq, p2);
    enqueue(pq, p1);
    enqueue(pq, p0);
    enqueue(pq, p3);
    enqueue(pq, p2);
    enqueue(pq, p1);
    enqueue(pq, p0);

    int g;
    while((g = pdequeue(pq).group) != -1)
    {
        printf("Dequeued %i\n", g);
    }

    // Free the allocated memory
    for (int i = 0; i < GROUPS; i++)
    {
        free(pq->queues[i]);
    }
    free(pq);
}
