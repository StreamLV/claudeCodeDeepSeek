FROM node:22-bookworm-slim

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG DOCKER_GID=999

# Змінюємо UID/GID користувача node
RUN groupmod -g ${GROUP_ID} node && \
    usermod -u ${USER_ID} -g ${GROUP_ID} node

# Встановлюємо Docker CLI офіційним способом
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && chmod a+r /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y --no-install-recommends docker-ce-cli \
    && rm -rf /var/lib/apt/lists/*

# Додаємо node в групу docker
RUN groupadd -g ${DOCKER_GID} docker && \
    usermod -aG docker node

# Встановлюємо Claude Code
RUN npm install -g @anthropic-ai/claude-code

USER node
WORKDIR /workspace
ENTRYPOINT []