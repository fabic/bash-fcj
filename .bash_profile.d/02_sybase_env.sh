# F.2011-08-24 : Environnement Sybase.
#
# Cf /opt/sybase/SYBASE.sh pour référence.
#

export SYBASE=/opt/sybase
export SYBASE_OCS=OCS-15_0

# Note: Présent sur Electre, mais non défini dans SYBASE.sh ?!!
#export SYBPLATFORM=linux

# PATH
[ -d "$SYBASE/$SYBASE_OCS/bin" ] && pathprepend "$SYBASE/$SYBASE_OCS/bin"

# LD_LIBRARY_PATH & LIB
[ -d "$SYBASE/$SYBASE_OCS/lib" ] \
	&& pathprepend "$SYBASE/$SYBASE_OCS/lib" LD_LIBRARY_PATH \
	&& pathprepend "$SYBASE/$SYBASE_OCS/lib" LIB

# INCLUDE
[ -d "$SYBASE/$SYBASE_OCS/include" ] && pathprepend "$SYBASE/$SYBASE_OCS/include" INCLUDE
