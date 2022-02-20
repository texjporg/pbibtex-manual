% Sample BST for testing (u)pbibtex
% 日本語文字を含みます

ENTRY
  { author
    title
    year
  }
  {is.kanji.entry}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}
STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
	{
          add.period$ write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { add.period$ " " * write$ }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}
FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}
FUNCTION {fin.entry}
{
  add.period$
  write$
  newline$
}
FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { duplicate$ is.kanji.str$
	{ "{" swap$ * "} (is.kanji.str true)" * }
	{ "{\em " swap$ * "} (is.kanji.str false)" * }
      if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }
FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ff}{ll}" format.name$ is.kanji.str$
	{s nameptr "{ff}{ll}" format.name$ 't :=}
 	{s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't :=}
      if$
      nameptr #1 >
	{ namesleft #1 >
	    {", " * t * }
	    { t "others" =
 		{ s is.kanji.str$
 			{"ほか" * }
 			{", et~al." * }
 		  if$
 		}
 		{ s is.kanji.str$
 		    {", " * t * }
		    { numnames #2 =
 			{" and " * t * }
 			{", and " * t * }
		      if$
		    }
 		   if$
 		}
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.date}
{ year empty$
    { "" }
    { year }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {book}
{ output.bibitem
  format.authors output.nonnull
  new.block
  format.btitle "title" output.check
  new.block
  format.date "year" output.check
  fin.entry
}

FUNCTION {default.type} { book }

READ
FUNCTION {set.is.kanji.entry}
{
  author    field.or.null is.kanji.str$
  title     field.or.null is.kanji.str$ or
  'is.kanji.entry :=
}
ITERATE {set.is.kanji.entry}

SORT

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{9}" write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.state.consts}
ITERATE {call.type$}
FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}
