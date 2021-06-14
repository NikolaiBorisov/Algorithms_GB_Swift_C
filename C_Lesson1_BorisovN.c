#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void solution1();
void solution2();
void solution3();
void solution4();
void solution5();
void solution6();
void solution7();
void solution8();
void solution9();
void solution10();
void solution11();
void solution12();
void solution13();
void solution14();
void menu();

int maxInt(int a, int b, int c)
{
	if ((a > b) || (a = b)) {
		if (a > c)
			return a;
		return c;
	}
	else {
		if ((b > c) || (b = c))
			return b;
		else
			return c;
	}
}

int main(int argc, const char * argv[]) {
	int selector = 0;
	do
	{
		menu();
		scanf("%i", &selector);
		switch (selector)
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
		case 13:
			solution13();
			break;
		case 14:
			solution14();
			break;
		case 0:
			printf("The end\n");
			break;
		default:
			printf("Wrong selected\n");
		}
	} while (selector != 0);

	printf("Hello!\n");
	return 0;
}

// 1. Ввести вес и рост человека. Рассчитать и вывести индекс массы тела по формуле I=m/(h*h); где m-масса тела в килограммах, h - рост в метрах.

void solution1()
{
	printf("Solution 1\n");

	double m;
	double h;
	double bmi;

	printf("Enter your weight (in kg) and height (in meters)\n");
	printf("Enter example 84-1.77 :\n");
	scanf("%lf-%lf", &m, &h);

	bmi = m / (h * h);
	
	printf("Your BMI = %lf", bmi);
}

// 2. Найти максимальное из четырех чисел. Массивы не использовать.

void solution2()
{
	printf("Solution 2\n");

	int x1;
	int x2;
	int x3;
	int x4;
	int count = 4;

	printf("Enter four numbers 1-2-3-4 : \n");
	scanf("%d-%d-%d-%d", &x1, &x2, &x3, &x4);

	while (x1 != x2)
		if (x1 > x2) {
			x2 = x1;
			count -= 1;
		}

	while (x2 != x3)
		if (x2 > x3) {
			x3 = x2;
			count -= 1;
		}

	while (x3 != x4)
		if (x3 > x4) {
			x4 = x3;
			count -= 1;
		}

	if (count > 1)
		printf("Total %d numbers %d\n", count, x4);
	else
		printf("Max number is %d \n", x4);
}

// 3. Написать программу обмена значениями двух целочисленных переменных: a.с использованием третьей переменной; b.* без использования третьей переменной.

void solution3()
{
	printf("Solution 3\n");

	int x1;
	int x2;
	int c;

	printf("Enter two numbers. Example: 1-2 : \n");
	scanf("%d-%d\n", &x1, &x2);
	printf("now x1 = %d, x2 = %d\n", x1, x2);

	c = x1;
	x1 = x2;
	x2 = c;

	printf(" and now x1 = %d, x2 = %d\n", x1, x2);

	x1 = x1 * x2;
	x2 = x1 / x2;
	x1 = x1 / x2;

	printf(" and now x1 = %d, x2 = %d\n", x1, x2);

	x1 = x1 + x2;
	x2 = x1 - x2;
	x1 = x1 - x2;

	printf(" and now x1 = %d, x2 = %d\n", x1, x2);
}

// 4. Написать программу нахождения корней заданного квадратного уравнения.

void solution4()
{
	printf("Solution 4\n");

	int x1;
	int x2;
	int a = 0;
	int b = 0;
	int c = 0;
	int d;

	printf("Enter the arguments of the equation a*x^2+b*x+c=0 : \n");
	printf("Example: 1-2-3 : \n");
	scanf("%d-%d-%d", &a, &b, &c);

	d = b * b - 4 * a * c;

	if (d > 0) {

		int i = 0;

		while (i * i < d) {
			i++;
		}

		if (i * i == d) {
			x1 = (-b - i) / 2 * a;
			x2 = (-b + i) / 2 * a;
			printf("x1 = %d, x2 = %d\n", x1, x2);

		}
		else {

			double x11 = (-(double)b - (double)i + 1) / 2 * (double)a;
			double x12 = (-(double)b - (double)i) / 2 * (double)a;
			double x21 = (-(double)b + (double)i - 1) / 2 * (double)a;
			double x22 = (-(double)b + i) / 2 * (double)a;

			printf("x1 ranges from %.1f to %.1f\n", x11, x12);
			printf("x2 ranges from %.1f to %.1f\n", x21, x22);
		}

	}

	if (d < 0)
		printf("D < 0. No roots\n");
	if (d == 0) {
		x1 = -b / 2 * a;
		printf("x1 = x2 = %d\n", x1);
	}
}


