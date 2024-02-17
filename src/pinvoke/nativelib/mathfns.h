#ifndef __MATHFNS_H__
#define __MATHFNS_H__

#include <stdint.h>

#if defined(__GNUC__)
extern int32_t add(int32_t a, int32_t b);
#else
// presumably, we are compiling for windows to execute a test there
__declspec(dllexport) extern int32_t add(int32_t a, int32_t b);
#endif

#endif
