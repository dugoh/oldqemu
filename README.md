# oldqemu
A reproducible build of an old qemu version (0.11) on a modern linux system. Reference being the latest build environment on Travis, currently Ubuntu 14.04 LTS Server Edition 64 bit.

Travis build log at https://travis-ci.org/dugoh/oldqemu

Build artifact at https://dugoh.github.io/oldqemu/

The artifact is nothing more than a tarred up qemu source directory after the build. Fish out the binaries and bios you need or extract the tarball in /root and run `make install`.

I don't do branches and have no qualms using master as a scratch pad. Hic Sunt Leones, here be dragons, buyer beware and all that. Worst case build.sh just provides you hints.
