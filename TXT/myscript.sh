#!/bin/bash
# Copyright (C) 2020-2021 Cicak Bin Kadal

# This free document is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied 
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# REV04 Sat 20 Nov 2021 19:10:06 WIB
# REV03 Mon 15 Nov 2021 11:22:19 WIB
# REV02 Sun 19 Sep 2021 15:44:11 WIB
# REV01 Sun 12 Sep 2021 03:10:00 WIB
# START Mon 28 Sep 2020 21:05:04 WIB

# ATTN:
# You new to set "REC2" with your own Public-Key Identity!
# Check it out with "gpg --list-key"

WEEK="10"
REC2="cbkadal@localhost"
REC1="operatingsystems@vlsm.org"
FILES="my*.asc my*.txt my*.sh"
SHA="SHA256SUM"

[ -d $HOME/RESULT/ ] || mkdir -p $HOME/RESULT/
pushd $HOME/RESULT/
for II in W?? ; do
    [ -d $II ] || continue
    TARFILE=my$II.tar.bz2
    TARFASC=$TARFILE.asc
    rm -vf $TARFILE $TARFASC
    echo "tar cfj $TARFILE $II/"
    tar cfj $TARFILE $II/
    echo "gpg --armor --output $TARFASC --encrypt --recipient $REC1 --recipient $REC2 $TARFILE"
    gpg --armor --output $TARFASC --encrypt --recipient $REC1 --recipient $REC2 $TARFILE
done
popd

II="$HOME/RESULT/myW$WEEK.tar.bz2.asc"
echo "Check and move $II..."
[ -f $II ] && mv -vf $II .

echo "rm -f $SHA $SHA.asc"
rm -f $SHA $SHA.asc

echo "sha256sum $FILES > $SHA"
sha256sum $FILES > $SHA

echo "sha256sum -c $SHA"
sha256sum -c $SHA

echo "gpg --output $SHA.asc --armor --sign --detach-sign $SHA"
gpg --output $SHA.asc --armor --sign --detach-sign $SHA

echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA

exit 0

