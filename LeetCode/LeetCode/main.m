//
//  main.m
//  LeetCode
//
//  Created by 李 on 2018/10/22.
//  Copyright © 2018 LF. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>

typedef int Status;
typedef struct Node{
    int data;
    struct Node *next;
} Node;

typedef struct Node *LinkList;


Status GetElem(LinkList L , int i, int e){
    int j = 1;
    LinkList p ;
    p = L->next;
    while (p && j < i) {
        p = p->next;
        j++;
    }
    if (!p && j > i) {
        return -1;
    }
    e = p->data;
    return e;
}

Status insertList(LinkList L , int i , int e){
    int j = 1;
    LinkList p ,s;
    p = L;
    while (p && j < i) {
        p = p->next;
        j ++;
    }
    if (!p && j > i) {
        return -1;
    }
    s = (LinkList)malloc(sizeof(Node));
    s->data = e;
    s->next = p->next;
    p->next = s;
    return 1;
}
Status deleteList(LinkList L , int i , int e){
    int j = 1;
    LinkList p , s;
    p = L;
    while (p && j < i) {
        p = p->next;
        j ++;
    }
    if (!p && j > i) {
        return -1;
    }
    s = p->next;
    p->next = s->next;
    free(s);
    return 1;
}
Status createList(LinkList L , int n){
    LinkList s , p;
    int i;
//    srand(time(0));
    s = L;
    for (i = 0; i < n; i ++) {
        p = (LinkList)malloc(sizeof(Node));
        p->data = rand()%100+1;
        s->next = p;
        s = p;
    }
    s->next = NULL;

    return 1;
    
}


int a[8] = {5,7,3,6,2,1,4,8};

void bubbleSort(){
    int count;
    NSLog(@"请输入");
    scanf("%d",&count);
//    int count = sizeof(a)/4;
    for (int i = 0 ; i < count; i ++) {
        for (int j = 0 ; j < count - i; j++) {
            if (a[j] < a[j+1]) {
                int temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }
    }
    
    for (int i = 0; i < count; i ++) {
        NSLog(@"%d",a[i]);
    }
}
// 快排
void quickSortProcess(int left , int right){
    if (left > right) {
        return;
    }
    int temp = a[left];
    int x = left;
    int y = right;
    while (x!= y) {
        while (y > x && a[y] >= temp) {
            y--;
        }
        while (y > x && a[x] <= temp) {
            x++;
        }
        if (x < y) {
            int t = a[x];
            a[x] = a[y];
            a[y] = t;
        }
    }
    a[left] = a[x];
    a[x] = temp;
    
    quickSortProcess(left, x-1);
    quickSortProcess(x+1, right);
    return;
    
}
void quickSort(){
    int count = sizeof(a)/4;
    quickSortProcess(0, count - 1);
    for (int i = 0; i < count; i ++) {
        NSLog(@"快排结果---%d",a[i]);

    }
}




int main(int argc, const char * argv[]) {
//    bubbleSort();
//    quickSort();

    LinkList L = (LinkList)malloc(sizeof(Node));
    createList(L, 5);
    insertList(L, 3, 99);
    deleteList(L, 2, 2);
    LinkList q = L;
    while (q && q->next) {
        q = q->next;
        NSLog(@"-@@-%d",q->data);
    }
    return 0;
}

