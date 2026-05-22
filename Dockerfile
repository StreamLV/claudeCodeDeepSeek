FROM node:22-bookworm-slim

# Arguments for UID/GID
ARG USER_ID=1000
ARG GROUP_ID=1000

# Modifying existing node user
RUN groupmod -g ${GROUP_ID} node && \
    usermod -u ${USER_ID} -g ${GROUP_ID} node

# Installing Claude Code
RUN npm install -g @anthropic-ai/claude-code

USER node

WORKDIR /workspace

ENTRYPOINT ["claude"]