//
//  main.m
//  LeetCode
//
//  Created by 李 on 2018/10/22.
//  Copyright © 2018 LF. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>


#define MAXSIZE 10


typedef struct BiTNode{
    int data;
    int bf;
    struct BiTNode *lchild , *rchild;
} BiTNode, *BiTree;

typedef int Status;
typedef struct Node{
    int data;
    struct Node *next;
} Node;

typedef struct Node *LinkList;
typedef char String;


typedef struct Stack{
    int data[MAXSIZE];
    int top;
}Stack;
typedef struct Stack *lfStack;


// 二叉树的右旋
void R_Rotate(BiTree *p){
    BiTree L;
    L = (*p) ->lchild;
    (*p) -> lchild = L ->rchild;
    L ->rchild = (*p);
    *p = L;
}
// 二叉树的左旋
void L_Rotate(BiTree *p){
    BiTree R;
    R = (*p)->rchild;
    (*p) ->rchild = R ->lchild;
    R ->lchild = (*p);
    *p = R;
}
void LeftBalance(BiTree *p){
    
    
    
    
}


// 字符串 KMP模式匹配算法
Status get_next(String t , int *next){
    
    
    
    
    return 0;
}


// tree
Status proOrderTraverse(){
    return 1;
}
Status FibonnacciSearch(int n , int key){
    int a[20] = {0,1,16,24,34,47,59,62,73,88,99};
    int low , high , mid , i , k;
    k = 0;
    low = 1;
    high = n;
    int F[13] = {0,1,1,2,3,5,8,13,21,34,55,89};
    while (n > F[k] - 1) {
        k++; // 找到角标
    };
    for(i=n; i<F[k]-1;i++){
        a[i]=a[n]; // 填充数据
    }
    while (low <= high) {
        mid = low + F[k - 1] - 1;
        if(key < a[mid]){
            high = mid - 1;
            k = k - 1;
        }else if (key > a[mid]){
            low = mid + 1;
            k = k - 2;
        }else{
            if(mid <= n){
                return mid;
            }else
                return n;
            
        }
    }
     return 0;
}


// 栈
Status stackPush(lfStack s , int e){
    
    if(s->top == MAXSIZE -1){
        return -1;
    }
    s->top++;
    s->data[s->top] = e;
    return 1;
}
Status popStack(lfStack s , int *e){
    if (s->top == -1) {
        return -1;
    }
    *e = s->data[s->top];
    s->top--;
    return 1;
}


// 链
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

