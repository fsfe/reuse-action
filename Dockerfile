# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V. <https://fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

FROM fsfe/reuse:4

# Copy reuse wrapper used as entrypoint
COPY reuse-action-wrapper.sh /bin/reuse-action-wrapper

# Run reuse lint
ENTRYPOINT ["/bin/reuse-action-wrapper"]
CMD ["lint"]
