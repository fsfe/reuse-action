# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V. <https://fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

FROM fsfe/reuse:latest

# Go to automatically mounted workspace
WORKDIR /github/workspace

# Run reuse lint
ENTRYPOINT ["reuse"]
