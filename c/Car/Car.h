#ifndef CAR_H_
#define CAR_H_

#include <stdio.h>
#include <stdlib.h>

typedef enum CarType
{
	CAR_BENZE = 0,
	CAR_BMW,
	CAR_AUDI,
	CAR_NONE,
}CarType;

typedef struct Base_Car
{
	CarType car_type;
	void (* speaker)(struct Base_Car* car);

	void* parent_car; //point to parent,if no any parent,then make it NULL
}Base_Car;

typedef struct Benze_Car
{
	Base_Car* car;
	void (* speaker)(struct Base_Car* car);
}Benze_Car;

typedef struct BMW_Car
{
	Base_Car* car;
	void (* speaker)(struct Base_Car* car);
}BMW_Car;

typedef struct Audi_Car
{
	Base_Car* car;
	void (* speaker)(struct Base_Car* car);
}Audi_Car;

typedef struct Car_Factory
{
	Base_Car* (* create_new_car)(CarType car_type);
}Car_Factory;

Car_Factory* new_car_factory();
void delete_car_factory(Car_Factory* car_factory);

Base_Car* new_Base_Car();
Benze_Car* new_benze_Car();
BMW_Car* new_bmw_Car();
Audi_Car* new_audi_Car();

void delete_Base_Car(struct Base_Car* car);
void delete_Benze_Car(struct Benze_Car* car);
void delete_BMW_Car(struct BMW_Car* car);
void delete_Audi_Car(struct Audi_Car* car);

#endif /* CAR_H_ */

