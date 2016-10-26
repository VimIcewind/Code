#include <stdio.h>
#include <ctype.h>
#include "atmi.h"

void TOUPPER(TPSVCINFO *rqst)
{
	int i;
	for (i = 0; i < rqst->len - 1; i++)
		rqst->data[i] = toupper(rqst->data[i]);
	tpreturn(TPSUCCESS, 0, rqst->data, 0L, 0);
}

