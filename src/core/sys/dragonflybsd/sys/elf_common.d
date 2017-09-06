/**
 * D header file for FreeBSD.
 *
 * $(LINK2 http://svnweb.freebsd.org/base/head/sys/sys/elf_common.h?view=markup, sys/elf_common.h)
 */
module core.sys.dragonflybsd.sys.elf_common;

version (DragonFlyBSD):
extern (C):
pure:
nothrow:

import core.stdc.stdint;

struct Elf_Note
{
    uint32_t      n_namesz;
    uint32_t      n_descsz;
    uint32_t      n_type;
}

struct Elf_GNU_Hash_Header
{
    uint32_t      gh_nbuckets;
    uint32_t      gh_symndx;
    uint32_t      gh_maskwords;
    uint32_t      gh_shift2;
}

enum EI_MAG0 =         0;
enum EI_MAG1 =         1;
enum EI_MAG2 =         2;
enum EI_MAG3 =         3;
enum EI_CLASS =        4;
enum EI_DATA =         5;
enum EI_VERSION =      6;
enum EI_OSABI =        7;
enum EI_ABIVERSION =   8;
enum OLD_EI_BRAND =    8;
enum EI_PAD =          9;
enum EI_NIDENT =       16;

enum ELFMAG0 =         0x7f;
enum ELFMAG1 =         'E';
enum ELFMAG2 =         'L';
enum ELFMAG3 =         'F';
enum ELFMAG =          "\177ELF";
enum SELFMAG =         4;

enum EV_NONE =         0;
enum EV_CURRENT =      1;

enum ELFCLASSNONE =    0;
enum ELFCLASS32 =      1;
enum ELFCLASS64 =      2;

enum ELFDATANONE =     0;
enum ELFDATA2LSB =     1;
enum ELFDATA2MSB =     2;

enum ELFOSABI_NONE =           0;
enum ELFOSABI_SYSV =           0;
enum ELFOSABI_HPUX =           1;
enum ELFOSABI_NETBSD =         2;
enum ELFOSABI_LINUX =          3;
enum ELFOSABI_HURD  =          4;
enum ELFOSABI_86OPEN =         5;
enum ELFOSABI_SOLARIS =        6;
enum ELFOSABI_AIX =            7;
enum ELFOSABI_MONTEREY =       7;
enum ELFOSABI_IRIX =           8;
enum ELFOSABI_FREEBSD =        9;
enum ELFOSABI_TRU64 =          10;
enum ELFOSABI_MODESTO =        11;
enum ELFOSABI_OPENBSD =        12;
enum ELFOSABI_OPENVMS =        13;
enum ELFOSABI_NSK =            14;
enum ELFOSABI_AROS =           15;
enum ELFOSABI_FENIXOS =        16;
enum ELFOSABI_C6000_ELFABI =   64;
enum ELFOSABI_C6000_LINUX =    65;
enum ELFOSABI_ARM =            97;
enum ELFOSABI_STANDALONE =     255;

extern (D)
{
    auto IS_ELF(T)(T ehdr) { return ehdr.e_ident[EI_MAG0] == ELFMAG0 &&
                                    ehdr.e_ident[EI_MAG1] == ELFMAG1 &&
                                    ehdr.e_ident[EI_MAG2] == ELFMAG2 &&
                                    ehdr.e_ident[EI_MAG3] == ELFMAG3; }
}

enum ET_NONE =         0;
enum ET_REL =          1;
enum ET_EXEC =         2;
enum ET_DYN =          3;
enum ET_CORE =         4;
enum ET_LOOS =         0xfe00;
enum ET_HIOS =         0xfeff;
enum ET_LOPROC =       0xff00;
enum ET_HIPROC =       0xffff;

