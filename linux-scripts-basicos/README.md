# 🐚 Exercícios de Shell Script

Coleção de exercícios práticos de Shell Script organizados por nível de dificuldade, do iniciante ao avançado.

---

## 📁 Estrutura do Repositório

```
shell-scripts/
├── README.md
├── iniciante/
│   ├── 01_ola_mundo.sh
│   ├── 02_calculadora.sh
│   ├── 03_verifica_arquivo.sh
│   └── 04_conta_arquivos.sh
├── intermediario/
│   ├── 05_backup_timestamp.sh
│   ├── 06_menu_interativo.sh
│   ├── 07_renomear_lote.sh
│   └── 08_monitor_processo.sh
└── avancado/
    ├── 09_log_rotativo.sh
    ├── 10_deploy_ssh.sh
    ├── 11_parser_csv.sh
    └── 12_health_check_urls.sh
```

---

## 🟢 Iniciante

| # | Script | Descrição | Conceitos |
|---|--------|-----------|-----------|
| 01 | `ola_mundo.sh` | Exibe saudação personalizada | `echo`, `read`, variáveis |
| 02 | `calculadora.sh` | Calculadora com 4 operações | `$1 $2`, aritmética |
| 03 | `verifica_arquivo.sh` | Verifica se é arquivo, diretório ou inexistente | `if/elif`, `-f`, `-d` |
| 04 | `conta_arquivos.sh` | Conta arquivos em um diretório | `ls`, `wc`, substituição de comando |

### Como executar

```bash
# Exemplo: script 01
bash iniciante/01_ola_mundo.sh

# Exemplo: script 02 (passa argumentos)
bash iniciante/02_calculadora.sh 10 5

# Exemplo: script 03
bash iniciante/03_verifica_arquivo.sh /etc/hosts
```

---

## 🟡 Intermediário

| # | Script | Descrição | Conceitos |
|---|--------|-----------|-----------|
| 05 | `backup_timestamp.sh` | Backup compactado com data/hora no nome | `tar`, `date`, `basename` |
| 06 | `menu_interativo.sh` | Menu com opções e loop | `while`, `case`, `break` |
| 07 | `renomear_lote.sh` | Renomeia arquivos `.txt` em lote com prefixo | `for`, `mv`, glob |
| 08 | `monitor_processo.sh` | Verifica se um processo está rodando | `pgrep`, exit code, `cron` |

### Como executar

```bash
# Backup de um diretório
bash intermediario/05_backup_timestamp.sh /meu/diretorio /destino

# Menu interativo
bash intermediario/06_menu_interativo.sh

# Renomear arquivos .txt com prefixo "novo"
bash intermediario/07_renomear_lote.sh novo /pasta/com/arquivos

# Verificar se o processo "nginx" está rodando
bash intermediario/08_monitor_processo.sh nginx
```

---

## 🔴 Avançado

| # | Script | Descrição | Conceitos |
|---|--------|-----------|-----------|
| 09 | `log_rotativo.sh` | Rotaciona log se ultrapassar limite de tamanho | `du`, `gzip`, truncate |
| 10 | `deploy_ssh.sh` | Deploy via rsync + restart remoto por SSH | `rsync`, `ssh`, `set -e` |
| 11 | `parser_csv.sh` | Lê CSV, formata colunas e soma total | `IFS`, arrays, `printf` |
| 12 | `health_check_urls.sh` | Verifica status HTTP de uma lista de URLs | `curl`, `while read`, HTTP status |

### Como executar

```bash
# Rotacionar log maior que 100KB
bash avancado/09_log_rotativo.sh /var/log/app.log 100

# Deploy (usuário, host, origem, destino)
bash avancado/10_deploy_ssh.sh user 192.168.1.10 ./dist /var/www/app

# Parsear CSV (arquivo, número da coluna para somar)
bash avancado/11_parser_csv.sh dados.csv 3

# Verificar URLs de um arquivo (uma por linha)
bash avancado/12_health_check_urls.sh urls.txt
```

---

## ⚙️ Requisitos

- **Sistema**: Linux ou macOS (ou WSL no Windows)
- **Shell**: Bash 4+
- **Ferramentas externas** usadas em alguns scripts:
  - `curl` — health check de URLs
  - `rsync` e `ssh` — deploy remoto
  - `gzip` — compactação de logs

---

## 🚀 Como usar este repositório

```bash
# Clone o repositório
git clone https://github.com/SEU_USUARIO/shell-scripts.git
cd shell-scripts

# Dê permissão de execução a todos os scripts
chmod +x **/*.sh

# Execute qualquer script
bash iniciante/01_ola_mundo.sh
```

---

## 📚 Conceitos abordados

- Variáveis e entrada do usuário (`read`, `$1`, `$2`)
- Condicionais (`if`, `elif`, `case`)
- Laços (`for`, `while`)
- Funções e modularização
- Manipulação de arquivos e diretórios
- Comandos de sistema (`date`, `whoami`, `df`, `pgrep`)
- Compactação e backup (`tar`, `gzip`)
- Rede e HTTP (`curl`, `ssh`, `rsync`)
- Boas práticas (`set -e`, exit codes, stderr)

---

## 🤝 Contribuições

Sinta-se à vontade para abrir uma *issue* ou enviar um *pull request* com novos exercícios ou melhorias!

---

## 📄 Licença

MIT — use e adapte livremente.
