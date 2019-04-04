void decode1(int *xp, int *yp, int *zp)
{
	int tmp;

	tmp = *xp;
	*xp = *zp;
	*zp = *yp;
	*yp = tmp;
}
