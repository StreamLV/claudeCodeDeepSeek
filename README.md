# Claude Code + DeepSeek (Docker Setup)

This setup runs Claude Code CLI with DeepSeek models inside Docker.

## Setup

1. Copy `sample.docker-compose.yml` → `docker-compose.yml`
2. Copy `sample.env` → `.env`
3. Update the `.env` file:
   - `DEEPSEEK_API_KEY` — your DeepSeek API key
   - `COMPOSE_PROJECT_NAME` — unique name for this project
   - `PROJECT_PATH` — path to your project directory (`.` = current folder)

## Build

```bash
docker compose build
```

## Run Commands

```bash
docker compose up -d
```
```bash
docker compose exec claudecode_deepseek claude
```

### Continue last session (recommended)
```bash
docker compose exec claudecode_deepseek claude --continue
```

### rum with params
```bash
docker compose exec claudecode_deepseek claude --dangerously-skip-permissions
```

### resume last session
```bash
docker compose exec claudecode_deepseek claude --resume
```
### Start specific session by ID
```bash
docker compose exec claudecode_deepseek claude --resume <session-id>
```
### Start a new clean session (for one time run)
```bash
docker compose run --rm claudecode_deepseek
```

## Other Useful Commands

### Get USER_ID
```bash
id -u
```

### Get GROUP_ID
```bash
id -g
```

### Stop and remove containers
```bash
docker compose down
```

### Rebuild image (when you change Dockerfile or want clean build)
```bash
docker compose build --no-cache
```

### View logs
```bash
docker compose logs -f
```

### Enter running container (if needed)
```bash
docker compose exec claudecode_deepseek bash
```

## Project Structure
```
├── Dockerfile
├── docker-compose.yml
├── .env
├── .claude-data/          # Claude sessions (saved here)
├── .claude-config/        # Claude configuration
└── README.md
```
**PROJECT_PATH** (mounted to `/workspace`)

- Session files → `.claude-data/sessions/`
- Configuration → `.claude-config/`
- Logs → `.claude-config/logs/`
