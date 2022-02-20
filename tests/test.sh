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

### 02j: line break in BBL output

ptex -kanji=utf8 02jtest
pbibtex -kanji=utf8 02jtest
ptex -kanji=utf8 02jtest
ptex -kanji=utf8 02jtest
dvipdfmx 02jtest
diff 02jtest.bbl.base 02jtest.bbl || exit 1

uptex -kanji=utf8 02jtest
upbibtex -kanji=utf8 02jtest
uptex -kanji=utf8 02jtest
uptex -kanji=utf8 02jtest
dvipdfmx 02jtest
diff 02jtest.bbl.base 02jtest.bbl || exit 1

echo SUCCESS
