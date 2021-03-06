#!/bin/sh

### 01iskanji: is.kanji.str$

platex -kanji=utf8 01iskanji-p
pbibtex -kanji=utf8 01iskanji-p
platex -kanji=utf8 01iskanji-p
platex -kanji=utf8 01iskanji-p
dvipdfmx 01iskanji-p
diff 01iskanji-p.bbl.base 01iskanji-p.bbl || exit 1

uplatex -kanji=utf8 01iskanji-up
upbibtex -kanji=utf8 01iskanji-up
uplatex -kanji=utf8 01iskanji-up
uplatex -kanji=utf8 01iskanji-up
dvipdfmx 01iskanji-up
diff 01iskanji-up.bbl.base 01iskanji-up.bbl || exit 1

### 01substring: substring$

platex -kanji=utf8 01substring-p
pbibtex -kanji=utf8 01substring-p
platex -kanji=utf8 01substring-p
platex -kanji=utf8 01substring-p
dvipdfmx 01substring-p
diff 01substring-p.bbl.base 01substring-p.bbl || exit 1

uplatex -kanji=utf8 01substring-up
upbibtex -kanji=utf8 01substring-up
uplatex -kanji=utf8 01substring-up
uplatex -kanji=utf8 01substring-up
dvipdfmx 01substring-up
diff 01substring-up.bbl.base 01substring-up.bbl || exit 1

### 01textpre: text.prefix$

platex -kanji=utf8 01textpre-p
pbibtex -kanji=utf8 01textpre-p
platex -kanji=utf8 01textpre-p
platex -kanji=utf8 01textpre-p
dvipdfmx 01textpre-p
diff 01textpre-p.bbl.base 01textpre-p.bbl || exit 1

uplatex -kanji=utf8 01textpre-up
upbibtex -kanji=utf8 01textpre-up
uplatex -kanji=utf8 01textpre-up
uplatex -kanji=utf8 01textpre-up
dvipdfmx 01textpre-up
diff 01textpre-up.bbl.base 01textpre-up.bbl || exit 1

### 02jnewline: line break in BBL output

ptex -kanji=utf8 02jnewline
pbibtex -kanji=utf8 02jnewline
ptex -kanji=utf8 02jnewline
ptex -kanji=utf8 02jnewline
dvipdfmx 02jnewline
diff 02jnewline.bbl.base 02jnewline.bbl || exit 1

uptex -kanji=utf8 02jnewline
upbibtex -kanji=utf8 02jnewline
uptex -kanji=utf8 02jnewline
uptex -kanji=utf8 02jnewline
dvipdfmx 02jnewline
diff 02jnewline.bbl.base 02jnewline.bbl || exit 1

### 03substring: substring$

ptex -kanji=utf8 03substring-p
pbibtex -kanji=utf8 03substring-p
ptex -kanji=utf8 03substring-p
ptex -kanji=utf8 03substring-p
dvipdfmx 03substring-p
diff 03substring-p.bbl.base 03substring-p.bbl || exit 1

uptex -kanji=utf8 03substring-up
upbibtex -kanji=utf8 03substring-up
uptex -kanji=utf8 03substring-up
uptex -kanji=utf8 03substring-up
dvipdfmx 03substring-up
diff 03substring-up.bbl.base 03substring-up.bbl || exit 1

### 03jtest: real life example of substring$

ptex -kanji=utf8 03jtest
pbibtex -kanji=utf8 03jtest
ptex -kanji=utf8 03jtest
ptex -kanji=utf8 03jtest
dvipdfmx 03jtest
diff 03jtest-p.bbl.base 03jtest.bbl || exit 1

uptex -kanji=utf8 03jtest
upbibtex -kanji=utf8 03jtest
uptex -kanji=utf8 03jtest
uptex -kanji=utf8 03jtest
dvipdfmx 03jtest
diff 03jtest-up.bbl.base 03jtest.bbl || exit 1

### 04unibib: is.kanji.str$ (from uptexdir/)

lualatex 04unibib
upbibtex -kanji=utf8 04unibib
lualatex 04unibib
lualatex 04unibib
diff 04unibib.bbl.base 04unibib.bbl || exit 1

echo SUCCESS