enum EM_NONE =          0;
enum EM_M32 =           1;
enum EM_SPARC =         2;
enum EM_386 =           3;
enum EM_68K =           4;
enum EM_88K =           5;
enum EM_860 =           7;
enum EM_MIPS =          8;
enum EM_S370 =          9;
enum EM_MIPS_RS3_LE =  10;
enum EM_PARISC =       15;
enum EM_VPP500 =       17;
enum EM_SPARC32PLUS =  18;
enum EM_960 =          19;
enum EM_PPC =          20;
enum EM_PPC64 =        21;
enum EM_S390 =         22;
enum EM_V800 =         36;
enum EM_FR20 =         37;
enum EM_RH32 =         38;
enum EM_RCE =          39;
enum EM_ARM =          40;
enum EM_SH =           42;
enum EM_SPARCV9 =      43;
enum EM_TRICORE =      44;
enum EM_ARC =          45;
enum EM_H8_300 =       46;
enum EM_H8_300H =      47;
enum EM_H8S =          48;
enum EM_H8_500 =       49;
enum EM_IA_64 =        50;
enum EM_MIPS_X =       51;
enum EM_COLDFIRE =     52;
enum EM_68HC12 =       53;
enum EM_MMA =          54;
enum EM_PCP =          55;
enum EM_NCPU =         56;
enum EM_NDR1 =         57;
enum EM_STARCORE =     58;
enum EM_ME16 =         59;
enum EM_ST100 =        60;
enum EM_TINYJ =        61;
enum EM_X86_64 =       62;
enum EM_AMD64 =        62;
enum EM_PDSP =         63;
enum EM_FX66 =         66;
enum EM_ST9PLUS =      67;
enum EM_ST7 =          68;
enum EM_68HC16 =       69;
enum EM_68HC11 =       70;
enum EM_68HC08 =       71;
enum EM_68HC05 =       72;
enum EM_SVX =          73;
enum EM_ST19 =         74;
enum EM_VAX =          75;
enum EM_CRIS =         76;
enum EM_JAVELIN =      77;
enum EM_FIREPATH =     78;
enum EM_ZSP =          79;
enum EM_MMIX =         80;
enum EM_HUANY =        81;
enum EM_PRISM =        82;
enum EM_AVR =          83;
enum EM_FR30 =         84;
enum EM_D10V =         85;
enum EM_D30V =         86;
enum EM_V850 =         87;
enum EM_M32R =         88;
enum EM_MN10300 =      89;
enum EM_MN10200 =      90;
enum EM_PJ =           91;
enum EM_OPENRISC =     92;
enum EM_ARC_A5 =       93;
enum EM_XTENSA =       94;
enum EM_VIDEOCORE =    95;
enum EM_TMM_GPP =      96;
enum EM_NS32K =        97;
enum EM_TPC =          98;
enum EM_SNP1K =        99;
enum EM_ST200 =       100;
enum EM_IP2K =        101;
enum EM_MAX =         102;
enum EM_CR =          103;
enum EM_F2MC16 =      104;
enum EM_MSP430 =      105;
enum EM_BLACKFIN =    106;
enum EM_SE_C33 =      107;
enum EM_SEP =         108;
enum EM_ARCA =        109;
enum EM_UNICORE =     110;

enum EM_486 =           6;
enum EM_MIPS_RS4_BE =  10;
enum EM_ALPHA_STD =    41;
enum EM_ALPHA =    0x9026;

enum SHN_UNDEF =       0;
enum SHN_LORESERVE =   0xff00;
enum SHN_LOPROC =      0xff00;
enum SHN_HIPROC =      0xff1f;
enum SHN_LOOS =        0xff20;
enum SHN_HIOS =        0xff3f;
enum SHN_ABS =         0xfff1;
enum SHN_COMMON =      0xfff2;
enum SHN_XINDEX =      0xffff;
enum SHN_HIRESERVE =   0xffff;

enum PT_NULL =         0;
enum PT_LOAD =         1;
enum PT_DYNAMIC =      2;
enum PT_INTERP =       3;
enum PT_NOTE =         4;
enum PT_SHLIB =        5;
enum PT_PHDR =         6;
enum PT_TLS =          7;
enum PT_LOOS =         0x60000000;
enum PT_LOPROC =       0x70000000;
enum PT_HIPROC =       0x7fffffff;

enum PT_GNU_EH_FRAME = (PT_LOOS + 0x474e550);
alias PT_SUNW_EH_FRAME  = PT_GNU_EH_FRAME;
enum PT_GNU_STACK =    (PT_LOOS + 0x474e550);
enum PT_GNU_RELRO =    (PT_LOOS + 0x474e552);

enum SHT_NULL =          0;
enum SHT_PROGBITS =      1;
enum SHT_SYMTAB =        2;
enum SHT_STRTAB =        3;
enum SHT_RELA =          4;
enum SHT_HASH =          5;
enum SHT_DYNAMIC =       6;
enum SHT_NOTE =          7;
enum SHT_NOBITS =        8;
enum SHT_REL =           9;
enum SHT_SHLIB =         10;
enum SHT_DYNSYM =        11;
enum SHT_INIT_ARRAY =    14;
enum SHT_FINI_ARRAY =    15;
enum SHT_PREINIT_ARRAY = 16;
enum SHT_GROUP =         17;
enum SHT_SYMTAB_SHNDX =  18;

enum SHT_LOOS =          0x60000000;
enum SHT_HIOS =          0x6fffffff;


