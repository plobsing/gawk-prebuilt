#!/usr/bin/env bash
#
# release_tag - print the name to use for tagging a release.
#
# The release tag format is vGAWK_VERSION+BUILD_HASH.
# GAWK_VERSION is Gawk's MAJOR.MINOR.PATCH version number.
# BUILD_HASH is the Git hash of the commit being tagged;
# inclusion of some build system version information enables us to
# make updates to the build process and then to release new builds
# of Gawk versions we have already made releases of previously.
#
set -euo pipefail

release_name() {
	echo -n 'v'
	bazel run '--ui_event_filters=-info,-stdout,-stderr' --noshow_progress @gawk -- --version | sed -n 1p | grep -Eo 'GNU Awk (\d+[.]\d+[.]\d+)' | cut -c9- | tr -d '\n'
	echo -n '+'
	git rev-parse HEAD | cut -c-8
}

release_name
