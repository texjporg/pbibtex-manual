#!/bin/sh

platex -kanji=utf8 01jtest-p
pbibtex -kanji=utf8 01jtest-p
platex -kanji=utf8 01jtest-p
platex -kanji=utf8 01jtest-p
dvipdfmx 01jtest-p
diff 01jtest-p.bbl.base 01jtest-p.bbl || exit 1

uplatex -kanji=utf8 01jtest-up
upbibtex -kanji=utf8 01jtest-up
uplatex -kanji=utf8 01jtest-up
uplatex -kanji=utf8 01jtest-up
dvipdfmx 01jtest-up
diff 01jtest-up.bbl.base 01jtest-up.bbl || exit 1

echo SUCCESS
