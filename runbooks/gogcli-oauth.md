Runbook: gogcli OAuth & Keyring (operacional)

Objetivo
- Garantir que o gogcli esteja autenticado para operações não interativas (uploads automatizados) sem depender de prompts TTY.

Pré-requisitos
- Acesso SSH a uma sessão interativa do servidor (onde o keyring esteja desbloqueado) OU acesso a um terminal local onde o login foi feito.
- Gogcli instalado em /home/linuxbrew/.linuxbrew/bin/gog (ajuste se diferente).

Procedimentos

Opção recomendada: Exportar token interativo e reimportar sem keyring
1. Em uma sessão interativa (onde o keyring esteja acessível):
   /home/linuxbrew/.linuxbrew/bin/gog auth export --account eduardrj@gmail.com --file /tmp/gog_token.json
2. Transferir /tmp/gog_token.json para o servidor ou deixá-lo no servidor se já estiver lá.
3. Importar sem keyring:
   /home/linuxbrew/.linuxbrew/bin/gog auth import --file /tmp/gog_token.json --disable-keyring
4. Testar upload não interativo:
   printf 'ok' > /tmp/gog_upload_test.txt
   /home/linuxbrew/.linuxbrew/bin/gog drive upload /tmp/gog_upload_test.txt --account eduardrj@gmail.com --dest /test_uploads

Fallback: Usar variável GOG_KEYRING_PASSWORD
- Se preferir manter o keyring cifrado, definir a variável de ambiente GOG_KEYRING_PASSWORD no serviço/systemd unit que roda os uploads:
  export GOG_KEYRING_PASSWORD="<senha>"
- Atenção: risco de exposição; preferir arquivo com permissões restritas se necessário.

Rollback
- Se algo der errado, remova as credenciais importadas e reconfigure o gogcli:
  /home/linuxbrew/.linuxbrew/bin/gog auth remove --account eduardrj@gmail.com
  (Reautenticar interativamente conforme necessidade)

Notas
- Tokens em arquivo devem ser protegidos (chmod 600) e eventualmente rotacionados.
- Teste sempre em staging antes de aplicar em produção.
