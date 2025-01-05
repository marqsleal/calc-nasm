#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef long (*operation_func)(long, long);

long sum(long a, long b);
long subtract(long a, long b);
long multiplication(long a, long b);
long division(long a, long b);

int main (int argc, char *argv[]) {

    if (argc != 4) {
        printf("Usage: ./calc.out <operation> <num1> <num2>\n");
        return 1;
    }

    char* operation = argv[1];
    long a = atol(argv[2]);
    long b = atol(argv[3]);
    long result = 0;

    struct {
        const char* op_name;
        operation_func op_func;
    } 
    
    operations[] = {
        {"sum", sum},
        {"sub", subtract},
        {"mult", multiplication},
        {"div", division}
    };

    for (int i = 0; i < sizeof(operations) / sizeof(operations[0]); i++) {
        if (strcmp(operation, operations[i].op_name) == 0) {
            result = operations[i].op_func(a, b);
            printf("%ld %s %ld = %ld\n", a, operation, b, result);
            return 0;
        }
    }

    printf("Invalid operation\n");
    return 1;    
}