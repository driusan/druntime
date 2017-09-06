/**
 * D header file for DragonFlyBSD.
 *
 * Based on the header from FreeBSD. 
 *
 * Authors: Martin Nowak
 */
module core.sys.dragonflybsd.sys.cdefs;

version (DragonFlyBSD):

public import core.sys.posix.config;

enum __POSIX_VISIBLE = 200112;
enum __XSI_VISIBLE = 700;
enum __BSD_VISIBLE = true;
enum __ISO_C_VISIBLE = 1999;
