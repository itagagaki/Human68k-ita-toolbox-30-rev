# Makefile for ITA TOOLBOX #30 rev

AS	= HAS.X -i $(INCLUDE)
LK	= hlk.x -x
CV      = -CV.X -r
CP      = cp
RM      = -rm -f

INCLUDE = $(HOME)/fish/include

DESTDIR   = A:/usr/ita
BACKUPDIR = B:/rev/1.0
RELEASE_ARCHIVE = REV10
RELEASE_FILES = MANIFEST README ../NOTICE CHANGES rev.1 revr.1 rev.x revr

EXTLIB = $(HOME)/fish/lib/ita.l

###

PROGRAM = rev.x

###

.PHONY: all clean clobber install release backup

.TERMINAL: *.h *.s

%.r : %.x	; $(CV) $<
%.x : %.o	; $(LK) $< $(EXTLIB)
%.o : %.s	; $(AS) $<

###

all:: $(PROGRAM)

clean::

clobber:: clean
	$(RM) *.bak *.$$* *.o *.x

###

$(PROGRAM) : $(INCLUDE)/doscall.h $(INCLUDE)/chrcode.h $(EXTLIB)

include ../Makefile.sub

###

install::
	$(INSTALL) revr $(DESTDIR)
