//Car.h
#ifndef CAR_H_
#define CAR_H_

typedef enum CarType_E
{
	CAR_TYPE_BENZE = 0,
	CAR_TYPE_BMW	  ,
	CAR_TYPE_AUDI	  ,
	CAR_TYPE_NONE	  ,
}CarType_E;

class BaseCar
{
public:
	BaseCar(CarType_E CarType);
	virtual ~BaseCar();

	virtual void CarSpeaker();
	CarType_E _CarType;
};

class BenzeCar : public BaseCar
{
public:
	BenzeCar(CarType_E CarType);
	~BenzeCar();
public:
	void CarSpeaker();
};

class BMWCar : public BaseCar
{
public:
	BMWCar(CarType_E CarType);
	~BMWCar();

	void CarSpeaker();
};

class AudiCar : public BaseCar
{
public:
	AudiCar(CarType_E CarType);
	~AudiCar();

	void CarSpeaker();
};

class CarFactory
{
public:
	BaseCar* createNewCar(CarType_E CarType);
};

#endif /* CAR_H_ */

