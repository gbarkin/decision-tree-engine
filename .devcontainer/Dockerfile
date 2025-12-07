# Ruby devcontainer base image
FROM mcr.microsoft.com/devcontainers/ruby:3.3

# Install Postgres server + client + build deps + JS tooling
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get install -y --no-install-recommends \
    postgresql postgresql-contrib \
    libpq-dev \
    build-essential \
    nodejs \
    yarn \
  && rm -rf /var/lib/apt/lists/*

# Default working directory
WORKDIR /workspaces/${LOCAL_WORKSPACE_FOLDER_BASENAME}
