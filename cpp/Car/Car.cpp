//Car.cpp
#include "Car.h"
#include <stdio.h>
#include <iostream>

using namespace std;

BaseCar::BaseCar(CarType_E CarType) : _CarType(CarType)
{
	printf("BaseCar create\n");
}

BaseCar::~BaseCar()
{
	printf("BaseCar delete\n");
}

void BaseCar::CarSpeaker()
{
	std::cout << "BeBu! BeBu" << endl;
}

BenzeCar::BenzeCar(CarType_E CarType) : BaseCar(CarType)
{
	printf("BenzeCar create\n");
}

BenzeCar::~BenzeCar()
{
	printf("BenzeCar delete\n");
}

void BenzeCar::CarSpeaker()
{
	printf("BeBu! BeBu! BenzeCar Car,Type:%d\n", _CarType);
}

BMWCar::BMWCar(CarType_E CarType) : BaseCar(CarType)
{
	printf("BMWCar create\n");
}

BMWCar::~BMWCar()
{
	printf("BMWCar delete\n");
}

void BMWCar::CarSpeaker()
{
	printf("BeBu! BeBu! BMWCar Car,Type:%d\n", _CarType);
}

AudiCar::AudiCar(CarType_E CarType) : BaseCar(CarType)
{
	printf("AudiCar create\n");
}

AudiCar::~AudiCar()
{
	printf("AudiCar delete\n");
}

void AudiCar::CarSpeaker()
{
	printf("BeBu! BeBu! AudiCar Car,Type:%d\n", _CarType);
}

BaseCar* CarFactory::createNewCar(CarType_E CarType)
{
	BaseCar* newCar = NULL;
	switch(CarType)
	{
		case CAR_TYPE_BENZE:
		{
			newCar = new BenzeCar(CAR_TYPE_BENZE);
			break;
		}
		case CAR_TYPE_BMW:
		{
			newCar = new BMWCar(CAR_TYPE_BMW);
			break;
		}
		case CAR_TYPE_AUDI:
		{
			newCar = new AudiCar(CAR_TYPE_AUDI);
			break;
		}
		default:
		{
			newCar = new BaseCar(CAR_TYPE_NONE);
			break;
		}
	}
	return newCar;
}

