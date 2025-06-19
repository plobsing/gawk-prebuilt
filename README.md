This repository builds binary releases for gawk.

It is built using the Bazel module at https://registry.bazel.build/modules/gawk
using a musl toolchain from https://registry.bazel.build/modules/hermetic_cc_toolchain
so it is fully statically-linked and does not depend on any libc version at runtime.

To use this binary under Bazel, see https://registry.bazel.build/modules/awk.bzl .

## Attribution

The [`gawk` module](https://github.com/aspect-build) on the Bazel registry is maintained by
[UebelAndre](https://github.com/UebelAndre) and
[Sahin Yort](https://github.com/thesayyn).

This publish repo has been adapted from https://github.com/aspect-build/bsdtar-prebuilt originally
authored by [David Zbarsky](https://github.com/dzbarsky) and maintained by the good folks at
[Aspect](https://github.com/aspect-build).

GNU Awk is a project maintained by [Arnold Robbins](https://www.skeeve.com/) through
the [GNU Project](https://www.gnu.org/).

## Releasing

1. MODULE.bazel should point to the latest `gawk` on Bazel Central Registry.
   Renovate bot will send a PR.
2. Push a tag to the repo, will kick off automated build on GitHub Actions.
