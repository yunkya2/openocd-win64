# OpenOCD for Windows (MSYS2/MinGW) makefile and prebuilt binary

## How to make

- Install MSYS2 64bit (http://www.msys2.org)
- Open MSYS2 Terminal "Mingw-w64 64bit" shell.
- Clone this repository with "--recursive" option.
- Type `make prepare` to install required packages.
- Type `make` to create binary and tar.gz archive.

## Build configuration

- The binary contains the following features:
  - Original OpenOCD source code (http://sourceforge.net/p/openocd/code/)
  - RaspberryPi picoprobe patch (from https://github.com/raspberrypi/openocd)
  - Bugfix for picoprobe patch

- Build configuration summary

```
OpenOCD configuration summary
--------------------------------------------------
MPSSE mode of FTDI based devices        yes (auto)
Raspberry Pi Pico Probe                 yes (auto)
ST-Link Programmer                      yes (auto)
TI ICDI JTAG Programmer                 yes (auto)
Keil ULINK JTAG Programmer              yes (auto)
Altera USB-Blaster II Compatible        yes (auto)
Bitbang mode of FT232R based devices    yes (auto)
Versaloon-Link JTAG Programmer          yes (auto)
TI XDS110 Debug Probe                   yes (auto)
CMSIS-DAP v2 Compliant Debugger         yes (auto)
OSBDM (JTAG only) Programmer            yes (auto)
eStick/opendous JTAG Programmer         yes (auto)
Andes JTAG Programmer                   yes (auto)
USBProg JTAG Programmer                 no
Raisonance RLink JTAG Programmer        no
Olimex ARM-JTAG-EW Programmer           no
CMSIS-DAP Compliant Debugger            yes (auto)
Nu-Link Programmer                      yes (auto)
Cypress KitProg Programmer              yes (auto)
Altera USB-Blaster Compatible           yes (auto)
ASIX Presto Adapter                     yes (auto)
OpenJTAG Adapter                        yes (auto)
Linux GPIO bitbang through libgpiod     no
SEGGER J-Link Programmer                yes (auto)
Use Capstone disassembly framework      no
```
