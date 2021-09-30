# Run tests

THYINC	= thy.gli
TSTS	   := $(patsubst %.cop,%.html,$(wildcard *.cop)) \
		$(patsubst %.cop,%.xhtml,$(wildcard *.cop))

%.html:	%.cop
	copland2xhtml -e $*.cop > $@

%.xhtml:	%.cop %.gln %_supps.gli $(THYINC)
	coplandchase $*.cop > $@

%.gl: %.cop %.gln
	copland2measchase -o $*.gli $*.cop
	m4 -P $*.gln > $@
	rm $*.gli

%.text: %.gl
	chase -c -o $@ $*.gl

%_tree.html: %.text
	chasetree -o $@ $*.text

all:	$(TSTS)

clean:
	-rm $(TSTS)
