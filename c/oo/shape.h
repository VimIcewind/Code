struct Shape;

struct ShapeVtbl;

struct Shape * Shape_create(int x, int y);

void Shape_init(struct Shape *self, int x, int y);

void Shape_move(struct Shape *self, int dx, int dy);

float Shape_area(struct Shape *self);

struct Rectangle;

struct Rectangle * Rectangle_create(int x, int y, int width, int height);

float Rectangle_area(struct Shape *self);

struct Square;

float Square_area(struct Shape *self);