LinkList reverseList(LinkList L){
    if (L == NULL || L->next == NULL) {
        return NULL;
    }
    LinkList head = L;
    LinkList r ;
    LinkList temp = head->next;
    head->next = NULL; // 尾节点
    while (temp) {
        r = temp->next;
        temp->next = head;
        head = temp;
        temp = r;
    }
    return head;
}
LinkList swapPairs(LinkList head){
    struct Node* left;
    struct Node* right;
    if (head == NULL || head->next == NULL) {
        return head;
    }
    struct Node* current ;
    current = head;
    struct Node* temp = (struct Node*)malloc(sizeof(struct Node));
    temp->data = 0;
    temp->next = head;
    left = temp->next;
    right = left->next;
    while (right) {
        left->next = right->next;
        temp->next = right;
        right->next = left;
        temp = left;
        left = left->next;
        if (left == NULL) {
            break;
        }
        right = left->next;
        if (right == NULL) {
            break;
        }
    }
    return head->next;
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
Status createList(LinkList *L , int n , int *nums){
    LinkList s , p;
    int i;
    *L = (LinkList)malloc(sizeof(Node));
//    srand(time(0));
    s = *L;
    for (i = 0; i < n; i ++) {
        p = (LinkList)malloc(sizeof(Node));
        p->data = nums[i];
        s->next = p;
        s = p;
    }
    s->next = NULL;

    return 1;
    
}


// 排序
int a[8] = {5,7,3,6,2,1,4,8};

void swap(int a[] , int i , int j){
    
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
    
}


void bubbleSort(){
    int count;
    NSLog(@"请输入");
    scanf("%d",&count);
//    int count = sizeof(a)/4;
    for (int i = 0 ; i < count; i ++) {
        for (int j = count -1  ; j >= i; j--) {
            if (a[j] < a[j+1]) {
                swap(a , j , j+1);
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
    int i , j;
//    for (int i = 0; i < 8; i++) {
//        int j = i;
//        while (j > 0 && insertA[j] < insertA[j-1]) {
//            int temp = insertA[j];
//            insertA[j] = insertA[j-1];
//            insertA[j-1] = temp;
//            j--;
//        }
//    }
    for(i=1;i<8;i++){
        if (insertA[i] < insertA[i - 1]) {
            int temp = insertA[i];
            for (j = i - 1; (insertA[j] > temp) && (j >=0); j--) {
                insertA[j+1] = insertA[j];
            }
            insertA[j + 1] = temp;
            
            for (int m = 0; m< 8; m ++) {
                NSLog(@"插入排序结果---%d",insertA[m]);
            }
        }
    };
    
    
    for (int i = 0; i < 8; i ++) {
        NSLog(@"插入排序结果---%d",insertA[i]);
    }
}


// 堆排序
void HeapAdjust(int a[] , int s , int m){
    int temp , j ;
    temp = a[s];
    for (j = 2 * s; j <= m; j*=2) {
        if (j < m && a[j] < a[j+1]) {
            ++j;
        }
        if (temp >= a[j]) {
            break;
        }
        a[s] = a[j];
        s=j;
    }
    a[s] = temp;
}
void HeapSort(){
    int a[10] = {0,3,6,7,23,56,2,89,54,10};
    int i;
    // 此时的取值为长度的一半
    for (i = 4; i > 0; i --) {
        HeapAdjust(a , i , 9);
    }
    for (i=9; i > 1; i --) {
        swap(a, 1, i);
        HeapAdjust(a, 1, i - 1);
    }
    for (int l = 0; l < 10; l ++) {
        NSLog(@"堆排序---%d",a[l]);
    }
}

// 炸弹人游戏 利用二维数组存贮地图


void bomberman(){
    char a[5][5] = {"#####","#.g.#","#gg.#","#.g.#","#####"};
    for(int i = 0 ; i < 5;i ++){
        for (int j = 0; j< 5; j++) {
            if (a[i][j] != '#' && a[i][j] != 'g') {
                printf("%d...%d\n",i,j);
            }
        }
    }
}
//  标记插入的数字   标记那些数字已经使用了   多少位数字
int dfsA[10] ,       dfsBooks[10] ,      dfsN;
void dfs(int step){
    int i;
    if(step == dfsN+1){
        for(i=1;i<=dfsN;i++){
            printf("%d",dfsA[i]);
        }
        printf("\n");
        return;
    }
    for (i = 1; i <=dfsN; i++) {
        if(dfsBooks[i] == 0){
            dfsA[step] = i;
            dfsBooks[i] = 1;
            dfs(step + 1);
            dfsBooks[i] = 0;
        }
    }
    return;
}


// 翻转数字
int reverse(int x) {
    int rev = 0;
    while (x != 0){
        int pop = x %10;
        x /=10;
        if (rev > INT_MAX/10 || (rev == INT_MAX / 10 && pop > 7)) return 0;
        if (rev < INT_MIN/10 || (rev == INT_MIN / 10 && pop < -8)) return 0;
        rev = rev * 10 + pop;
    }
    return rev;
}
char* longestCommonPrefix(char** strs, int strsSize) {
    
    char* str=strs[0];
    int i,j;
    if(strsSize==0)return "";
    
    for(i=1;i<strsSize;i++){
        j=0;
        while(str[j] && strs[i][j] && str[j]==strs[i][j])j++;
        str[j]='\0';
    }
    return str;
}

void pointer(int *p)
{
    int a = 11, c = 33;
    printf("\n\nEnter function");
    printf("\nthe p is point to  %p , p's addr is %X, *p is %d", p, &p, *p);
    p = &a;
    printf("\nthe p is point to  %p , p's addr is %X, *p is %d", p, &p, *p);
    p = &c;
    printf("\nthe p is point to  %p ,  p's addr is %X, *p is %d", p, &p, *p);
    
    printf("\nfunction return\n");
}
void Sort(int* nums , int numsSize){
    int i , j , min;
    for(i = 0; i < numsSize ; i ++){
        min = i;
        for (j = i + 1 ; j < numsSize ; j ++){
            if(nums[min] > nums[j]){
                min = j;
            }
        }
        if(i != min){
            int t = nums[i];
            nums[i] = nums[min];
            nums[min] = t;
        }
    }
}
void Sort2(int* nums , int numsSize){
    int i , j , temp;
    for (i = 1; i < numsSize; i ++) {
        if (nums[i] < nums[i - 1]) {
            temp = nums[i];
            for (j = i-1 ; j >=0 && (nums[j] > temp); j--) {
                nums[j+1] = nums[j];
            }
            nums[j+1] = temp;
        }
    }
}
int threeSumClosest(int* nums, int numsSize, int target) {
    Sort(nums , numsSize);
    int i  , left , right , sum;
    for(i = 0 ; i < numsSize; i++){
        if (nums[i] < 0) {
            left = i+1;
            right = numsSize -1;
            while (left < right) {
                sum = nums[i] + nums[left] + nums[right];
                if (sum == target) {
                    printf("%d----%d---%d\n",nums[i],nums[left],nums[right]);
                    break;
                }
                if (sum < target) {
                    left ++;
                }
                if (sum > target) {
                    right --;
                }
            }
        }
    }
    return -1;
}
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct Node* mergeTwoLists(struct Node* l1, struct Node* l2) {
    if(l1 == NULL && l2 == NULL)
        return NULL;
    if(l1 == NULL)
        return l2;
    if(l2 == NULL)
        return l1;
    LinkList temp = (LinkList)malloc(sizeof(Node));
    struct Node* head = temp;
    while (l1  && l2 ){
       LinkList p = (LinkList)malloc(sizeof(Node));
        if(l1->data > l2->data){
            p->data = l2->data;
            l2 = l2->next;
        }else{
            p->data = l1->data;
            l1 = l1->next;
        }
        temp->next = p;
        temp = p;
    }
    if(l1 !=NULL){
        temp->next = l1;
    }
    if(l2 !=NULL){
        temp->next = l2;
    }
    return head->next;
}
int removeDuplicates(int* nums, int numsSize) {
    if(numsSize == 0) return 0;
    int i = 0;
    for(int j = i; j<numsSize; j++){
        if(nums[j] != nums[i]){
            i++;
            nums[i] = nums[j];
        }
    }
    return i + 1;
}
bool isValidSudoku(char** board, int boardRowSize, int boardColSize) {
    int row[9][10] = {0}, colum[9][10] = {0};
    int books[9][10] = {0};
    int i , j;
    for(i = 0; i < boardRowSize; i++){
        for(j = 0; j < boardColSize;j++){
            char num = board[i][j];
            if(num != '.'){
                int n = num -'0';
                if(row[i][n] || colum[j][n]  || books[(i / 3 ) * 3 + j / 3][n]){
                    return false;
                }else{
                    row[i][n] = true ;
                    colum[j][n] = true ;
                    books[(i / 3 ) * 3 + j / 3][n] = true;
                }
            }
        }
    }
    return true;
}

int main(int argc, const char * argv[]) {
    
    
    
    char *board[] = {"53..7....","6..195...",".98....6.","8...6...3","4..8.3..1","7...2...6",".6....28.","...419..5","....8..79"};
    isValidSudoku(board, 9, 9);
    
    
    
//    bubbleSort();
//    quickSort();
    
//    int a[10] = {-4,3,1,7,-2,56,8,89,-5,10};
//    int x = threeSumClosest(a, 10, 0);
//
//    int b = 22;
//    int *p1 = &b;
//
//    printf("the b address %X\n", &b);
//    printf("the p is point to %p , p's addr is %X, *p is %d", p1, &p1, *p1);
//    pointer(p1);
//    printf("\nthe p is  point to %p , p's addr is %X, *p is %d\n", p1, &p1, *p1);
//
//    char *str[] = {"123","345","678"};
////    longestCommonPrefix(str, 3);
//
//
//    reverse(321);
//    scanf("%d",&dfsN);
//    dfs(1);
//
//    bomberman();
//    HeapSort();
//   int key = FibonnacciSearch(10 , 59);
//    printf("--@@@--%d\n",key);
////    LinkList L = (LinkList)malloc(sizeof(Node));
////    char *p = malloc(sizeof(char) * 10);
////    printf("%p\n",p);
////    printf("%p\n",&p[0]);
//    char **p = malloc(sizeof(char *) * 10);
//    for(int i = 0;i<10;i++){
//        p[i] = malloc(sizeof(char) *10);
//    }
//       printf("%p\n",p);
//
    LinkList L = NULL;
    LinkList L1 = NULL;
    LinkList L2 = NULL;
    int nums[4] = {2,3,5,6};
    int nums1[3] = {1};
    
    createList(&L1, 4 , nums);
    createList(&L2, 1 , nums1);
    LinkList l5 = swapPairs(L1);
   LinkList l4 = reverseList(L1);
   LinkList L3 = mergeTwoLists(L1->next, L2->next);
//    createList(&L, 5);
    insertList(L, 3, 99);
    deleteList(L, 2, 2);
    LinkList q = L;
    while (q && q->next) {
        q = q->next;
        NSLog(@"-@@-%d",q->data);
    }
//    selectSort();
    insertSort();

    return 0;
}



