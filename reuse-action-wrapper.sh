#!/usr/bin/env sh

# SPDX-FileCopyrightText: 2022 Free Software Foundation Europe e.V. <https://fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Set workspace directory as safe Git directory
# See https://github.blog/2022-04-12-git-security-vulnerability-announced/
git config --global --add safe.directory "$GITHUB_WORKSPACE"

# Enter directory
cd "$GITHUB_WORKSPACE" || exit 1

# Run REUSE
reuse "$@"
