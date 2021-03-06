# boilerplates
#
TITLE="CLCA Live Root CD"
BUILD_TIMESTAMP=`date +"%F %T%z"`
GIT_COMMIT=`git rev-list --max-count=1 HEAD`
GIT_DESCRIPTION=`git describe --tags`

# show clca version in /etc/clca_version
mkdir -p $TARGETROOT/etc

cat <<EOF >$TARGETROOT/etc/clca_version
$TITLE

Build date: $BUILD_TIMESTAMP
Git description: $GIT_DESCRIPTION
Git commit: $GIT_COMMIT
EOF

cat <<EOF >$TARGETROOT/etc/bash.bashrc
if [ -n "\$PS1" ] ; then
    cat /etc/clca_version
fi
EOF

# customize boot screen
mkdir -p config/includes/binary/isolinux

cat <<EOF >config/includes/binary/isolinux/isolinux.cfg
include menu.cfg
default vesamenu.c32
prompt 0
timeout 80
EOF

