FROM korosuke613/ubuntu-texlive-ja-devcontainer:latest

RUN apt-get update && apt-get install -y \
    latexdiff \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*