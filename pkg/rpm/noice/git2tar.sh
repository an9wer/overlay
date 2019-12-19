set -e
version=$(awk '{ if ( $1 == "Version:" ) { print $2 } }' SPECS/noice.spec)
rm -rf SOURCES/noice-"$version"
git clone git://git.2f30.org/noice SOURCES/noice-"$version"
cd SOURCES/noice-"$version"
git checkout "$version"
cd -
tar --exclude .git -zcvf SOURCES/noice-"$version".tar.gz SOURCES/noice-"$version"
