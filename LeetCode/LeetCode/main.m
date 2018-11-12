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
// 选择
void selectSort(){
    int selectA[8] = {5,7,3,6,2,1,4,8};
    int min ;
    for (int i = 0; i < 8; i ++) {
        min = i;
        for (int j = i+1; j < 8; j++) {
            if (selectA[min] > selectA[j]) {
                min = j;
            }
        }
        if (min != i) {
            int temp = selectA[min];
            selectA[min] = selectA[i];
            selectA[i] = temp;
        }
    }
    for (int i = 0; i < 8; i ++) {
        NSLog(@"选择排序结果---%d",selectA[i]);
    }
}
// 插入
void insertSort(){
    int insertA[8] = {5,7,3,6,2,1,4,8};
    for (int i = 0; i < 8; i++) {
        int j = i;
        while (j > 0 && insertA[j] < insertA[j-1]) {
            int temp = insertA[j];
            insertA[j] = insertA[j-1];
            insertA[j-1] = temp;
            j--;
        }
    }
    for (int i = 0; i < 8; i ++) {
        NSLog(@"插入排序结果---%d",insertA[i]);
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
//    selectSort();
//    insertSort();

    return 0;
}

