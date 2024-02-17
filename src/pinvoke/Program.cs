using System.Runtime.InteropServices;

#if WINDOWS_EMULATION
[DllImport("mathlib.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    static extern Int32 add(Int32 a, Int32 b);
#else
[DllImport("mathlib.so", CharSet = CharSet.Unicode, SetLastError = true)]
    static extern Int32 add(Int32 a, Int32 b);
#endif

Int32 val1 = 12;
Int32 val2 = 30;

var sum = add(val1, val2);
Console.WriteLine($"The answer to life, the universe and everything is {sum}");
