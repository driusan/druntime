/**
 * D header file for FreeBSD.
 *
 * Copyright: Copyright Martin Nowak 2012.
 * License:   $(WEB www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Martin Nowak
 */

/*          Copyright Martin Nowak 2012.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module core.sys.dragonflybsd.sys.event;

version (DragonFlyBSD):
extern (C):
nothrow:
@nogc:

import core.stdc.stdint;    // intptr_t, uintptr_t
import core.sys.posix.time; // timespec

enum
{
    EVFILT_READ     =  -1,
    EVFILT_WRITE    =  -2,
    EVFILT_AIO      =  -3, /* attached to aio requests */
    EVFILT_VNODE    =  -4, /* attached to vnodes */
    EVFILT_PROC     =  -5, /* attached to struct proc */
    EVFILT_SIGNAL   =  -6, /* attached to struct proc */
    EVFILT_TIMER    =  -7, /* timers */
    EVFILT_EXCEPT   =  -8, /* exceptional conditions */
    EVFILT_USER     =  -9, /* user events */
    EVFILT_FS       =  -10, /* filesystem events */

    EVFILT_MARKER   = 0xF /* placemarker for tailq */

    EVFILT_SYSCOUNT = 10
}

extern(D) void EV_SET(kevent_t* kevp, typeof(kevent_t.tupleof) args)
{
    *kevp = kevent_t(args);
}

struct kevent_t
{
    uintptr_t    ident; /* identifier for this event */
    short       filter; /* filter for event */
    ushort       flags;
    uint        fflags;
    intptr_t      data;
    void        *udata; /* opaque user data identifier */
}

enum
{
    /* actions */
    EV_ADD          = 0x0001, /* add event to kq (implies enable) */
    EV_DELETE       = 0x0002, /* delete event from kq */
    EV_ENABLE       = 0x0004, /* enable event */
    EV_DISABLE      = 0x0008, /* disable event (not reported) */

    /* flags */
    EV_ONESHOT      = 0x0010, /* only report one occurrence */
    EV_CLEAR        = 0x0020, /* clear event state after reporting */
    EV_RECEIPT      = 0x0040, /* force EV_ERROR on success, data=0 */
    EV_DISPATCH     = 0x0080, /* disable event after reporting */

    EV_SYSFLAGS     = 0xF000, /* reserved by system */
    EV_FLAG1        = 0x2000, /* filter-specific flag */

    /* returned values */
    EV_EOF          = 0x8000, /* EOF detected */
    EV_ERROR        = 0x4000, /* error, data contains errno */
    EV_NODATA       = 0x1000, /* EOF and no more data */
}

enum
{
    /*
     * data/hint flags/masks for EVFILT_USER, shared with userspace
     *
     * On input, the top two bits of fflags specifies how the lower twenty four
     * bits should be applied to the stored value of fflags.
     *
     * On output, the top two bits will always be set to NOTE_FFNOP and the
     * remaining twenty four bits will contain the stored fflags value.
     */
    NOTE_FFNOP      = 0x00000000, /* ignore input fflags */
    NOTE_FFAND      = 0x40000000, /* AND fflags */
    NOTE_FFOR       = 0x80000000, /* OR fflags */
    NOTE_FFCOPY     = 0xc0000000, /* copy fflags */
    NOTE_FFCTRLMASK = 0xc0000000, /* masks for operations */
    NOTE_FFLAGSMASK = 0x00ffffff,

    NOTE_TRIGGER    = 0x01000000, /* Cause the event to be
                                  triggered for output. */

    /*
     * data/hint flags for EVFILT_{READ|WRITE}, shared with userspace
     */
    NOTE_LOWAT      = 0x0001, /* low water mark */

    /**
     * data/hint flags for EVFILT_EXCEPT, shared with userspace and with
     * EVFILT_{READ/WRITE}
     */

    NOTE_OOB        = 0x0002, /* OOB data on a socket */

    /*
     * data/hint flags for EVFILT_VNODE, shared with userspace
     */
    NOTE_DELETE     = 0x0001, /* vnode was removed */
    NOTE_WRITE      = 0x0002, /* data contents changed */
    NOTE_EXTEND     = 0x0004, /* size increased */
    NOTE_ATTRIB     = 0x0008, /* attributes changed */
    NOTE_LINK       = 0x0010, /* link count changed */
    NOTE_RENAME     = 0x0020, /* vnode was renamed */
    NOTE_REVOKE     = 0x0040, /* vnode access was revoked */

    /*
     * data/hint flags for EVFILT_PROC and EVFILT_PROCDESC, shared with userspace
     */
    NOTE_EXIT       = 0x80000000, /* process exited */
    NOTE_FORK       = 0x40000000, /* process forked */
    NOTE_EXEC       = 0x20000000, /* process exec'd */
    NOTE_PCTRLMASK  = 0xf0000000, /* mask for hint bits */
    NOTE_PDATAMASK  = 0x000fffff, /* mask for pid */

    /* additional flags for EVFILT_PROC */
    NOTE_TRACK      = 0x00000001, /* follow across forks */
    NOTE_TRACKERR   = 0x00000002, /* could not track child */
    NOTE_CHILD      = 0x00000004, /* am a child process */

    /*
     * Flag indicating hint is a signal. Used by EVFILT_SIGNAL and also
     * shared by EVFILT_PROC (all knotes attached to p->p_klist)
     *
     * NOTE_OLDAPI is used to signal that standard filters are being called
     * from the select/poll wrapper.
     */
    NOTE_SIGNAL = 0x08000000,
    NOTE_OLDAPI = 0x04000000, /* select/poll note */


    FILTEROP_ISFD = 0x0001 /* if ident == filedescriptor */
    FILTEROP_MPSAFE = 0x0002,
}

int kqueue();
int kevent(int kq, const kevent_t *changelist, int nchanges,
           kevent_t *eventlist, int nevents,
           const timespec *timeout);