enum SHT_SUNW_verdef =  0x6ffffffd; /* Versions defined by file */
enum SHT_SUNW_verneed = 0x6ffffffe; /* Versions needed by file */
enum SHT_SUNW_versym =  0x6fffffff; /* Symbol versions */

alias SHT_GNU_verdef =  SHT_SUNW_verdef;
alias SHT_GNU_verneed = SHT_SUNW_verneed;
alias SHT_GNU_versym =  SHT_SUNW_versym;

enum SHT_LOPROC	= 0x70000000; /* Processor-specific semantics, lo */
enum SHT_HIPROC	= 0x7FFFFFFF; /* Processor-specific semantics, hi */
enum SHT_LOUSER	= 0x80000000; /* Application-specific semantics */
enum SHT_HIUSER	= 0xFFFFFFFF; /* New value, defined in Oct 4, 1999 Draft */

// FIXME: AUDITED UP TO HERE
enum SHF_WRITE =            (1 << 0);
enum SHF_ALLOC =            (1 << 1);
enum SHF_EXECINSTR =        (1 << 2);
enum SHF_MERGE =            (1 << 4);
enum SHF_STRINGS =          (1 << 5);
enum SHF_INFO_LINK =        (1 << 6);
enum SHF_LINK_ORDER =       (1 << 7);
enum SHF_OS_NONCONFORMING = (1 << 8);
enum SHF_GROUP =            (1 << 9);
enum SHF_TLS =              (1 << 10);
enum SHF_MASKOS =           0x0ff00000;
enum SHF_MASKPROC =         0xf0000000;

enum PF_X =            (1 << 0);
enum PF_W =            (1 << 1);
enum PF_R =            (1 << 2);
enum PF_MASKOS =       0x0ff00000;
enum PF_MASKPROC =     0xf0000000;

enum PN_XNUM =         0xffff;

enum DT_NULL =         0;
enum DT_NEEDED =       1;
enum DT_PLTRELSZ =     2;
enum DT_PLTGOT =       3;
enum DT_HASH =         4;
enum DT_STRTAB =       5;
enum DT_SYMTAB =       6;
enum DT_RELA =         7;
enum DT_RELASZ =       8;
enum DT_RELAENT =      9;
enum DT_STRSZ =        10;
enum DT_SYMENT =       11;
enum DT_INIT =         12;
enum DT_FINI =         13;
enum DT_SONAME =       14;
enum DT_RPATH =        15;
enum DT_SYMBOLIC =     16;
enum DT_REL =          17;
enum DT_RELSZ =        18;
enum DT_RELENT =       19;
enum DT_PLTREL =       20;
enum DT_DEBUG =        21;
enum DT_TEXTREL =      22;
enum DT_JMPREL =       23;
enum DT_BIND_NOW =     24;
enum DT_INIT_ARRAY =   25;
enum DT_FINI_ARRAY =   26;
enum DT_INIT_ARRAYSZ = 27;
enum DT_FINI_ARRAYSZ = 28;
enum DT_RUNPATH =      29;
enum DT_FLAGS =        30;
enum DT_ENCODING =     32;
enum DT_PREINIT_ARRAY = 32;
enum DT_PREINIT_ARRAYSZ = 33;
enum DT_MAXPOSTAGS =   34;
enum DT_LOOS =         0x6000000d;
enum DT_SUNW_AUXILIARY = 0x6000000d;
enum DT_SUNW_RTLDINF = 0x6000000e;
enum DT_SUNW_FILTER =  0x6000000f;
enum DT_SUNW_CAP =     0x60000010;
enum DT_HIOS =         0x6ffff000;
enum DT_VALRNGLO =     0x6ffffd00;
enum DT_CHECKSUM =     0x6ffffdf8;
enum DT_PLTPADSZ =     0x6ffffdf9;
enum DT_MOVEENT =      0x6ffffdfa;
enum DT_MOVESZ =       0x6ffffdfb;
enum DT_FEATURE_1 =    0x6ffffdfc;
enum DT_POSFLAG_1 =    0x6ffffdfd;
enum DT_SYMINSZ =      0x6ffffdfe;
enum DT_SYMINENT =     0x6ffffdff;
enum DT_VALRNGHI =     0x6ffffdff;
enum DT_ADDRRNGLO =    0x6ffffe00;
enum DT_GNU_HASH =     0x6ffffef5;
enum DT_CONFIG =       0x6ffffefa;
enum DT_DEPAUDIT =     0x6ffffefb;
enum DT_AUDIT =        0x6ffffefc;
enum DT_PLTPAD =       0x6ffffefd;
enum DT_MOVETAB =      0x6ffffefe;
enum DT_SYMINFO =      0x6ffffeff;
enum DT_ADDRRNGHI =    0x6ffffeff;
enum DT_VERSYM =       0x6ffffff0;
enum DT_RELACOUNT =    0x6ffffff9;
enum DT_RELCOUNT =     0x6ffffffa;
enum DT_FLAGS_1 =      0x6ffffffb;
enum DT_VERDEF =       0x6ffffffc;
enum DT_VERDEFNUM =    0x6ffffffd;
enum DT_VERNEED =      0x6ffffffe;
enum DT_VERNEEDNUM =   0x6fffffff;
enum DT_LOPROC =       0x70000000;
enum DT_DEPRECATED_SPARC_REGISTER = 0x7000001;
enum DT_AUXILIARY =    0x7ffffffd;
enum DT_USED =         0x7ffffffe;
enum DT_FILTER =       0x7fffffff;
enum DT_HIPROC =       0x7fffffff;

