# Guia de Deploy — Servidor (adminfo1.dev.br/restaurante)

Guia passo a passo para colocar o site no ar. Continue exatamente daqui.

## O que já está pronto

- **Dump do banco**: `backup/restaurante_db_locaweb.sql` (já commitado no git, na raiz do projeto).
- **Regra de acesso** (`src/.htaccess`): já criado, protege `.env` e o código do Laravel de acesso público, redirecionando tudo internamente para a pasta `public/`.
- **Usuário admin já cadastrado no dump**: `admin@davilla.com.br` / senha temporária `Davilla@2026` (troque assim que conseguir logar).

## Onde as coisas vão no servidor

Servidor: `ftp.adminfo1.dev.br`, pasta `/public_html/restaurante/` (você já estava conectado nela pelo FileZilla).

```
public_html/restaurante/          <- pasta raiz do projeto (não é acessível direto pela web)
├── app/
├── bootstrap/
├── config/
├── database/
├── resources/
├── routes/
├── storage/
├── vendor/
├── artisan
├── composer.json
├── composer.lock
├── .htaccess        <- protege tudo isso daqui
└── public/           <- SÓ essa pasta fica exposta na web
```

## Passo 1 — Enviar os arquivos pelo FileZilla

No FileZilla, lado **esquerdo** (seu computador): abra a pasta `src` do projeto
(`\\wsl.localhost\Ubuntu\home\andremarcelino\dev\senac\restaurante-davilla\src`).

Lado **direito** (servidor): dentro de `/public_html/restaurante/`.

Selecione e envie do lado esquerdo para o direito:

- `app`
- `bootstrap`
- `config`
- `database`
- `public`
- `resources`
- `routes`
- `storage`
- `vendor`
- `artisan`
- `composer.json`
- `composer.lock`
- `.htaccess` (arquivo oculto — se não aparecer, ative "Ver > Mostrar arquivos ocultos" no FileZilla)

**Não envie o arquivo `.env`** (esse é o de configuração local do seu computador, com senha do banco Docker — não serve pro servidor).

Isso demora um tempo (o `vendor` e as imagens de `public/restaurante` têm bastante arquivo). Pode deixar rodando em segundo plano enquanto faz outra coisa.

## Passo 2 — Criar o `.env` de produção no servidor

No servidor você precisa de um arquivo `.env` (não `.env.production`, o nome tem que ser exatamente `.env`) dentro de `/public_html/restaurante/`, com este conteúdo:

```env
APP_NAME="Restaurante Davilla"
APP_ENV=production
APP_KEY=base64:a4z1ZUFMh8EQ4QITMQ0GzX6+OUkFOQgD7GPrBLAlzU8=
APP_DEBUG=false
APP_URL=http://adminfo1.dev.br/restaurante

APP_LOCALE=en
APP_FALLBACK_LOCALE=en
APP_FAKER_LOCALE=en_US

APP_MAINTENANCE_DRIVER=file

BCRYPT_ROUNDS=12

LOG_CHANNEL=stack
LOG_STACK=single
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=error

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=PREENCHER_NOME_DO_BANCO_LOCAWEB
DB_USERNAME=PREENCHER_USUARIO_LOCAWEB
DB_PASSWORD=PREENCHER_SENHA_LOCAWEB

SESSION_DRIVER=database
SESSION_LIFETIME=120
SESSION_ENCRYPT=false
SESSION_SECURE_COOKIE=false
SESSION_PATH=/
SESSION_DOMAIN=null

BROADCAST_CONNECTION=log
FILESYSTEM_DISK=local
QUEUE_CONNECTION=database

CACHE_STORE=database

MEMCACHED_HOST=127.0.0.1

REDIS_CLIENT=phpredis
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=log
MAIL_SCHEME=null
MAIL_HOST=127.0.0.1
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

VITE_APP_NAME="${APP_NAME}"
```

**Como fazer isso pelo FileZilla:** o arquivo `src/.env.production` no seu computador já tem exatamente esse conteúdo. Envie ele pro servidor e depois **renomeie** (botão direito no arquivo, do lado do servidor) de `.env.production` para `.env`.

Ainda faltam 3 valores nesse arquivo (linhas `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`) — vêm do passo 3.

⚠️ Se descobrir que esse endereço tem certificado HTTPS ativo, troque `APP_URL` para `https://...` e `SESSION_SECURE_COOKIE` para `true` — deixei em HTTP por segurança porque não sabíamos se o SSL estava ativo.

## Passo 3 — Banco de dados

Você precisa descobrir/ter em mãos:
- Um acesso a **phpMyAdmin** (ou outra ferramenta de administração de banco) desse servidor — pergunte pro responsável pela hospedagem/Senac se não souber onde fica.
- Criar (ou já ter) um banco MySQL, com usuário e senha.

Depois:
1. No phpMyAdmin, selecione o banco e vá em **Importar**.
2. Envie o arquivo `backup/restaurante_db_locaweb.sql` (está na raiz do projeto, no git).
3. Volte no `.env` do servidor (passo 2) e preencha `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD` com os dados reais desse banco.

Não é preciso rodar migration nenhuma — o dump já cria todas as tabelas e já inclui o usuário admin.

## Passo 4 — Testar

Acesse `http://adminfo1.dev.br/restaurante/` no navegador.

- Se aparecer o site: ótimo, funcionando.
- Se der erro 500: normalmente é permissão de pasta. As pastas `storage/` e `bootstrap/cache/` precisam ser graváveis (no FileZilla, botão direito > Permissões de arquivo > `755`, se não funcionar tente `775`).
- Se aparecer uma tela de erro do Laravel com detalhes técnicos: confirme que `APP_DEBUG=false` está mesmo no `.env` do servidor (não deveria aparecer detalhe nenhum, só uma mensagem genérica).

Depois teste o admin em `http://adminfo1.dev.br/restaurante/admin/login`, logue com `admin@davilla.com.br` / `Davilla@2026`, e troque a senha (hoje ainda não existe uma tela pra isso no painel — se precisar, é só pedir que eu adiciono).

## Se travar em algum ponto

Volte nessa conversa (ou abra uma nova aqui no Claude Code, na pasta do projeto) e me diga em qual passo parou e o que aconteceu (mensagem de erro, print de tela) que eu continuo com você.
