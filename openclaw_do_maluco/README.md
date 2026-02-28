openclaw_do_maluco

Repositório de runbooks, scripts e automações para o ambiente OpenClaw do Edu (Maluco).
Objetivo: manter snapshots automáticos de sessão/config, runbooks operacionais e templates para garantir handovers limpos entre turnos.

Estrutura inicial:
- snapshots/               -> capturas geradas automaticamente (markdown)
- runbooks/                -> runbooks e procedimentos operacionais
- scripts/                 -> scripts utilitários (snapshot, health-check)
- workspace/state/         -> estado serializado (current.json, hashes)
- .github/                 -> templates (pull request)

Uso rápido
- Instalar script: cp scripts/openclaw-snapshot.sh ~/.local/bin/ && chmod +x ~/.local/bin/openclaw-snapshot.sh
- Habilitar captura automática de sessão (adicionar ao ~/.bashrc):
  trap '~/.local/bin/openclaw-snapshot.sh' EXIT

Contribuição
- Sempre atualize runbooks quando modificar infra/config.
- Use o template de PR em .github/pull_request_template.md
