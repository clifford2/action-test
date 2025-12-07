# GitHub Custom Actions

Verifying my understanding of custom GitHub Actions.

- The [.github/workflows/hello.yml](.github/workflows/hello.yml) workflow uses the custom action in [.github/actions/hello/](.github/actions/hello/).
- [.github/actions/hello/action.yml](.github/actions/hello/action.yml) runs a custom action in a Docker container
- The [.github/workflows/experiments.yml] workflow contains random tests
	- [Makefile](Makefile) is a test for installing qemu-ppc64le

## Resources


- [About custom actions](https://docs.github.com/en/actions/sharing-automations/creating-actions/about-custom-actions)
	- [Using release management for actions](https://docs.github.com/en/actions/sharing-automations/creating-actions/about-custom-actions#using-release-management-for-actions)
	- [GitHub Actions vs GitHub Apps](https://docs.github.com/en/actions/sharing-automations/creating-actions/about-custom-actions#strengths-of-github-actions-and-github-apps)
- [Creating a Docker container action](https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-docker-container-action)
	- Example code is in [actions/hello-world-docker-action](https://github.com/actions/hello-world-docker-action/), and includes instructions for how to run the container locally
- [Dockerfile support for GitHub Actions](https://docs.github.com/en/actions/sharing-automations/creating-actions/dockerfile-support-for-github-actions)
	- Docker actions must be run by the default Docker user (root).
	- It's recommended to use Docker images based on the [Debian](https://www.debian.org/) operating system.
	- GitHub sets the working directory path in the `GITHUB_WORKSPACE` environment variable (`/github/workspace`)