enum DF_ORIGIN =       0x00000001;
enum DF_SYMBOLIC =     0x00000002;
enum DF_TEXTREL =      0x00000004;
enum DF_BIND_NOW =     0x00000008;
enum DF_STATIC_TLS =   0x00000010;

enum DF_1_BIND_NOW =   0x00000001;
enum DF_1_GLOBAL =     0x00000002;
enum DF_1_NODELETE =   0x00000008;
enum DF_1_LOADFLTR =   0x00000010;
enum DF_1_NOOPEN =     0x00000040;
enum DF_1_NODEFLIB =   0x00000800;

enum NT_PRSTATUS =     1;
enum NT_FPREGSET =     2;
enum NT_PRPSINFO =     3;
enum NT_THRMISC =      7;
enum NT_PROCSTAT_PROC = 8;
enum NT_PROCSTAT_FILES = 9;
enum NT_PROCSTAT_VMMAP = 10;
enum NT_PROCSTAT_GROUPS = 11;
enum NT_PROCSTAT_UMASK = 12;
enum NT_PROCSTAT_RLIMIT = 13;
enum NT_PROCSTAT_OSREL = 14;
enum NT_PROCSTAT_PSSTRINGS = 15;
enum NT_PROCSTAT_AUXV = 16;

enum STB_LOCAL =       0;
enum STB_GLOBAL =      1;
enum STB_WEAK =        2;
enum STB_NUM =         3;
enum STB_LOOS =        10;
enum STB_HIOS =        12;
enum STB_LOPROC =      13;
enum STB_HIPROC =      15;

enum STT_NOTYPE =      0;
enum STT_OBJECT =      1;
enum STT_FUNC =        2;
enum STT_SECTION =     3;
enum STT_FILE =        4;
enum STT_COMMON =      5;
enum STT_TLS =         6;
enum STT_NUM =         7;
enum STT_LOOS =        10;
enum STT_GNU_IFUNC =   10;
enum STT_HIOS =        12;
enum STT_LOPROC =      13;
enum STT_HIPROC =      15;

enum STV_DEFAULT =     0;
enum STV_INTERNAL =    1;
enum STV_HIDDEN =      2;
enum STV_PROTECTED =   3;
enum STV_EXPORTED =    4;
enum STV_SINGLETON =   5;
enum STV_ELIMINATE =   6;

enum STN_UNDEF =       0;

enum VER_DEF_CURRENT = 1;
alias VER_NDX VER_DEF_IDX;

enum VER_FLG_BASE =    0x1;
enum VER_FLG_WEAK =    0x2;

enum VER_NEED_CURRENT = 1;
enum VER_NEED_WEAK =    32768;
enum VER_NEED_HIDDEN = VER_NDX_HIDDEN;
alias VER_NDX VER_NEED_IDX;

enum VER_NDX_LOCAL =           0;
enum VER_NDX_GLOBAL =          1;
enum VER_NDX_GIVEN =           2;

enum VER_NDX_HIDDEN =      32768;
extern (D)
{
    auto VER_NDX(V)(V v) { return v & ~(1u << 15); }
}

enum SYMINFO_BT_SELF =         0xffff;
enum SYMINFO_BT_PARENT =       0xfffe;
enum SYMINFO_BT_LOWRESERVE =   0xff00;

enum SYMINFO_FLG_DIRECT =      0x0001;
enum SYMINFO_FLG_PASSTHRU =    0x0002;
enum SYMINFO_FLG_COPY =        0x0004;
enum SYMINFO_FLG_LAZYLOAD =    0x0008;

enum SYMINFO_NONE =            0;
enum SYMINFO_CURRENT =         1;
enum SYMINFO_NUM =             2;

enum GRP_COMDAT =              0x1;

