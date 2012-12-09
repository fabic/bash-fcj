# F.2010-08-16 : My custom way of dealing with /opt manually compiled stuff.


# Le prefixe où sont installés les programmes :
PREFIX=/opt
#PREFIX=/usr/local

# E.g. pour avoir /opt/bin :
[ -d "$PREFIX/bin" ] && pathprepend "$PREFIX/bin"

PHP_VERSION=-5.3.17

# Sous-dossiers de /opt à analyser à la recherche de bin/, lib/, man/, share/man/, share/info/
#SUBDIRS=( freetds tidy apache php git vim )
SUBDIRS=( mercurial html_tidy apache php$PHP_VERSION git vim )

# Itération sur les sous-dossiers :
for subdir in "${SUBDIRS[@]}"; do

	dir="$PREFIX/$subdir"

	if [ ! -e "$dir" ]; then
		#echo "$0 : Warning: \`$dir' non trouvé."
		continue
	fi

	# PATH
	[ -d "$dir/bin" ] && pathprepend "$dir/bin"

	# LD_LIBRARY_PATH
	# Désactivé, généralement pas une bonne idée,
	# cf http://xahlee.org/UnixResource_dir/_/ldpath.html
	#
	#[ -d "$dir/lib"   ] && pathprepend "$dir/lib" LD_LIBRARY_PATH
	#[ -d "$dir/lib64" ] && pathprepend "$dir/lib64" LD_LIBRARY_PATH
	#
	# ¿ Positionner LD_RUN_PATH ?

	# INCLUDE
	[ -d "$dir/include" ] && pathprepend "$dir/include" INCLUDE

	# MANPATH
	#[ -d "$dir/share/man" ] && pathprepend "$dir/share/man" MANPATH
	#[ -d "$dir/man"       ] && pathprepend "$dir/man" MANPATH

	# INFOPATH
	[ -d "$dir/share/info" ] && pathprepend "$dir/share/info" MANPATH
done

