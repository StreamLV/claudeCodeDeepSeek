# claudeCodeDeepSeek

- create docker-compose.yml (copy from sample.docker-compose.yml)
- create .env file (copy from sample.env)

- update .env file with your DeepSeek API key
- update PROJECT_PATH in .env file -> your actual project directory path

Build:
```bash
docker compose build
```

Run claude:
```bash
docker compose run --rm claudecode_deepseek
```

Stop containers:
```bash
docker compose down
```

Rebuild containers:
```bash
docker compose build --no-cache
```