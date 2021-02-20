#include <stdio.h>
#include <stdlib.h>
#include "shape.h"

struct Shape {
	struct ShapeVtbl *vptr;
	int x;
	int y;
};

struct ShapeVtbl{
	float (*area)(struct Shape *self);
	void (*draw)(struct Shape *self);
};

struct Shape * Shape_create(int x, int y)
{
	struct Shape *s = malloc(sizeof(struct Shape));
	struct ShapeVtbl *sv = malloc(sizeof(struct ShapeVtbl));

	printf("Shape_create start.\n");
	s->vptr = sv;
	s->vptr->area = &Shape_area;
	s->x = x;
	s->y = y;
	printf("Shape_create end.\n");
	return s;
}

void Shape_init(struct Shape *self, int x, int y)
{
	printf("Shape_init start.\n");
	self->x = x;
	self->y = y;
	printf("Shape_init end.\n");
}

void Shape_move(struct Shape *self, int dx, int dy)
{
	printf("Shape_move start.\n");
	self->x += dx;
	self->y += dy;
	printf("Shape_move end.\n");
}

float Shape_area(struct Shape *self)
{
	printf("Shape_area call *self->vptr->area(self).\n");
	return (*self->vptr->area)(self);
}

struct Rectangle {
	struct Shape base;
	int width;
	int height;
};

struct Rectangle * Rectangle_create(int x, int y, int width, int height)
{
	struct Rectangle *r = malloc(sizeof(struct Rectangle));
	struct ShapeVtbl *sv = malloc(sizeof(struct ShapeVtbl));

	printf("Rectangle_create start.\n");
	r->base.vptr = sv;
	r->base.vptr->area = &Rectangle_area;

	Shape_init((struct Shape *)r, x, y);
	r->width = width;
	r->height = height;
	printf("Rectangle_create end.\n");
	return r;
}

float Rectangle_area(struct Shape *self)
{
	printf("Rectangle_area start.\n");
	struct Rectangle *r = (struct Rectangle *)self;
	printf("Rectangle_area end.\n");
	return r->width * r->height;
}

struct Square {
	int side;
};

float Square_area(struct Shape *self)
{
	printf("Square_area start.\n");
	struct Square *r = (struct Square *)self;
	printf("Square_area end.\n");
	return r->side * r->side;
}
