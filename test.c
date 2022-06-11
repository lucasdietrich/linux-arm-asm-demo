#include <stdio.h>
#include <stdbool.h>

void test1(bool a, bool b, bool c)
{
    if (a) {
        if (b) {
            if (c) {
                printf("OK\n");
            } else {
                printf("NOK c\n");
            }
        } else {
            printf("NOK b\n");
        }
    } else {
        printf("NOK a\n");
    }
}

void test2(bool a, bool b, bool c)
{
    if (!a) {
        printf("NOK a\n");
        return;
    }

    if (!b) {
        printf("NOK b\n");
        return;
    }

    if (!c) {
        printf("NOK c\n");
        return;
    }

    printf("OK\n");
}

void test3(bool a, bool b, bool c)
{
    bool success = true;

    if (!a) {
        success = false;
        printf("NOK a\n");
    }

    if (!b && success) {
        success = false;
        printf("NOK b\n");
    }

    if (!c && success) {
        success = false;
        printf("NOK c\n");
    }

    if (success) {
        printf("OK\n");
    }
}

void test4(bool a, bool b, bool c)
{
    if (!a) {
        printf("NOK a\n");
    } else if (!b) {
        printf("NOK b\n");
    } else if (!c) {
        printf("NOK c\n");
    } else {
        printf("OK\n");
    }
}