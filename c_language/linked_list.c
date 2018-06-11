// Compile with: $ gcc linked_list.c -lcs50 -lm
#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



typedef struct node
{
    char *word;
    struct node *next;
}
node;

int main(void)
{
    // node *words = NULL;
    node *head = NULL;
    while (true)
    {
        char *word = get_string("Word: ");
        if (strcmp(word, "0") == 0)
        {
            break;
        }
        node *n = malloc(sizeof(node));
        n->word = word;
        if(!head)
        {
            n->next = NULL;
            head = n;
        }
        else
        {
            n->next = head;
            head = n;
        }

    }
    node *ptr = head;
    while (ptr != NULL)
    {
        printf("%s\n", ptr->word);
        node *next = ptr->next;
        free(ptr);
        ptr = next;
    }

}
