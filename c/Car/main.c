#include <stdio.h>
#include "Car.h"
int main()
{
	Car_Factory* car_factory = new_car_factory();
	Base_Car* benzeCar = car_factory->create_new_car(CAR_BENZE);
	Base_Car* bmwCar = car_factory->create_new_car(CAR_BMW);
	Base_Car* audiCar = car_factory->create_new_car(CAR_AUDI);

	benzeCar->speaker(benzeCar);
	bmwCar->speaker(bmwCar);
	audiCar->speaker(audiCar);

	delete_Base_Car(benzeCar);
	benzeCar = NULL;
	delete_Base_Car(bmwCar);
	bmwCar = NULL;
	delete_Base_Car(audiCar);
	audiCar = NULL;
	delete_car_factory(car_factory);
	car_factory = NULL;
	return 0;
}
