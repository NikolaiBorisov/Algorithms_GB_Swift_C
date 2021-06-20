//
//  main.c
//  C_Lesson3_BorisovN
//
//  Created by NIKOLAI BORISOV on 20.06.2021.
//

#include <stdio.h>
#include <stdlib.h>
#define ARR_SIZE 100
#define ARR_SMALL 10

void solution1(void);
void solution2(void);
void solution3(void);
void menu(void);

int bin[ARR_SIZE] = {0};
int size = 0;
int i = 0;
int p = 1;

int bubleSort(int bin[ARR_SIZE])
{
  int binSort[ARR_SIZE] = {0};
  int i, j, temp;
  int count = 0;
  
  for (i = 0; i < 10; i++)
  binSort[i] = bin[i];
  
  for (i = 0; i < 9; i++) {
    count++;
    for (j = 0; j < 9; j++) {
      count++;
      if (binSort[j] > binSort[j+1]) {
        count++;
        temp = binSort[j+1];
        binSort[j+1] = binSort[j];
        binSort[j] = temp;
      }
    }
  }
  
  return count;
}

int bubleSortUpperLimit(int bin[ARR_SIZE])
{
  int binSort[ARR_SIZE] = {0};
  int i, j, temp;
  int count = 0;
  
  for (i = 0; i < 10; i++)
  binSort[i] = bin[i];
  
  for (i = 0; i < 9; i++)
  for (j = 0; j < 9 - i; j++) {
    count++;
    if (binSort[j] > binSort[j+1]) {
      count++;
      temp = binSort[j+1];
      binSort[j+1] = binSort[j];
      binSort[j] = temp;
    }
  }
  return count;
}

int bubleSortWhileLoop(int bin[ARR_SIZE])
{
  int binSort[ARR_SIZE] = {0};
  int i, j, t, temp;
  int count = 0;
  
  for (i = 0; i < 10; i++)
  binSort[i] = bin[i];
  
  i = 0;
  t = 1;
  
  while (t == 1) {
    t = 0;
    count++;
    for (j = 0; j < 9 - i; j++)
    if (binSort[j] > binSort[j+1]) {
      count++;
      temp = binSort[j+1];
      binSort[j+1] = binSort[j];
      binSort[j] = temp;
      t = 1;
    }
    i = i + 1;
  }
  
  return count;
}

int cocktailSort(int bin[ARR_SIZE])
{
  int binSort[ARR_SIZE] = {0};
  int i, j, temp;
  int count = 0;
  
  for (i = 0; i < 10; i++)
  binSort[i] = bin[i];
  
  for (i = 0; i < 9; i++) {
    
    if (i % 2 == 0) {
      
      for (j = 0; j < 9 - i; j++) {
        count++;
        if (binSort[j] > binSort[j+1]) {
          count++;
          temp = binSort[j+1];
          binSort[j+1] = binSort[j];
          binSort[j] = temp;
        }
      }
    }
    if (i % 2 == 1) {
      for (j = 9 - i; j > 0; j--) {
        count++;
        if (binSort[j] < binSort[j-1]) {
          count++;
          temp = binSort[j-1];
          binSort[j-1] = binSort[j];
          binSort[j] = temp;
        }
      }
    }
  }
  
  printf("Array after cocktail sort : ");
  
  for (i = 0; i < 10; i++)
  printf("%d ", binSort[i]);
  
  printf("\n");
  
  return count;
}

int binarySearch(int* bin, int N, int value)
{
  int L = 0;
  int R = N - 1;
  int m = L + (R - L)/2;
  
  while(L <= R && bin[m] != value) {
    if(bin[m] < value)
      L = m + 1;
    else
      R = m - 1;
    m = L + (R - L)/2;
  }
  
  if (bin[m] == value)
    return m;
  else {
    printf("Number not found\n");
    return -1;
  }
}

