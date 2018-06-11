// Implements a dictionary's functionality
// run with:                $ ./speller texts/wordsworth.txt
// check leaks with:        $ valgrind ./speller texts/wordsworth.txt
// compare against staff:   $ ~cs50/pset5/speller texts/wordsworth.txt
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <ctype.h>

#include "dictionary.h"

int count = 0;
bool loaded = false;
node *hash_table[HASH_TABLE_LENGTH] = {NULL};
int hash_index;

// Returns true if word is in dictionary else false
bool check(const char *word)
{

    hash_index = hash(word);
    for (node *ptr = hash_table[hash_index]; ptr != NULL; ptr = ptr->next)
    {
        if (strcasecmp(ptr->word, word) == 0)
        {
            return true;
        }
    }
    return false;
}

// Loads dictionary into memory, returning true if successful else false
bool load(const char *dictionary)
{

    FILE *file = fopen(dictionary, "r");
    if (file == NULL)
    {
        fprintf(stderr, "Could not open %s.\n", dictionary);
        return false;
    }
    char word[LENGTH + 1];
    while (fscanf(file, "%s", word) != EOF)
    {
        node *n = malloc(sizeof(node));
        if (n == NULL)
        {
            unload();
            return false;
        }
        count++;
        strcpy(n->word, word);
        hash_index = hash(n->word);
        if (!hash_table[hash_index])
        {
            n->next = NULL;
            hash_table[hash_index] = n;
        }
        else
        {
            n->next = hash_table[hash_index];
            hash_table[hash_index] = n;
        }
    }
    loaded = true;
    fclose(file);
    return true;
}

int hash(const char *word)
{
    char first_letter = word[0];
    int index = tolower(first_letter) % 'a';
    return index;
}

// Returns number of words in dictionary if loaded else 0 if not yet loaded
unsigned int size(void)
{
    return count;
}

// Unloads dictionary from memory, returning true if successful else false
bool unload(void)
{
    for (int i = 0; i < HASH_TABLE_LENGTH; i++)
    {
        node *ptr = hash_table[i];
        while (ptr != NULL)
        {
            node *next = ptr->next;
            free(ptr);
            ptr = next;
        }
    }
    return true;
}
