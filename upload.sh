#!/bin/bash
# Poor Man's artifact dump. Tar up the build and upload to github pages.

GITHUB_URL="https://${GHP_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git"

cd /root/                || exit 1
tar -cf qemu.tar ./qemu/ || exit 1
bzip2 --best qemu.tar    || exit 1
mkdir page               || exit 1
cd page                  || exit 1
mv ../qemu.tar.bz2 ./    || exit 1

echo "<HTML><HEAD><TITLE>LINKS</TITLE></HEAD><BODY><ul>" >index.html
for file in $(ls | egrep -v "^index.html$| "); do \
    (\
        printf '<li><a href="'; \
        printf "${file}";       \
        printf '">';            \
        printf "${file}";       \
        printf '</a></li>\n'    \
    )>>index.html;              \
done
echo "</ul></BODY></HTML>" >>index.html

git init
git config user.name "${USER}"
git config user.email "${USER}@travis-ci.org"
git add .
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "${GITHUB_URL}" master:gh-pages
exit $?
