#include "Car.h"

static void Car_speaker(struct Base_Car* car)
{
    printf("this is a car\n");
}

static void Benze_speaker(struct Base_Car* car)
{
    printf("this is Benze Car, car type is :%d\n",car->car_type);
}

static void BMW_speaker(struct Base_Car* car)
{
    printf("this is BMW Car, car type is :%d\n",car->car_type);
}

static void Audi_speaker(struct Base_Car* car)
{
    printf("this is Audi Car, car type is :%d\n",car->car_type);
}

Benze_Car* new_benze_Car()
{
    Benze_Car* real_car = (Benze_Car*)malloc(sizeof(Benze_Car));
    Base_Car* base_car = new_Base_Car();
    printf("Benze_Car create\n");
    real_car->car = base_car;
    real_car->speaker = Benze_speaker;
    base_car->car_type = CAR_BENZE;
    base_car->parent_car = (void*)real_car;
    base_car->speaker = real_car->speaker;
    return real_car;
}

BMW_Car* new_bmw_Car()
{
    BMW_Car* real_car = (BMW_Car*)malloc(sizeof(BMW_Car));
    Base_Car* base_car = new_Base_Car();
    printf("BMW_Car create\n");
    base_car->car_type = CAR_BMW;
    real_car->car = base_car;
    real_car->speaker = BMW_speaker;
    base_car->car_type = CAR_BMW;
    base_car->parent_car = (void*)real_car;
    base_car->speaker = real_car->speaker;
    return real_car;
}

Audi_Car* new_audi_Car()
{
    Audi_Car* real_car = (Audi_Car*)malloc(sizeof(Audi_Car));
    Base_Car* base_car = new_Base_Car();
    printf("Audi_Car create\n");
    base_car->car_type = CAR_AUDI;
    real_car->car = base_car;
    real_car->speaker = Audi_speaker;
    base_car->car_type = CAR_AUDI;
    base_car->parent_car = (void*)real_car;
    base_car->speaker = real_car->speaker;
    return real_car;
}

Base_Car* new_Base_Car()
{
    Base_Car* base_car = (Base_Car*)malloc(sizeof(Base_Car));
    printf("BaseCar create\n");
    base_car->car_type = CAR_NONE;
    base_car->parent_car = NULL;
    base_car->speaker = Car_speaker;
    return base_car;
}

Base_Car* create_new_Car(CarType car_type)
{
    Base_Car* base_car = NULL;
    switch(car_type)
    {
        case CAR_BENZE:
        {
            Benze_Car* real_car = new_benze_Car();
            base_car = real_car->car;
            break;
        }
        case CAR_BMW:
        {
            BMW_Car* real_car = new_bmw_Car();
            base_car = real_car->car;
            break;
        }
        case CAR_AUDI:
        {
            Audi_Car* real_car = new_audi_Car();
            base_car = real_car->car;
            break;
        }
        default:
            break;
    }
    return base_car;
}

void delete_Benze_Car(struct Benze_Car* car)
{
    free(car->car);
    car->car = NULL;
    free(car);
    printf("Benze_Car delete\n");
}

void delete_BMW_Car(struct BMW_Car* car)
{
    free(car->car);
    car->car = NULL;
    free(car);
    printf("BMW_Car delete\n");
}

void delete_Audi_Car(struct Audi_Car* car)
{
    free(car->car);
    car->car = NULL;
    free(car);
    printf("Audi_Car delete\n");
}

void delete_Base_Car(struct Base_Car* car)
{
    if(NULL != car->parent_car)
    {
        switch(car->car_type)
        {
            case CAR_BENZE:
            {
                delete_Benze_Car((Benze_Car*)car->parent_car);
                car = NULL; //base car will be delete in child free function
                break;
            }
            case CAR_BMW:
            {
                delete_BMW_Car((BMW_Car*)car->parent_car);
                car = NULL;
                break;
            }
            case CAR_AUDI:
            {
                delete_Audi_Car((Audi_Car*)car->parent_car);
                car = NULL;
                break;
            }
            default:
                break;
        }
    }
    if(NULL != car)
    {
        free(car);
        car = NULL;
    }
    printf("Base_Car delete\n");
}

Car_Factory* new_car_factory()
{
    Car_Factory* car_factory = (Car_Factory*)malloc(sizeof(Car_Factory));
    car_factory->create_new_car = create_new_Car;
    return car_factory;
}

void delete_car_factory(Car_Factory* car_factory)
{
    free(car_factory);
    car_factory = NULL;
}
