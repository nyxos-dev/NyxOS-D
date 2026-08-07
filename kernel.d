// ============================================================
// NyxOS-D - a freestanding kernel in D's -betterC mode.
// ============================================================
// Entered from boot.asm (32-bit protected mode). -betterC means no D runtime,
// no GC, no TypeInfo - just D writing straight to VGA text memory. It returns
// to the assembly stub, which halts.
module kernel;

enum ushort PURPLE = 0x0D00;   // bright magenta on black, in the high byte
enum ushort BLANK  = 0x0F20;   // white space

extern(C) void kmain()
{
    auto vga = cast(ushort*) 0xB8000;

    for (int i = 0; i < 80 * 25; i++)
        vga[i] = BLANK;

    auto msg = "NyxOS-D  ::  booting from scratch in D (betterC)".ptr;
    for (int i = 0; msg[i]; i++)
        vga[i] = cast(ushort)(PURPLE | msg[i]);
}
