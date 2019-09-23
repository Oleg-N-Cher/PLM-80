#include "link.h"

static byte hexdigits[] = "0123456789ABCDEF";

void BinAsc(word number, byte base, byte pad, pointer bufP, byte ndigits)
{
	byte i;

	for (i = 1; i <= ndigits; i++) {
		bufP[ndigits - i] = hexdigits[number % base];
		number = number / base;
	}

	i = 0;
	while (bufP[i] == '0' && i < ndigits - 1) {
		bufP[i] = pad;
		i = i + 1;
	}
} /* BinAsc */

