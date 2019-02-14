/*一个多重继承的例子，以电脑为例，电脑由硬盘，内存，cpu构成，以下的所有函数均直接写在类中*/
#include <iostream>
#include <string>
using namespace std;

/*定义Hdd类表示硬盘*/
class Hdd
{
private:
	int rpm;//转速
	int size;//容量
	int cache;//缓存
public:
	Hdd(int r, int s, int c)
	{
		rpm = r;
		size = s;
		cache = c;
	}
	~Hdd(){}
	void show_Hdd()
	{
		cout << "\nHdd" << endl;
		cout << "rpm = " << rpm << "rpm" << endl;
		cout << "size = " << size << "G" << endl;
		cout << "cache = " << cache << "MB" << endl;
	}
};

/*定义处理器类*/
class CPU
{
private:
	float C_frequency;//主频
	int L1;//一级缓存
	int L2;//二级缓存
	int L3;//三级缓存
public:
	CPU(float f, int l1, int l2, int l3)
	{
		C_frequency = f;
		L1 = l1;
		L2 = l2;
		L3 = l3;
	}
	~CPU(){}
	void show_CPU()
	{
		cout << "\nCPU" << endl;
		cout << "C-frequency = " << C_frequency << "GHz"<< endl;
		cout << "L1 = " << L1 << "MB"<< endl;
		cout << "L2 = " << L2 << "MB"<< endl;
		cout << "L3 = " << L3 << "MB"<< endl;
	}
};

/*定义内存类*/
class Memery
{
private:
	float M_frequency;//频率
	int MemerySize;//内存大小
	string DDR_Type;//接口类型
public:
	Memery(float mf, int ms, string Dt)
	{
		M_frequency = mf;
		MemerySize = ms;
		DDR_Type = Dt;
	}
	~Memery(){}
	void show_Memery()
	{
		cout << "\nMemery" << endl;
		cout << "M-frequency = " << M_frequency << "GHz" << endl;
		cout << "MemerySize = " << MemerySize << "GB" << endl;
		cout << "DDR_Type = " << DDR_Type << endl;
	}
};

/*定义电脑类，并多重继承Hdd，CPU，和Memery类*/
class Computer: public Hdd, public CPU, public Memery
{
private:
	string owner;//电脑所有人
	string tradmark;//商标
public:
	/*注意构造函数的形式*/
	Computer(string o, string tm, int hr, int hs, int hc, float cf, int cl1, int cl2, int cl3, float mf, int ms, string mdf):Hdd(hr, hs, hc), CPU(cf, cl1, cl2, cl3), Memery(mf, ms, mdf)
	{
		owner = o;
		tradmark = tm;
	}
	~Computer(){}
	void show_all()
	{
		cout << "owner = " << owner << endl;
		cout << "tradmark = " << tradmark << endl;
		show_CPU();
		show_Memery();
		show_Hdd();
	}
};

int main(int argc, char const *argv[])
{
	Computer desktop("BillGates", "Thinkpad", 7200, 500, 32, 2.6, 1, 2, 3, 1.3, 4, "DDR3");//将所有参数写入构造函数
	desktop.show_all();//显示所有信息
	return 0;
}