int main(int argc, const char * argv[]) {
  int sel = 0;
  do
  {
    menu();
    scanf("%i", &sel);
    switch (sel)
    {
      case 1:
        solution1();
        break;
      case 2:
        solution2();
        break;
      case 3:
        solution3();
        break;
      case 0:
        printf("Bye!\n");
        break;
      default:
        printf("Wrong selected\n");
    }
  } while (sel != 0);
  
  printf("Hello!\n");
  return 0;
}

//1. Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.

void solution1()
{
  printf("Solution 1\n");
  
  int bin[ARR_SIZE] = {0};
  int binSort[ARR_SIZE] = {0};
  int i, j, temp;
  
  printf("Start array : ");
  
  for (i = 0; i < 10; i++)
  {
    bin[i] = rand() % 9 + 1;
    binSort[i] = bin[i];
    printf("%d ", bin[i]);
  }
  
  printf("\n");
  
  for (i = 0; i < 9; i++)
  for (j = 0; j < 9; j++)
  if (binSort[j] > binSort[j+1]) {
    temp = binSort[j+1];
    binSort[j+1] = binSort[j];
    binSort[j] = temp;
  }
  
  
  printf("Sorted array : ");
  
  for (i = 0; i < 10; i++)
  printf("%d ", binSort[i]);
  
  printf("\n");
  printf("Buble sort number of operations - %d\n", bubleSort(bin));
  printf("Upper Limit Buble sort number of operations - %d\n", bubleSortUpperLimit(bin));
  printf("While Loop Buble sort number of operations - %d\n", bubleSortWhileLoop(bin));
}

void solution2()
{
  printf("Solution 2\n");
  
  //2. *Реализовать шейкерную сортировку.
  
  int bin[ARR_SIZE] = {0};
  int binSort[ARR_SIZE] = {0};
  int i, j, temp;
  
  printf("Start array : ");
  
  for (i = 0; i < 10; i++)
  {
    bin[i] = rand() % 9 + 1;
    binSort[i] = bin[i];
    printf("%d ", bin[i]);
  }
  
  printf("\n");
  
  for (i = 0; i < 9; i++)
  for (j = 0; j < 9; j++)
  if (binSort[j] > binSort[j+1]) {
    temp = binSort[j+1];
    binSort[j+1] = binSort[j];
    binSort[j] = temp;
  }
  
  
  printf("Sorted array : ");
  
  for (i = 0; i < 10; i++)
  printf("%d ", binSort[i]);
  
  printf("\n");
  printf("Buble sort number of operations - %d\n", bubleSort(bin));
  printf("Cocktail sort number of operations - %d\n", cocktailSort(bin));
  
  
  
}

//3. Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.

void solution3()
{
  printf("Solution 3\n");
  
  int i, j, temp, N;
  int* bin;
  int value;
  
  printf("Enter N : \n");
  scanf("%d", &N);
  bin = (int*) malloc(N * sizeof(int));
  
  for (i = 0; i < N; i++) {
    printf("Enter %d : ", i);
    scanf("%d", &bin[i]);
  }
  printf("\n");
  
  printf("Enter number : \n");
  scanf("%d", &value);
  
  printf("Initial array : ");
  
  for (i = 0; i < N; i++)
  printf("%d ", bin[i]);
  printf("\n");
  
  for (i = 0; i < N - 1; i++)
  for (j = 0; j < N - 1; j++)
  if (bin[j] > bin[j+1]) {
    temp = bin[j+1];
    bin[j+1] = bin[j];
    bin[j] = temp;
  }
  
  printf("Sorted array : ");
  
  for (i = 0; i < N; i++)
  printf("%d ", bin[i]);
  
  printf("\n");
  
  if (N > 0)
    printf("Index of entered number - %d\n", binarySearch(bin, N, value));
  else
    printf("Wrong data\n");
}

void menu()
{
  printf("1 - task 1\n");
  printf("2 - task 2\n");
  printf("3 - task 3\n");
  printf("0 - exit\n");
}
