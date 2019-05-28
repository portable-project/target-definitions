Here goes test listings for assembling and disassembling:
 - exact.asm for exact disassembling matching with other 3rd-party tool (objdump)
 - custom.asm for manual matching (when disasm mnemonic does not match with tool's convention)

And scripts for tests invocation, where scenario is
 - call raw assembling task for exact.asm with definition from the folder above and listing from here, retrieve binary say out1.bin
 - - call raw disassembling task with that out1.bin, retrieve result listing l1.out.asm
 - - call 3rd-party disassembling tool with that out1.bin, retrieve result listing l2.out.asm
 - - compare l1 with l2, should match
 - call raw assembling task for custom.asm with definition from the folder above and listing from here, retrieve binary say out2.bin
 - - call raw disassembling task with that out2.bin, retrieve result listing l3.out.asm

This file should not be included.
