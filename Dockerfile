FROM node:22-bookworm-slim

# Arguments for UID/GID (so it matches the host)
ARG USER_ID=1000
ARG GROUP_ID=1000

# Create claude user
RUN groupadd -g ${GROUP_ID} claude && \
    useradd -m -u ${USER_ID} -g ${GROUP_ID} claude

# Install Claude Code
RUN npm install -g @anthropic-ai/claude-code

# Switch to non-root user
USER claude

WORKDIR /workspace

# Entry point - immediately start claude
ENTRYPOINT ["claude"]