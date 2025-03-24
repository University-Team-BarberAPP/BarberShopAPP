Claro! Aqui está a versão corrigida para o contexto da **Barbershop Backend**:

---

# Barbershop Backend

Backend da aplicação **Barbershop**, um aplicativo para agendamento de serviços de barbearia.

## Requisitos

- Node.js (v14+)
- MySQL (v8+)

## Configuração

1. Instale as dependências:

   ```
   npm install
   ```

2. Configure o arquivo `.env` com suas credenciais do MySQL:

   ```
   PORT=3000
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=sua_senha
   DB_NAME=barbershop
   JWT_SECRET=sua_chave_secreta
   JWT_EXPIRES_IN=7d
   ```

3. Crie o banco de dados e as tabelas necessárias:
   - Abra o MySQL Workbench
   - Execute o script SQL localizado em `sql/schema.sql`

## Execução

Para iniciar o servidor em modo de desenvolvimento com recarga automática:

```
npm run dev
```

Para iniciar o servidor em produção:

```
npm start
```

## API Endpoints

### Autenticação

- `POST /api/auth/register` - Registrar novo usuário
- `POST /api/auth/login` - Login de usuário
- `GET /api/auth/profile` - Obter perfil do usuário (autenticação necessária)
- `PUT /api/auth/profile` - Atualizar perfil (autenticação necessária)
- `PUT /api/auth/password` - Atualizar senha (autenticação necessária)

### Agendamentos

- `POST /api/appointments` - Criar novo agendamento (autenticação necessária)
- `GET /api/appointments` - Listar agendamentos do usuário (autenticação necessária)
- `GET /api/appointments/:id` - Obter detalhes de um agendamento (autenticação necessária)
- `PUT /api/appointments/:id` - Atualizar um agendamento (autenticação necessária)
- `DELETE /api/appointments/:id` - Excluir um agendamento (autenticação necessária)

### Serviços

- `GET /api/services` - Listar todos os serviços de barbearia disponíveis (ex: corte de cabelo, barba)
- `POST /api/services` - Criar um novo serviço (autenticação necessária)
- `PUT /api/services/:id` - Atualizar um serviço (autenticação necessária)
- `DELETE /api/services/:id` - Excluir um serviço (autenticação necessária)

### Profissionais

- `GET /api/stylists` - Listar todos os profissionais da barbearia
- `GET /api/stylists/:id` - Obter detalhes de um profissional
- `POST /api/stylists` - Adicionar um novo profissional (autenticação necessária)
- `PUT /api/stylists/:id` - Atualizar informações de um profissional (autenticação necessária)
- `DELETE /api/stylists/:id` - Excluir um profissional (autenticação necessária)

---

Agora o conteúdo está focado no sistema de **Barbershop**, com agendamentos de serviços, profissionais e os endpoints apropriados. Se precisar de mais alguma alteração ou adicionar algo, me avise!
