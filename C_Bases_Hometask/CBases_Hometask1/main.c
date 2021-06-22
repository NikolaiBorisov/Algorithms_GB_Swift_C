//
//  main.c
//  CBases_Hometask1
//
//  Created by NIKOLAI BORISOV on 21.06.2021.
//

#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <math.h>
#include <string.h>

void solution1(void);
void solution2(void);
void solution3(void);
void solution4(void);
void solution5(void);
void solution6(void);
void solution7(void);
void solution8(void);
void solution9(void);
void solution10(void);
void solution11(void);
void solution12(void);
void menu(void);

typedef struct rectangle {
  int height;
  int width;
  int area;
  int perimeter;
} Rectangle;

typedef struct point {
  int x;
  int y;
} Point;

typedef struct line {
  float length;
  Point p1;
  Point p2;
} Line;

Line initline(int x1, int y1, int x2, int y2) {
  Line line;
  line.p1.x = x1;
  line.p1.y = y1;
  line.p2.x = x2;
  line.p2.y = y2;
  line.length = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  return  line;
}

int isPrimeNumber(int number) {
  int d = 0, i = 1;
  while (i <= number) {
    if (number % i++ == 0)
      d++;
    else
      continue;
    
    if (d == 3) return 0;
    
  }
  return  (d == 2);
}

int calculateQuadraticEquation(int a, int b, int c, float* x1, float* x2) {
  double D;
  D = b * b - 4 * a * c;
  if (a == 0) {
    *x1 = -c / b;
    return 0;
  } else if (D > 0) {
    *x1 = (-b + sqrt(D)) / 2 * a;
    *x2 = (-b - sqrt(D)) / 2 * a;
    return 1;
  } else if (D == 0) {
    *x1 = -b / (2 * a);
    return 0;
  } else {
    return -1;
  }
}

int oddDoubler(int* arr, int len) {
  int i;
  int changed = 0;
  for (i = 0; i < len; i++) {
    if (arr[i] % 2 != 0) {
      arr[i] *= 2;
      changed = 1;
    }
  }
  return changed;
}

void asShortPrint(unsigned int* a, int len) {
  int i;
  unsigned short* out = a;
  for (i = 0; i < len * 2; i++) {
    printf("%d ", *(out + i));
  }
}

void decToBin(int in, char* result) {
  char out[64];
  int i = 0;
  int temp = in;
  while (temp != 0) {
    temp = temp >> 1;
    i++;
  }
  out[i] = '\0';
  while (in > 0) {
    out[--i] = (in % 2) ? '1' : '0';
    in /= 2;
  }
  strcat(result, out);
}

void calcRectangle(Rectangle *r) {
  r ->area = r->height * r->width;
  r->perimeter = (r->height + r->width) * 2;
}

