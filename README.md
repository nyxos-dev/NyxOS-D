<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0a0a0a,50:1a1a1a,100:2d2d2d&height=140&section=header&text=NyxOS-D&fontSize=44&fontColor=825AD2&animation=fadeIn&fontAlignY=55" />
</div>

<p align="center"><strong>NyxOS, rebuilt from scratch in D — a freestanding Multiboot kernel that boots on bare metal</strong></p>

<p align="center">
  <img src="https://img.shields.io/badge/language-D-825AD2?style=flat" />
  &nbsp;
  <img src="https://img.shields.io/badge/arch-x86-825AD2?style=flat" />
  &nbsp;
  <img src="https://img.shields.io/badge/boots-yes-2ea44f?style=flat" />
  &nbsp;
  <a href="https://github.com/nyxos-dev/nyx-os"><img src="https://img.shields.io/badge/family-NyxOS-800080?style=flat" /></a>
</p>

---

## About

Part of the **[NyxOS](https://github.com/nyxos-dev/nyx-os) family** — the same OS, rebuilt from zero in a different language each time. This is the **D** cut, built in D's `-betterC` mode: no garbage collector, no `TypeInfo`, no D runtime. A small Multiboot assembly stub calls `kmain()`, and D writes its banner straight to VGA text memory.

<div align="center">
  <img src="screenshot.png" alt="NyxOS-D booting in QEMU" width="640" />
  <p><em>NyxOS-D booting in QEMU — D's -betterC mode writing to the VGA text buffer</em></p>
</div>

**Why D:** `-betterC` gives you D's expressiveness with no runtime or GC — ideal for a kernel. Proven in the wild by PowerNex.

## Build & run

Needs `ldc2`, `nasm`, `ld`, and `qemu`. (SIMD is disabled via `-mattr=-sse,-sse2,-mmx` — a bare kernel has no SSE enabled, so LLVM must not auto-vectorize.)

```bash
make        # -> nyxos-d.elf  (verified Multiboot with grub-file)
make run    # boot it in QEMU
```

## Layout

- `boot.asm` — Multiboot header + entry stub that calls `kmain`
- `kernel.d` — the freestanding D kernel (VGA console)
- `linker.ld` — links the kernel at 1 MiB, Multiboot header first
- `Makefile` — build and boot

## Status

Early — it boots and paints the screen. Next up: a GDT, interrupts, and a VGA console `struct`.
