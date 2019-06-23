#!/bin/bash
# m2h.sh

self=`basename $0`

usage () {
	cat <<EOF
usage: $self <file>[.markdown]

Use pandoc to convert <file>.markdown to <file>.html

EOF
	exit 1
}

if ! which pandoc >& /dev/null
then
	echo "$self requires pandoc, but pandoc not found"
	exit 1
fi

if [ $# -eq 0 ]
then
	usage
fi

unset cssopts
for f in *.css
do
	cssopts="$cssopts --css=${f}"
done

for f in "${@}"
do
	base=${f%%.*}
	if [ -f "${base}.markdown" ]
	then
		infile="${base}.markdown"
	elif [ -f "${base}.md" ]
	then
		infile="${base}.md"
	else
		echo "$self: $f not found"
		continue
	fi
	outfile="${base}.html"
	if head -n1 "${infile}" | grep --quiet "^#"
	then
		pagetitle="`head -n1 "${infile}" | sed -e 's/^# //'`"
	else
		pagetitle="${base}"
	fi
	if [ -f ${infile} ]
	then
		pandoc	--standalone				\
			--metadata pagetitle="${pagetitle}"	\
			--from markdown				\
			--to html				\
			$cssopts				\
			--output="${outfile}" "${infile}"
	fi
done

# end: m2h.sh