//5. С клавиатуры вводится номер месяца. Требуется определить, к какому времени года он относится.

void solution5()
{
	printf("Solution 5\n");

	int x;

	printf("Enter the month number\n");
	scanf("%d", &x);

	if (0 < x & x < 13) {
		if (x == 12 || x < 3)
			printf("Winter\n");
		if (x > 2 & x < 6)
			printf("Spring\n");
		if (x > 5 & x < 9)
			printf("Summer\n");
		if (x > 8 & x < 12)
			printf("Fall\n");
	}
	else
		printf("Wrong number. Thr range is from 1 to 12\n");
}

//6. Ввести возраст человека (от 1 до 150 лет) и вывести его вместе с последующим словом «год», «года» или «лет».

void solution6()
{
	printf("Solution 6\n");

	int x;

	printf("Enter the age\n");
	scanf("%d", &x);

	if (x == 1 || (x % 10 == 1 & x > 20))
		printf("%d год\n", x);
	if ((x % 10 > 1 & x % 10 < 5) & (x > 20 || x < 5))
		printf("%d года\n", x);
	if ((x % 10 > 4 & x % 10 < 10) || x % 10 == 0 || (x > 5 & x < 20))
		printf("%d лет\n", x);
}

//7. С клавиатуры вводятся числовые координаты двух полей шахматной доски (x1,y1,x2,y2). Требуется определить, относятся поля к одному цвету или нет.

void solution7()
{
	printf("Solution 7\n");

	int x1;
	int x2;
	int y1;
	int y2;
	int Black1;
	int Black2;

	printf("Enter the coordinates of the first field : \n");
	printf("Example: 1-5 : \n");
	scanf("%d-%d", &x1, &y1);

	printf("Enter the coordinates of the second field : \n");
	printf("Example: 2-4 : \n");
	scanf("%d-%d", &x2, &y2);

	if ((x1 > 0 & x1 < 9) & (y1 > 0 & y1 < 9) & (x2 > 0 & x2 < 9) & (y2 > 0 & y2 < 9)) {

		if (x1 % 2 == 1) {
			if (y1 % 2 == 1)
				Black1 = 1;
			else
				Black1 = 0;
		}
		else {
			if (y1 % 2 == 1)
				Black1 = 0;
			else
				Black1 = 1;
		}

		if (x2 % 2 == 1) {
			if (y2 % 2 == 1)
				Black2 = 1;
			else
				Black2 = 0;
		}
		else {
			if (y2 % 2 == 1)
				Black2 = 0;
			else
				Black2 = 1;
		}

		if (Black1 == Black2)
			printf("Fields have the same color\n");
		else
			printf("Fields have different color\n");
	}

	else
		printf("The size of the chess board is 8x8\n");

}

//8. Ввести a и b и вывести квадраты и кубы чисел от a до b.

void solution8()
{
	printf("Solution 8\n");

	int a;
	int b;
	int count = 1;

	printf("Enter A and B, where A < B : \n");
	scanf("%d-%d", &a, &b);

	while (a < b || a == b) {
		printf("%d - int %d and ^2 = %d, ^3 = %d \n", count, a, a * a, a * a * a);
		count += 1;
		a += 1;
	}
}

//9. Даны целые положительные числа N и K. Используя только операции сложения и вычитания, найти частное от деления нацело N на K, а также остаток от этого деления.

