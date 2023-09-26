#include <iostream>
using namespace std;

void bubbleSort1(int arr[], int len) {
    for (int i = 0; i < len - 1; i++) {
        for (int j = 0; j < len - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
                // swap
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

void bubbleSort2(int arr[], int len) {
    for (int i = 0; i < len - 1; i++) {
        for (int j = len - 1; j > i; j--) {
            if (arr[j] < arr[j - 1]) {
                // swap
                int temp = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
            }
        }
    }
}

void bubbleSort2Pro(int arr[], int len) {
    for (int i = 0; i < len - 1; i++) {
        bool flag = false;
        for (int j = len - 1; j > i; j--) {
            if (arr[j] < arr[j - 1]) {
                // swap
                flag = true;
                int temp = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
            }
        }
        if (!flag) {
            break;
        }
    }
}

// 快速排序的分区函数
int partition(int arr[], int low, int high) {
    int pivot = arr[low];
    while (low < high) {
        while (low < high && arr[high] >= pivot) { // 比较高位和枢纽
            high--;
        }
        // swap
        int temp = arr[low];
        arr[low] = arr[high];
        arr[high] = temp;
        while (low < high && arr[low] <= pivot) { // 比较低位和枢纽
            low++;
        }
        // swap
        temp = arr[low];
        arr[low] = arr[high];
        arr[high] = temp;
    }
    return low; // 最终low的位置就是分区点的位置
}

int partitionPro1(int arr[], int low, int high) {
    int middle = low + ((high - low) >>
                        1); // 不使用(low+high)/2是怕数据溢出且右移速度比除法快
    int pivot = arr[low];
    if (pivot > arr[high]) {
        arr[low] = arr[high];
        arr[high] = pivot;
    }
    if (arr[middle] > arr[high]) {
        int temp = arr[middle];
        arr[middle] = arr[high];
        arr[high] = temp;
    }
    if (arr[middle] > arr[low]) {
        int temp = arr[middle];
        arr[middle] = arr[low];
        arr[low] = temp;
    }
    pivot = arr[low];
    while (low < high) {
        while (low < high && arr[high] >= pivot) { // 比较高位和枢纽
            high--;
        }
        // swap
        int temp = arr[low];
        arr[low] = arr[high];
        arr[high] = temp;
        while (low < high && arr[low] <= pivot) { // 比较低位和枢纽
            low++;
        }
        // swap
        temp = arr[low];
        arr[low] = arr[high];
        arr[high] = temp;
    }
    return low; // 最终low的位置就是分区点的位置
}

int partitionPro2(int arr[], int low, int high) {
    int pivot = arr[low];
    while (low < high) {
        while (low < high && arr[high] >= pivot) { // 比较高位和枢纽
            high--;
        }
        // replace
        arr[low] = arr[high];
        while (low < high && arr[low] <= pivot) { // 比较低位和枢纽
            low++;
        }
        // replace
        arr[high] = arr[low];
    }
    arr[low] = pivot;
    return low; // 最终low的位置就是分区点的位置
}

void quickSort(int arr[], int low, int high) {
    if (low < high) { // 当低位小于高位时才需要排序，否则就是已经排序好的状态
        int pivot =
            partitionPro2(arr, low, high); // 将数组分好区并得到分区点位置
        quickSort(arr, low, pivot - 1); // 递归处理两个子分区
        quickSort(arr, pivot + 1, high);
    }
}

void quickSortPro(int arr[], int low, int high) {
    while (low < high) {
        int pivot = partition(arr, low, high);
        quickSort(arr, low, pivot - 1);
        low = pivot + 1;
    }
}

void insertSort(int arr[], int len) {
    int j;
    for (int i = 0; i < len;
         i++) { // 从第一个元素开始，可以假定其前面已经排好序
        int temp = arr[i];
        for (j = i; j > 0 && temp < arr[j - 1]; j--) {
            arr[j] = arr[j - 1]; // 倒着将其插入合适位置
        }
        arr[j] = temp;
    }
}

void shellSort(int arr[], int len) {
    int j;
    for (int gap = len / 2; gap > 0; gap /= 2) {
        for (int i = gap; i < len; i++) {
            int temp = arr[i];
            for (j = i; j >= gap && temp < arr[j - gap]; j -= gap) {
                arr[j] = arr[j - gap];
            }
            arr[j] = temp;
        }
    }
}

void chooseSort(int arr[], int len) {
    for (int i = 0; i < len - 1; i++) {
        for (int j = i + 1; j < len; j++) {
            if (arr[i] > arr[j]) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
}

int leftChild(int i) { return 2 * i + 1; }

void heapAdjust(int arr[], int i, int len) {
    int child, father;
    for (father = arr[i]; leftChild(i) < len; i = child) {
        child = leftChild(i);
        if (child != len - 1 && arr[child] < arr[child + 1]) {
            child++;
        }
        if (father < arr[child]) {
            arr[i] = arr[child];
        } else {
            break;
        }
    }
    arr[i] = father;
}

void heapSort(int arr[], int len) {
    for (int i = len / 2; i >= 0; i--) {
        heapAdjust(arr, i, len);
    }

    for (int i = len - 1; i > 0; i--) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        heapAdjust(arr, 0, i);
    }
}

int main() {
    int src[] = {9, 1, 5, 8, 3, 7, 4, 2, 6};
    heapSort(src, 9);
    for (int i = 0; i < 9; i++) {
        cout << src[i] << " ";
    }
    cout << endl;
    return 0;
}