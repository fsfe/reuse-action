#!/usr/bin/env sh

# SPDX-FileCopyrightText: 2022 Free Software Foundation Europe e.V. <https://fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Set workspace directory as safe Git directory
# See https://github.blog/2022-04-12-git-security-vulnerability-announced/
git config --global --add safe.directory "$GITHUB_WORKSPACE"

# Enter directory
cd "$GITHUB_WORKSPACE" || exit 1

echo "Summary type (should be json, markdown, or none): $INPUT_SUMMARY"

if ! [ "$INPUT_SUMMARY" = "none" ]; then
    # Add header to step summary
    echo "# REUSE Compliance Status" >>"$GITHUB_STEP_SUMMARY"
fi

if [ "$INPUT_SUMMARY" = "json" ]; then
    # Add code block header to step summary
    printf '\n```json\n' >>"$GITHUB_STEP_SUMMARY"
fi

# Run REUSE
reuse "$@" | (if ! [ "$INPUT_SUMMARY" = "none" ]; then tee -a "$GITHUB_STEP_SUMMARY"; else cat; fi)

if [ "$INPUT_SUMMARY" = "json" ]; then
    # Add code block footer to step summary
    printf '\n```\n' >>"$GITHUB_STEP_SUMMARY"
fi

