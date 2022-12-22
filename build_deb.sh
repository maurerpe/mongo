#!/bin/sh

scons -k mongod 2>&1 | tee build.log || die "Could not build mongod.  Check build.log for details"
mkdir -p mongodb-org-server/usr/bin
cp mongod mongodb-org-server/usr/bin/
strip mongodb-org-server/usr/bin/mongod
dpkg-deb --build mongodb-org-server || die "Could not make .deb file"
