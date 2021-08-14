FROM mcr.microsoft.com/vscode/devcontainers/universal:1-linux

# ** [Optional] Uncomment this section to install additional packages. **
USER root
#
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
#

RUN curl -fsSL https://crystal-lang.org/install.sh | sudo bash
RUN apt update
RUN apt install crystal
RUN apt install libz-dev 

USER codespace