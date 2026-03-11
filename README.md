# NestJS + Docker: Multi-Container Environment 🚀

Este projeto implementa uma infraestrutura robusta para aplicações Node.js, utilizando o framework NestJS integrado a um banco de dados MySQL 8.0. O foco principal é a entrega de um ambiente isolado, escalável e pronto para produção através de containers.

## Tecnologias Utilizadas

- **Framework:** [NestJS](https://nestjs.com/) (Node.js + TypeScript)
- **Banco de Dados:** [MySQL 8.0](https://www.mysql.com/)
- **Containerização:** Docker e Docker Compose
- **Persistência de Dados:** Docker Volumes
- **Rede:** Docker Bridge Network (Isolada)
- **ORM:** TypeORM
- **Build Strategy:** Multi-stage Build (Alpine Linux)

## Arquitetura e Requisitos Técnicos

A infraestrutura foi desenhada para atender aos seguintes padrões de engenharia:

- **Dockerfile Multi-stage:** Separação entre build e execução para uma imagem leve.
- **Imagem Base Alpine:** Uso de `node:alpine` para segurança e performance.
- **Docker Compose:** Orquestração completa de API e Banco de Dados.
- **Persistência:** Volume configurado para não perder dados do MySQL.
- **Rede Customizada:** Comunicação isolada entre os containers.
- **Segurança de Dados:** Gerenciamento via variáveis de ambiente.
- **Usuário Não-Root:** Aplicação e Banco rodam com permissões limitadas.

## Configuração de Ambiente

O projeto utiliza variáveis de ambiente para definir as credenciais de acesso. Antes de iniciar, configure o seu arquivo local:

1. Localize o arquivo `.env.example` na raiz do projeto.
2. Crie uma cópia deste arquivo e renomeie-a para `.env`.
3. Preencha as variáveis conforme o exemplo abaixo:

```env
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=nome_do_seu_banco
DB_USERNAME=seu_usuario
DB_PASSWORD=sua_senha
DB_ROOT_PASSWORD=senha_admin_mysql
```

## Instruções de Execução

Siga os comandos abaixo para realizar o build e subir a stack completa:

1. Build e Inicialização
```
docker compose up -d --build
```

2. Monitoramento de Logs

Para validar a subida dos serviços e a conexão com o banco de dados:
```
docker compose logs -f api-rocket
```
A aplicação estará pronta quando o log exibir: ```Nest application successfully started```.

3. **Opcional**
Para rodar localmente:
```
npm run start
```
Para rodar testes:
```
npm run test
```

4. Acesso à Aplicação

A API está exposta na porta 3001 do host, mapeada da porta 3000 interna do container.
- URL: http://localhost:3001
- Saída Esperada: Hello World!

## Comandos Úteis
| Operação | Comando |
|---|---|
| Listar containers ativos | `docker compose ps` |
| Encerrar e remover volumes | `docker compose down -v` |
| Reiniciar serviço da API | `docker compose restart api-rocket` |
| Acessar terminal do DB | `docker compose exec mysql mysql -u admin -p` |
