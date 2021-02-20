#include <stdio.h>
#include <stdlib.h>
#include "shape.h"

int main(int argc, const char *argv[])
{
	struct Shape *s = Shape_create(0, 0);

	Shape_move(s, 10, 10);

	struct Rectangle *r = Rectangle_create(5, 5, 20, 10);

	Shape_move((struct Shape*)r, 30, 40);

	Shape_area((struct Shape *)r);

	return 0;
}
