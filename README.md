<!--
SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V. <https://fsfe.org>

SPDX-License-Identifier: GPL-3.0-or-later
-->

# REUSE Compliance Check

[![REUSE status](https://api.reuse.software/badge/github.com/fsfe/reuse-action)](https://api.reuse.software/info/github.com/fsfe/reuse-action)

Do you struggle with copyright and licensing in your project? REUSE helps you in three simple steps! Read more on [reuse.software](https://reuse.software) and run the short tutorial to learn how to make your copyright and licensing easy and clear.

This action allows users to check for compliance with the REUSE best practices. It is one of many options for projects to include REUSE in their workflows. Please see the [help for developers](https://reuse.software/dev/) to get an overview.

## Features

This action runs the `reuse lint` command over your repository to check the following information:

* Is copyright and licensing information available for every single file?
* Do license texts exist for all found license identifiers?
* Are there any other problems with detecting copyright and licensing information?

This action uses the [REUSE helper tool](https://github.com/fsfe/reuse-tool). For more features, please install the tool locally.

## Example usage

You can include the following lines in your workflow .yml file to run the lint subcommand:

```yml
name: REUSE Compliance Check

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps: 
    - uses: actions/checkout@master
    - name: REUSE Compliance Check
      uses: fsfe/reuse-action@master
```

If you would like to run other subcommands, you could use the following snippet which outputs a the SPDX bill of materials:

```yml
    - name: REUSE Compliance Check
      uses: fsfe/reuse-action@master
      with:
        args: spdx
```

## Inputs Description

| Name   | Requirement | Default | Description |
| ------ | ----------- | ------- | ----------- |
| `args` | _required_  | `lint`  | The subcommand for the REUSE helper tool. Read the [tool's documentation](https://reuse.readthedocs.io/) for all available subcommands. |

## License

This action itself is REUSE compliant, so copyright and licensing information is stored in every file. As of March 2020, all files are licensed under GPL-3.0-or-later.

Using the [REUSE helper tool](https://github.com/fsfe/reuse-tool), you can run `reuse spdx` to get a full bill of materials.
