#!/bin/bash
tar -cvf qemu.tar ./qemu/
bzip2 --best qemu.tar
mkdir page
cd page
mv ../qemu.tar.bz2 ./
echo git init
git init
echo git config user.name "${USER}"
git config user.name "${USER}"
echo git config user.email "${GHP_MAIL}"
git config user.email "${GHP_MAIL}"

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

echo git add .
git add .
echo git commit -m "Deploy to GitHub Pages"
git commit -m "Deploy to GitHub Pages"
echo git push --force --quiet https://${GHP_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git master:gh-pages
git push --force --quiet https://${GHP_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git master:gh-pages
cd ..
