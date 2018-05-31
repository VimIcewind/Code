__declspec(thread) int t = 1;

int main(int argc, const char *argv[])
{
	t = 2;
	return 0;
}
