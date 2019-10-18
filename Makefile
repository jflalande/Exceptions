

fichier=poo

all:
	#cd codes && bash js2html.sh
	make presentation-$(fichier).html
	make cours-$(fichier).pdf
	make cours-$(fichier)-copyright.pdf
	make cours-$(fichier)-print.pdf
	make cours-$(fichier)-print-copyright.pdf

cours-%.pdf: head-CC %.rst
	ln -fs /home/jf/CoursCS/rst/logos-licences-break licence
	cat  $^ | sed  's/rst$$/rso/g' |grep -v '^\-\-\-\-$$' | rst2pdf -b 1 -s ~/CoursCS/rst/style.cours -o $@

cours-%-copyright.pdf: head-copyright %.rst
	ln -fs /home/jf/CoursCS/rst/logos-licences-break-copyright licence
	cat  $^ | sed  's/rst$$/rso/g' |grep -v '^\-\-\-\-$$' | rst2pdf -b 1 -s ~/CoursCS/rst/style.cours,bw -o $@

cours-%-print.pdf: head-CC %.rst
	ln -fs /home/jf/CoursCS/rst/logos-licences-break licence
	cat  $^ | sed  's/rst$$/rso/g' |grep -v '^\-\-\-\-$$' | rst2pdf --inline-links -b 1 -s ~/CoursCS/rst/style.cours,bw -o $@

cours-%-print-copyright.pdf: head-copyright %.rst
	ln -fs /home/jf/CoursCS/rst/logos-licences-break-copyright licence
	cat  $^ | sed  's/rst$$/rso/g' |grep -v '^\-\-\-\-$$' | rst2pdf --inline-links -b 1 -s ~/CoursCS/rst/style.cours,bw -o $@

presentation-%.html: %.rst
	ln -fs /home/jf/CoursCS/rst/logos-licences-break licence
	darkslide -c landslide-$*.cfg

