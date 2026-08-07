# NyxOS-D

NyxOS, rebuilt from scratch in D — a freestanding x86_64 operating system.
Part of the NyxOS family: the same OS, built again in a different language.

The original (C): https://github.com/kazah-png/nyx-os

**Why D:** `-betterC` mode: no garbage collector, no runtime.
Proven in the wild: PowerNex.

**Layout:** `boot/` — entry + bootstrap · `kernel/` — the kernel proper.

**Status:** early — bringing up the toolchain and a minimal higher-half kernel.
