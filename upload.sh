#!/bin/bash
cd /root/
tar -cf qemu.tar ./qemu/ && bzip2 --best qemu.tar
mkdir page && cd page
mv ../qemu.tar.bz2 ./

git init
git config user.name "${USER}"
git config user.email "${USER}@travis-ci.org"

echo "<HTML><HEAD><TITLE>LINKS</TITLE></HEAD><BODY><ul>" >index.html
for file in $(ls|grep -v index.html); do \
  (\
    printf '<li><a href="' ; \
    printf "${file}" ; \
    printf '">' ; \
    printf "${file}" ; \
    printf '</a></li>\n' \
  ) >>index.html ; \
done
echo "</ul></BODY></HTML>" >>index.html

git add .
git commit -m "Deploy to GitHub Pages"
git push --force --quiet https://${GHP_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git master:gh-pages
cd ..
