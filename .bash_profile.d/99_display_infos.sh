#
# Print out some environment variables :

echo "Quelques variables d'environnement :"
for e in HOSTNAME LANG LD_LIBRARY_PATH PATH DSQUERY SYBASE SYBASE_OCS; do
	echo "   $e = ${!e}"
done