void solution9()
{
	printf("Solution 9\n");

	int n;
	int k;
	int i = 0;

	printf("Enter N and K : \n");
	scanf("%d-%d", &n, &k);

	if (n > k & k > 0) {
		while (n > k) {
			n = n - k;
			i += 1;
		}

		printf("N / K = %d modulo %d\n", i, n);
	}
	else
		printf("N > K > 0 !\n");
}

//10. Дано целое число N (> 0). С помощью операций деления нацело и взятия остатка от деления определить, имеются ли в записи числа N нечетные цифры. Если имеются, то вывести True, если нет — вывести False.

void solution10()
{
	printf("Solution 10\n");

	int n;
	int n2;
	int i = 1;

	printf("Enter N : \n");
	scanf("%d", &n);

	n2 = n;

	while (n2 > 10) {
		n2 = n2 / 10;
		i = i * 10;
	}

	while (i > 1) {

		if ((n % i) % 2 == 0)
			i = i / 10;

		if ((n % i) % 2 == 1) {
			printf("True! N has odd numbers!\n");
			i = 0;
		}
	}

	if (i != 0)
		printf("False! N does't have even numbers!\n");
}

//11. С клавиатуры вводятся числа, пока не будет введен 0. Подсчитать среднее арифметическое всех положительных четных чисел, оканчивающихся на 8

void solution11()
{
	printf("Solution 11\n");

	int counter = 0;
	int grade = 0;
	int check;
	double sum = 0;
	double average;

	do {
		check = grade;

		if (grade > 9) {
			check = grade % 10;
		}

		if (check % 8 == 0 & check != 0) {
			counter += 1;
			sum = sum + grade;
		}

		printf("%s", "Enter grade : \n");
		scanf("%d", &grade);

	} while (grade != 0);

	if (counter != 0) {
		average = sum / counter;
		printf("Average %d numbers ending with 8 is %g\n", counter, average);
	}
	else {
		printf("No numbers with suffix = 8\n");
	}
}

//12. Написать функцию нахождения максимального из трех чисел.

void solution12()
{
	printf("Solution 12\n");

	int x1;
	int x2;
	int x3;

	printf("Enter x1, x2, x3, : \n");
	scanf("%d-%d-%d", &x1, &x2, &x3);

	printf("Maximum int : %d\n", maxInt(x1, x2, x3));
}

//13. * Написать функцию, генерирующую случайное число от 1 до 100. а) с использованием стандартной функции rand() б) без использования стандартной функции rand()

void solution13()
{
	printf("Solution 13\n");

	int v;

	printf("Enter method 0 or 1 : \n");
	scanf("%d", &v);

	if (v == 0) {
		printf("Random int = %d\n", rand() % 99 + 1);
	}

	if (v == 1) {

		int x;

		time_t s;
		s = time(NULL);

		x = (s * s * s + s * s + s) % 99 + 1;
		x = (x * x) % 99 + 1;

		printf("Random int = %d\n", x);
	}
}

//14. *Автоморфные числа. Натуральное число называется автоморфным, если оно равно последним цифрам своего квадрата. Например, 625^2 = 390 625 . Напишите программу, которая вводит натуральное число N и выводит на экран все автоморфные числа, не превосходящие N.

void solution14()
{
	printf("Solution 14\n");

	int n;

	int i = 0;
	int iR;
	int iF;
	int k = 1;
	int k2 = 1;
	int kF;


	printf("Enter N : \n");
	scanf("%d", &n);

	while (i < n) {

		iR = i;

		while (iR > 10) {
			iR = iR / 10;
			k = k * 10;
		}

		iR = i * i;

		while (iR > 10) {
			iR = iR / 10;
			k2 = k2 * 10;
		}

		kF = k2 / k;
		iF = (i * i) % kF;

		if (i == iF)
			printf("An automorphic number is %d\n", i);

		k = k2 = 1;
		i += 1;
	}
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
	printf("13 - task 13\n");
	printf("14 - task 14\n");
	printf("0 - exit\n");
}