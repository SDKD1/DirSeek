# DirSeeker

## Descrição
DirSeeker é uma ferramenta desenvolvida em Bash para buscar diretórios em servidores web de forma automatizada. Ele é projetado para ajudar na identificação de diretórios potencialmente sensíveis ou vulneráveis em um site.

## Funcionalidades Principais
- Brute force de diretórios comuns em servidores web.
- Utiliza conexões TCP via `/dev/tcp` do Bash.
- Envia solicitações HTTP GET para cada diretório na lista.
- Analisa a resposta do servidor em busca do código de status "HTTP/1.1 200 OK".
- Fornece feedback visual claro ao usuário.

## Uso
./dirseeker.sh <URL>

# Exemplo:
./dirseeker.sh example.com
- Substitua `<URL>` pela URL do servidor web que você deseja verificar.

## Requisitos
- Bash (o script foi testado no Bash 4.4.19).
- Acesso à internet para realizar as solicitações HTTP.

## Aviso Legal
Este script foi desenvolvido para fins educacionais e de teste de segurança. Use-o de forma ética e responsável. Não use este script para acessar sistemas sem permissão.

## Contribuição
Contribuições são bem-vindas! Sinta-se à vontade para enviar pull requests com melhorias, correções de bugs ou novas funcionalidades.

## Licença
Este projeto é licenciado sob a [MIT License](LICENSE).
