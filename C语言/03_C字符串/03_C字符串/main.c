//
//  main.c
//  03_C字符串
//
//  Created by wps on 2020/8/28.
//  Copyright © 2020 wps. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
    
    printf("Greeting message: %s\n", greeting);
    
    char str1[12] = "hello";
    char str2[12] = "World";
    char str3[12];
    int len;
    
    strcpy(str3, str1);
    printf("strcpy(str3, str1): %s\n", str3);
    
    strcat(str1, str2);
    printf("strcat(str1, str2): %s\n", str1);
    
    len = strlen(str1);
    printf("strlen(str1): %d\n", len);
    
    
    
    
    return 0;
}
