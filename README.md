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

### Continue last session (recommended)
```bash
docker compose run --rm claudecode_deepseek --continue
```

### Show list of sessions and choose one
```bash
docker compose run --rm claudecode_deepseek --resume
```
### Start a new clean session
```bash
docker compose run --rm claudecode_deepseek
```
### Start specific session by ID
```bash
docker compose run --rm claudecode_deepseek --resume <session-id>
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
├── Dockerfile <br>
├── docker-compose.yml <br>
├── .env <br>
├── .claude-data/          # Claude sessions (saved here) <br>
├── .claude-config/        # Claude configuration <br>
└── README.md
```
**PROJECT_PATH** (mounted to `/workspace`)

- Session files → `.claude-data/sessions/`
- Configuration → `.claude-config/`
- Logs → `.claude-config/logs/`
