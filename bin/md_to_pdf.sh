#!/bin/bash
# compile.sh - converts markdown notes to pdf via pandoc with tufte css & wkhtmltopdf
# stolen in whole from /r/diamondnbond via https://www.reddit.com/r/unixporn/comments/aoeugb/i3wm_x220_meh/

function bs(){
	pandoc src/bs.md --css .deps/tufte.css -o bs.html
	wkhtmltopdf bs.html bs_notes.pdf
	mv bs.html .html/
	mv bs_notes.pdf out/
}

function cs(){
	pandoc src/cs.md --css .deps/tufte.css -o cs.html
	wkhtmltopdf cs.html cs_notes.pdf
	mv cs.html .html/
	mv cs_notes.pdf out/
}

function eng(){
	pandoc src/eng.md --css .deps/tufte.css -o eng.html
	wkhtmltopdf eng.html eng_notes.pdf
	mv eng.html .html/
	mv eng_notes.pdf out/
}

# MAIN
cs