int* arrayInit(int l) {
  return  calloc(l, sizeof(int));
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
      case 4:
        solution4();
        break;
      case 5:
        solution5();
        break;
      case 6:
        solution6();
        break;
      case 7:
        solution7();
        break;
      case 8:
        solution8();
        break;
      case 9:
        solution9();
        break;
      case 10:
        solution10();
        break;
      case 11:
        solution11();
        break;
      case 12:
        solution12();
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

void solution1()
{
  printf("Solution 1\n");
  
  // 1) Математика. Есть формула (расчёта резисторного делителя) Uo = Ui * (R1 / (R2 + R1)). Напишите формулы расчёта каждой переменной по отдельности, в формате: Ui = ...; R1 = ...; R2 = ...;
  
  setlocale(LC_ALL, "");
  // 1. Вывод формул в виде строк
  printf("Исходная формула: Uo = Ui * (R1 / (R2 + R1));\n");
  printf("---------------------------------------------\n");
  printf("Расчет: Ui = (Uo * (R2 + R1)) / R1;\n");
  printf("Расчет: R1 = Uo * R2 / (Ui - Uo);\n");
  printf("Расчет: R2 = R1 * (Ui - Uo) / Uo;\n");
  printf("\n");
}

void solution2()
{
  printf("Solution 2\n");
  
  // 2. Условия. Запросить у пользователя любое целое число. Написать программу которая проверит, входит ли введённое число в диапазон (например, от 0 до 100, включительно) и выведет на экран сообщение о результате проверки.
  const int RANGE_MIN = 0;
  const int RANGE_MAX = 100;
  int input;
  printf("Enter a number: ");
  scanf("%d", &input);
  printf("Your number '%d' %s fit the range of (%d to %d)\n",
         input,
         (input >= RANGE_MIN && input <= RANGE_MAX) ? "" : "does not",
         RANGE_MIN,
         RANGE_MAX
         );
  printf("---------------------------------------------\n");
}

void solution3()
{
  printf("Solution 3\n");
  // 3. Циклы. Запросить у пользователя десять чисел. Вывести на экран среднее арифметическое введённых чисел.
  
  const int NUMS_TO_ASK = 10;
  int i = 0;
  float total = 0;
  int input;
  do {
    printf("Enter a number: ");
    scanf("%d", &input);
    total += input;
  } while (++i < NUMS_TO_ASK);
  printf("The mean of entered numbers is: %.2f\n", total / i);
  printf("---------------------------------------------\n");
}

void solution4()
{
  printf("Solution 4\n");
  // 4. Запросить у пользователя количество используемых для вывода строк. Написать программу, которая при помощи циклов и символа ^ будет рисовать на указанном количестве строк равнобедренный треугольник.
  
  int lines;
  printf("Enter number of lines: ");
  scanf("%d", &lines);
  int j;
  int i = 0;
  for (i = 0; i < lines; i++) {
    for (j = 1; j < lines - i; j++)
    printf(" ");
    
    for (j = lines - i * 2; j <= lines; j++)
    printf("^");
    
    printf("\n");
  }
  printf("---------------------------------------------\n");
}

void solution5()
{
  printf("Solution 5\n");
  // 5. Определить является ли введенное число  простым.
  int number;
  printf("Введите число: ");
  scanf("%d", &number);
  printf("Введенное число %d %sявляется простым \n", number, isPrimeNumber(number) ? "" : "не ");
}

void solution6()
{
  printf("Solution 6\n");
  
  // 6.Указатели. Используя заголовочный файл <math.h>, описать функцию, int calculateSquareEquality(int a, int b, int c, float* x1, float* x2); Которая будет решать квадратное уравнение вида a * x ^ 2 + b * x + c = 0 и записывать корни этого уравнения в переменные, адреса которых переданы в качестве указателей х1 и х2. Функция должна вернуть -1, если уравнение не имеет корней, 0, если у уравнения есть один корень, и 1, если у уравнения два корня.
  
  float a, b, c, x1, x2;
  
  printf("This program will calculate quadratic equation 'ax2 + bx + c = 0'");
  printf("\n Enter a:");
  scanf("%f", &a);
  printf("\n Enter b:");
  scanf("%f", &b);
  printf("\n Enter c:");
  scanf("%f", &c);
  
  int result;
  result = calculateQuadraticEquation(a, b, c, &x1, &x2);
  switch (result) {
    case 0:
      printf("Equation has a unique root x = %f\n", x1);
      break;
    case 1:
      printf("Equation has two roots x1 = %f, x2 = %f\n", x1, x2);
      break;
    case -1:
      printf("Equation has no roots\n");
      break;
    default:
      printf("Exceptional answer: %d\n", result);
  }
}

void solution7()
{
  printf("Solution 7\n");
  
  // 7. Инициализировать массив из целых чисел, описать функцию, принимающую на вход этот массив. Функция должна вернуть ноль, если в массиве нет нечётных чисел, в противном случае удвоить все нечётные числа в массиве и вернуть единицу. После выполнения функции, если массив был изменён, вывести все числа из массива на экран.
  
  const int ARRAY_SIZE = 10;
  int ARRAY[ARRAY_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int i;
  if (oddDoubler(ARRAY, ARRAY_SIZE))
    for (i = 0; i < ARRAY_SIZE; i++)
  printf("%d ", *(ARRAY + i));
  printf("\n");
  
}
void solution8()
{
  printf("Solution 8\n");
  
  // 8. Как известно, переменная типа integer занимает в памяти 4 байта, а переменная типа short два байта. Опишите функцию, которая принимает массив из тридцатидвухразрядных чисел (типа int), и выводит его на экран шестнадцатиразрядными числами (типа short). Это, по сути, задача приведения типа массива. Широко применяется для расшифровывания данных из входящих потоков или логов цифровых систем.
  const int ARRAY_SIZE = 10;
  unsigned int arr[ARRAY_SIZE] = {20000000, 1000000, 3000000, 4000000, 10000, 200000, 30000, 400000, 65535, 65536};
  asShortPrint(arr, ARRAY_SIZE);
  printf("\n");
}

void solution9()
{
  printf("Solution 9\n");
  
  // 9. Строки. Описать функцию, возвращающую строку с двоичным представлением десятичного числа, переданного в аргументе этой функции.
  
  char bin[64] = "b'";
  int number;
  printf("Enter a number :");
  scanf("%d", &number);
  decToBin(number, bin);
  printf("Your number in binary is: %s\n", bin);
}

void solution10()
{
  printf("Solution 10\n");
  
  // 10. Структуры.Описать структуру "прямоугольник", содержащую целочисленные значения длины, ширины, периметра и площади прямоугольника. Написать функцию, принимающую на вход указатель на структуру, подсчитывающую и записывающую площадь и периметр данного прямоугольника в структуру.
  
  Rectangle rectangle;
  printf("Enter rect height: ");
  scanf("%d", &rectangle.height);
  printf("Enter rect width: ");
  scanf("%d", &rectangle.width);
  
  calcRectangle(&rectangle);
  printf("Your rectangle's area is : %d, and P length is %d\n", rectangle.area, rectangle.perimeter);
}

void solution11()
{
  printf("Solution 11\n");
  
  // 11. Выделение памяти.Написать функцию-обёртку, возвращающую указатель на область памяти, которую затем можно использовать как массив из элементов типа integer. Количество элементов указывается в аргументе функции. Массив должен быть гарантированно инициализирован нулями. Для проверки - заполните этот массив и выведите на экран.
  
  const int ARR_SIZE = 5;
  int *array = arrayInit(ARR_SIZE);
  int i;
  for (i = 0; i < ARR_SIZE; i++)
  printf("%d ", *(array + i));
  puts("");
  for (i = 0; i < ARR_SIZE; i++)
  *(array + i) = i * 10;
  for (i = 0; i < ARR_SIZE; i++)
  printf("%d ", *(array + i));
  puts("");
}

void solution12()
{
  printf("Solution 12\n");
  
  // 12. Starred. line (points)
  
  Line l = initline(5, 4, 8, 9);
  printf("Your line's point1 is: x = %d, y = %d\n", l.p1.x,  l.p1.y);
  printf("Your line's point2 is: x = %d, y = %d\n", l.p2.x,  l.p2.y);
  printf("Your line's length is: %f\n", l.length);
}

void menu()
{
  printf("1 - task 1\n");
  printf("2 - task 2\n");
  printf("3 - task 3\n");
  printf("4 - task 4\n");
  printf("5 - task 5\n");
  printf("6 - task 6\n");
  printf("7 - task 7\n");
  printf("8 - task 8\n");
  printf("9 - task 9\n");
  printf("10 - task 10\n");
  printf("11 - task 11\n");
  printf("12 - task 12\n");
  printf("0 - exit\n");
}
