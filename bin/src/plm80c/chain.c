#include "plm.h"

void Chain(pointer fNam)
{
	file_t loadFile;
	word status, entry;

	Load(fNam, 0, debugFlag ? 2 : 1, &entry, &status);
	if (status != 0 )
	{
		InitF(&loadFile, "LOAD ", fNam);
		FatlIO(&loadFile, status);
	}
} /* Chain() */
