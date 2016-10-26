#堆排序
def Heapify(mylist, start, end):
    left = 0
    right = 0
    maxv = 0
    left = start * 2
    right = start * 2 + 1
    while left <= end:
        maxv = left
        if right <= end:
            if mylist[left] < mylist[right]:
                maxv = right
            else:
                maxv = left
        if mylist[start] < mylist[maxv]:
            tmp = mylist[maxv]
            mylist[maxv] = mylist[start]
            mylist[start] = tmp
            start = maxv
        else:
            break
        left = start * 2
        right = start * 2 + 1

def BuildHeap(mylist):
    size = len(mylist)
    i = (size -1) // 2;
    while i >= 0:
        Heapify(mylist, i, size - 1)
        i = i - 1

def HeapSort(mylist):
    BuildHeap(mylist)
    i = len(mylist) - 1

    while i >= 0:
        tmp = mylist[0]
        mylist[0] = mylist[i]
        mylist[i] = tmp

        Heapify(mylist, 0, i - 1)
        i = i - 1

mylist0 = [11, 23, 1, 24, 112, 200, 9, 32]
HeapSort(mylist0)
print(mylist0)
