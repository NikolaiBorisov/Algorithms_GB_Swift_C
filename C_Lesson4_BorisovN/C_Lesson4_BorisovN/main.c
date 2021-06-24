//
//  main.c
//  C_Lesson4_BorisovN
//
//  Created by NIKOLAI BORISOV on 24.06.2021.
//

#include <stdio.h>

void solution1(void);
void solution2(void);
void menu(void);

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
      case 0:
        printf("Bye\n");
        break;
      default:
        printf("Wrong selected\n");
    }
  } while (sel != 0);
  printf("Hello!\n");
  return 0;
}

//1. *Количество маршрутов с препятствиями. Реализовать чтение массива с препятствием и нахождение количество маршрутов.

//    Например, карта:
//    3 3
//    1 1 1
//    0 1 0
//    0 1 0

void solution1()
{
  printf("Solution 1\n");
  
  int N = 0, M = 0;
  
  printf("Enter parameters for NxM matrix\n");
  printf("Example 1-1 : \n");
  scanf("%d-%d", &N, &M);
  
  printf("1 - you can go\n");
  printf("0 - you cannot go\n");
  printf("\n");
  
  int roadBoard[N][M];
  int value, i, j;
  
  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++) {
      printf("Enter value 1 or 0 for [%d]x[%d] : \n", i, j);
      scanf("%d", &value);
      if ((value > 1) || (value < 0))
        roadBoard[i][j] = 1;
      else
        roadBoard[i][j] = value;
    }
  }
  
  printf("\n");
  printf("Entered values : \n");
  
  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++)
    printf("%d  ", roadBoard[i][j]);
    printf("\n");
  }
  
  roadBoard[0][0] = 1;
  
  for (i = 1; i < N - 1; i ++) {
    if (roadBoard[i][0] == 0)
      roadBoard[i+1][0] = 0;
  }
  for (j = 1; j < M - 1; j ++) {
    if (roadBoard[0][j] == 0)
      roadBoard[0][j+1] = 0;
  }
  
  printf("\n");
  printf("Matrix : \n");
  
  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++)
    printf("%d  ", roadBoard[i][j]);
    printf("\n");
  }
  
  printf("\n");
  
  for (i = 1; i < N; i++) {
    for (j = 1; j < M; j++)
    if (roadBoard[i][j] != 0)
      roadBoard[i][j] = roadBoard[i][j-1] + roadBoard[i-1][j];
  }
  
  printf("\n");
  printf("Leap count matrix : \n");
  
  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++)
    printf("%d     ", roadBoard[i][j]);
    printf("\n");
    printf("\n");
  }
  
  printf("\n");
  printf("\n");
  
}

//2. Решить задачу о нахождении длины максимальной последовательности с помощью матрицы.

void solution2()
{
  printf("Solution 2\n");
  
  char stringOne[12] = "ABCDEFG";
  char stringTwo[12] = "HIJKLMN";
  
  printf("Enter first string : ");
  fgets(stringOne, 12, stdin);
  fflush(stdin);
  printf("First string : ");
  fputs(stringOne, stdout);
  printf("\n");
  
  printf("Enter second string : ");
  fgets(stringTwo, 12, stdin);
  fflush(stdin);
  printf("First string : ");
  fputs(stringTwo, stdout);
  
  int lcs[13][13] = {0};
  int i, j, n, m, k;
  
  for (j = 0; j < 13; j ++) {
    if (j + 2 < 13)
      lcs[0][j+2] = stringOne[j];
  }
  
  for (i = 0; i < 13; i ++) {
    if (i + 2 < 13)
      lcs[i+2][0] = stringTwo[i];
  }
  
  for (i = 2; i < 13; i++) {
    for (j = 2; j < 13; j++) {
      if ((lcs[0][j] == lcs[i][0]) & (lcs[i][j] == lcs[i][j-1])) {
        lcs[i][j] += 1;
        for (n = i; n < 13; n++) {
          for (m = j; m < 13; m++) {
            if (lcs[i][j] > lcs[n][m])
              lcs[n][m] = lcs[i][j];
          }
        }
        break;
      }
    }
  }
  
  printf("\n");
  
  for (i = 0; i < 13; i++) {
    for (j = 0; j < 13; j++)
    if (lcs[i][j] > 12)
      printf("%c ", lcs[i][j]);
    else
      printf("%d ", lcs[i][j]);
    printf("\n");
  }
  
  printf("\n");
  
  k = lcs[12][12];
  int s = 0;
  char result[12] = {0};
  
  for (i = 12; i > 1; i--) {
    for (j = 12; j > 1; j--)
    if ((lcs[0][j] == lcs[i][0]) & (lcs[i-1][j-1] == k - 1) & (lcs[i][j] > 0)){
      result[s] = stringOne[j-2];
      s += 1;
      k -= 1;
    }
  }
  
  for (i = 0; i < 12; i++)
  printf("%c ", stringOne[i]);
  printf("\n");
  for (i = 0; i < 12; i++)
  printf("%c ", stringTwo[i]);
  printf("\n");
  printf("\n");
  
  for (i = s - 1; i > -1; i--)
  printf("%c ", result[i]);
  
  printf("\n");
  printf("\n");
  
}

void menu()
{
  printf("1 - task 1\n");
  printf("2 - task 2\n");
  printf("0 - exit\n");
}
