# Git Worktree Helper (`gwt`)

`gwt` is a command-line utility designed to facilitate the management of Git worktrees by automating the copying of necessary files (like `.env` configurations and certificates) and executing setup scripts as defined in the project's configuration file.

## Features

- **Automatic Configuration:** Synchronizes `.env` files, certificates, and other necessary files across multiple worktrees.
- **Script Automation:** Executes predefined scripts to streamline worktree setup.
- **Customizable:** Utilizes a simple JSON configuration file to tailor the tool to specific project needs.
- **Open Source:** Available for modification and use under the MIT License.

## Installation

To install `gwt`, execute the following command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mcampbellr/worktrees-helper/HEAD/install.sh)"
```

This command fetches and runs the installation script from the repository, setting up `gwt` for global use.

## Usage

### Basic Command

After installation, you can use `gwt` by simply running:

```bash
gwt
```

### Advanced Options

`gwt` supports various options for specific tasks:

- `-f` to copy files specified in the configuration.
- `-s` to run scripts specified in the configuration.

## Configuration

To configure `gwt`, create a `.repoconfig` file in the root directory of your repository. This JSON file should specify the files to copy and scripts to run.

### Configuration File Example

```json
{
  "files": [
    {
      "source": "../common/.env",
      "destination": "./.env"
    },
    {
      "source": "../common/cert.pem",
      "destination": "./cert.pem"
    }
  ],
  "scripts": [
    "npm install",
    "npm run build"
  ]
}
```

In this example, `.env` and `cert.pem` are copied from a common directory to the worktree, and then `npm install` and `npm run build` are executed to set up the project.

## Contributing

Contributions to `gwt` are welcome! If you'd like to contribute, please fork the repository and use a pull request to add your changes. If you have any questions or suggestions, feel free to open an issue in the project's GitHub repository.

## License

`gwt` is released under the MIT License. See the LICENSE file in the repository for more details.

## Acknowledgments

- Thanks to all contributors and users of `gwt` for making this project possible.
- Inspired by the challenges of managing multiple Git worktrees efficiently.

## Contact

For questions, suggestions, or issues, please open an issue on the GitHub repository page: [https://github.com/mcampbellr/gwt/issues](https://github.com/mcampbellr/gwt/issues).

