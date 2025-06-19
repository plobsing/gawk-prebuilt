#!/usr/bin/env bash
#
# Install a build output to a caller-controlled location.
#
# The first two arguments - Bazel output tree location and name -
# are expected to be filled in by the build system; the third argument
# is expected to be caller-supplied (can be `/usr/local/bin` or some relative location).
#
# The argument sets can be combined using rules_multirun's semantics of suffixing the invocation
# arguments to the build-system supplied arguments.

src="$1"
name="$2"
dest="$3"

cd "$BUILD_WORKING_DIRECTORY"
install "$src" "$dest/$name"
