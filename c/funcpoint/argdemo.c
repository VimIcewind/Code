/* 例二：函数指针作为参数 */
#include <stdio.h>

struct object {
	int data;
};

int object_compare(struct object *a, struct object *z)
{
	return a->data < z->data ? 1 : 0;
}

struct object *maximum(struct object *begin, struct object *end, int (*compare) (struct object *, struct object *))
{
	struct object *result = begin;
	while (begin != end) {
		if (compare(result, begin)) {
			result = begin;
		}
		++begin;
	}
	return result;
}

int main(void)
{
	struct object data[8] = { {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7} };
	struct object *max;
	max = maximum(data + 0, data + 8, &object_compare);
	printf("max : %p\n", max);
	printf("max->data : %d", max->data);
	return 0;
}
