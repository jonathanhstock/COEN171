// FILE_NAME: sort.c
// Jonathan Stock
// COEN 171 Dr. Atkinson


#include <stdio.h>
#include <stdlib.h>

#define HIGH 8
typedef int numbers[HIGH];
numbers a;

void readarray()
{
	int i;
    for (i = 0; i < HIGH; ++i)
    {
        scanf("%d", &a[i]);
    }
    return;
}

void writearray()
{
	int i;
    for (i = 0; i < HIGH; ++i)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    return;
}

void exchange(int *a, int *b)
{
    int t = 0;
    t = *a;
    *a = *b;
    *b = t;
    return;
}

int partition(numbers a, int y, int z)
{
    int i, j, x;
    x = a[y];
    i = y - 1;
    j = z + 1;

    while (i < j)
    {
        do
        {
            j = j - 1;
        } while (a[j] > x);

        do
        {
            i = i + 1;
        } while (a[i] < x);

        if (i < j)
        {
            exchange(&a[i], &a[j]);
        }
    }
    return j;
}

void quicksort(numbers a, int m, int n)
{
    int i = 0;

    if (n > m)
    {
        i = partition(a, m, n);
        quicksort(a, m, i);
        quicksort(a, i + 1, n);
    }
    return;
}

int main(int argc, char *argv[])
{
    readarray();
    quicksort(a, 0, HIGH - 1);
    writearray();
    return 0;
}
