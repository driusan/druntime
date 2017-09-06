/**
 * D header file for DragonFlyBSD.
 */
module core.sys.dragonflybsd.sys.elf32;

version (DragonFlyBSD):
extern (C):
pure:
nothrow:

import core.stdc.stdint;
public import core.sys.dragonflybsd.sys.elf_common;

alias Elf32_Addr = uint32_t;
alias Elf32_Half = uint16_t;
alias Elf32_Off = int32_t;
alias Elf32_Sword = int32_t;
alias Elf32_Word = uint32_t;
alias Elf32_Size = uint32_t;
alias Elf32_Hashelt = Elf32_Off;

struct Elf32_Ehdr
{
    char[EI_NIDENT] e_ident;
    Elf32_Half    e_type;
    Elf32_Half    e_machine;
    Elf32_Word    e_version;
    Elf32_Addr    e_entry;
    Elf32_Off     e_phoff;
    Elf32_Off     e_shoff;
    Elf32_Word    e_flags;
    Elf32_Half    e_ehsize;
    Elf32_Half    e_phentsize;
    Elf32_Half    e_phnum;
    Elf32_Half    e_shentsize;
    Elf32_Half    e_shnum;
    Elf32_Half    e_shstrndx;
}

struct Elf32_Shdr
{
    Elf32_Word    sh_name;
    Elf32_Word    sh_type;
    Elf32_Word    sh_flags;
    Elf32_Addr    sh_addr;
    Elf32_Off     sh_offset;
    Elf32_Size    sh_size;
    Elf32_Word    sh_link;
    Elf32_Word    sh_info;
    Elf32_Size    sh_addralign;
    Elf32_Size    sh_entsize;
}

struct Elf32_Phdr
{
    Elf32_Word    p_type;
    Elf32_Off     p_offset;
    Elf32_Addr    p_vaddr;
    Elf32_Addr    p_paddr;
    Elf32_Size    p_filesz;
    Elf32_Size    p_memsz;
    Elf32_Word    p_flags;
    Elf32_Size    p_align;
}

struct Elf32_Dyn
{
  Elf32_Sword   d_tag;
  union _d_un
  {
      Elf32_Size d_val;
      Elf32_Addr d_ptr;
  } _d_un d_un;
}

struct Elf32_Rel
{
    Elf32_Addr    r_offset;
    Elf32_Word    r_info;
}

struct Elf32_Rela
{
    Elf32_Addr    r_offset;
    Elf32_Word    r_info;
    Elf32_Sword   r_addend;
}

extern (D)
{
    auto ELF32_R_SYM(V)(V val) { return val >> 8; }
    auto ELF32_R_TYPE(V)(V val) { return val; }

    auto ELF32_R_INFO(S, T)(S sym, T type) { return (sym << 8) + (type); }
}

struct Elf32_Sym
{
    Elf32_Word    st_name;
    Elf32_Addr    st_value;
    Elf32_Size    st_size;
    ubyte st_info;
    ubyte st_other;
    Elf32_Half st_shndx;
}

extern (D)
{
    auto ELF32_ST_BIND(T)(T val) { return cast(ubyte)val >> 4; }
    auto ELF32_ST_TYPE(T)(T val) { return val & 0xf; }

    auto ELF32_ST_INFO(B, T)(B bind, T type) { return (bind << 4) + (type & 0xf); }

    auto ELF32_ST_VISIBILITY(O)(O o) { return o & 0x03; }
}

struct Elf32_Verdef
{
    Elf32_Half    vd_version;
    Elf32_Half    vd_flags;
    Elf32_Half    vd_ndx;
    Elf32_Half    vd_cnt;
    Elf32_Word    vd_hash;
    Elf32_Word    vd_aux;
    Elf32_Word    vd_next;
}

struct Elf32_Verdaux
{
    Elf32_Word    vda_name;
    Elf32_Word    vda_next;
}

struct Elf32_Verneed
{
    Elf32_Half    vn_version;
    Elf32_Half    vn_cnt;
    Elf32_Word    vn_file;
    Elf32_Word    vn_aux;
    Elf32_Word    vn_next;
}

struct Elf32_Vernaux
{
    Elf32_Word    vna_hash;
    Elf32_Half    vna_flags;
    Elf32_Half    vna_other;
    Elf32_Word    vna_name;
    Elf32_Word    vna_next;
}

alias Elf32_Versym = Elf32_Half;

struct Elf32_Syminfo
{
    Elf32_Half si_boundto;
    Elf32_Half si_flags;
}
