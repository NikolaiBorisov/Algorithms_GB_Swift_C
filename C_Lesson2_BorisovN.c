#include <stdio.h>
#define ARR_SIZE 100

void solution1();
void solution2();
void menu();

int binary[ARR_SIZE] = {0};
int size = 0;
int i = 0;
int p = 1;

int convertToBinary(int a, int i)
{
    binary[i] = a % 2;
    i += 1;
    size = i;
    
    if (a >= 2) {
        printf("%d", a % 2);
        return(convertToBinary(a / 2, i));
    } else {
        return a % 2;
    }
}

int powerA(int a, int b, int p)
{
    while(b) {
        p = p * a;
        b -= 1;
    }
    
    return p;
}

int powerB(int a, int b, int p)
{
    if (b > 0) {
        return powerB(a, b - 1, p * a);
    } else {
        return p;
    }
}

int powerC(int a, int b, int p)
{
    if (b > 0) {
        if (b % 2 == 0) {
            return powerC(a * a, b / 2, p);
        } else {
        return powerC(a, b - 1, p * a);
        }
    } else {
        return p;
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

//1. Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию.

void solution1()
{
    printf("Solution 1\n");

    int a;

    printf("Enter any integer: \n");
    scanf("%d", &a);

    printf("%d : The result \n",convertToBinary(a, 0));
    
    for(i = size - 1; i >= 0; i--)
        printf("%d", binary[i]);
    printf("\n");
    
}

//2. 2. Реализовать функцию возведения числа a в степень b: a. без рекурсии; b. рекурсивно; c. *рекурсивно, используя свойство четности степени.

void solution2()
{
    printf("Solution 2\n");
   
    int a;
    int b;

    printf("Enter two integers, example 2-3 : \n");
    scanf("%d-%d", &a, &b);

    printf("Option 'a' : %d\n",powerA(a, b, 1));
    printf("Option 'b' : %d\n",powerB(a, b, 1));
    printf("Option 'c' : %d\n",powerC(a, b, 1));
    
    
}

void menu()
{
    printf("1 - task 1\n");
    printf("2 - task 2\n");
    printf("0 - exit\n");
}