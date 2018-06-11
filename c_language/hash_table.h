// Declares a dictionary's functionality

#ifndef DICTIONARY_H
#define DICTIONARY_H

#include <stdbool.h>

// Maximum length for a word
// (e.g., pneumonoultramicroscopicsilicovolcanoconiosis)
#define LENGTH 45
#define HASH_TABLE_LENGTH 26

typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// Prototypes
bool check(const char *word);
bool load(const char *dictionary);
int hash(const char *word);
unsigned int size(void);
bool unload(void);

#endif // DICTIONARY_H
