//main.cpp
#include <iostream>
#include <stdio.h>
#include "Car.h"
using namespace std;

int main() {
	CarFactory* carFactory = new CarFactory();
	BaseCar* newBenzeCar = carFactory->createNewCar(CAR_TYPE_BENZE);
	BaseCar* newBMWCar = carFactory->createNewCar(CAR_TYPE_BMW);
	BaseCar* newAudiCar = carFactory->createNewCar(CAR_TYPE_AUDI);

	newBenzeCar->CarSpeaker();
	newBMWCar->CarSpeaker();
	newAudiCar->CarSpeaker();

	delete newBenzeCar;
	newBenzeCar = NULL;
	delete newBMWCar;
	newBMWCar = NULL;
	delete newAudiCar;
	newAudiCar = NULL;
	delete carFactory;
	carFactory = NULL;
	return 0;
}

