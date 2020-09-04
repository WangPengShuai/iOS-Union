//
//  main.c
//  01_CTest
//
//  Created by wps on 2020/8/28.
//  Copyright © 2020 wps. All rights reserved.
//

#include <stdio.h>

/* 函数声明*/
int max(int num1, int num2);

int main(int argc, const char * argv[]) {
    /* 局部变量定义*/
    int a = 100;
    int b = 200;
    int ret;
    
    /* 调用函数来获取最大值*/
    ret = max(a, b);
    
    printf("Max value is: %d\n", ret);
    
    int n[10];
    int i,j;
    
    for (i = 0; i < 10; i++) {
        n[i] = i + 100;
    }
    
    for (j = 0 ; j < 10; j++) {
        printf("Element[%d] = %d\n", j, n[j]);
    }
    
    return 0;
}

//默认情况下，C 使用传值调用来传递参数。一般来说，这意味着函数内的代码不能改变用于调用函数的实际参数。
int max(int num1, int num2) {
    /* 局部变量声明*/
    int result;
    
    if (num1 > num2)
        result = num1;
    else
        result = num2;
    
    return result;
}
