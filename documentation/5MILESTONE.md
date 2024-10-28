# Milestones

## Milestone 1: Configuração do Ambiente

- **Configurar Repositório**: Preparar o repositório de código.
- **Configurar CI**: Configuração de Integração Contínua (CI) para backend e frontend (PRs).

## Milestone 2: Deploy v0.1 "Hello World" (Backend & Frontend)

- **Deploy Backend**: Realizar deploy inicial do backend via CI/CD em ambiente dev na nuvem.
- **Deploy Frontend**: Realizar deploy inicial do frontend via CI/CD em ambiente dev na nuvem.
- **Configuração do Banco**: Configurar PostgreSQL para dev, integrando com o backend.
- **Ambiente de Dev**: Integrar frontend e backend no ambiente de desenvolvimento.

## Milestone 3: Deploy v0.2 "Hello World" em Produção

- **Deploy Prod**: Configurar CI/CD para backend e frontend em produção.
- **Integração Banco**: Conectar backend ao banco em produção.
- **Sincronizar Frontend-Backend**: Garantir comunicação entre frontend e backend em produção.

# Frontend

## Milestone 4: tela de Login

- **Configurar Google Auth**: Configurar oauth2.0 no GCP.
- **Testes**: Realizar testes BDD
- **Tela de Login**: Implementar tela de login com autenticação Google OAuth.
- **Deploy Dev**: Publicar tela de login

## Milestone 5: fluxo de Depósito

- **Testes**: Realizar testes BDD no fluxo de depósito.
- **Interface de Depósito**: Implementar interface para depósito com QR Pix.
- **Deploy**: Publicar tela de depósito

## Milestone 6: fluxo de Investimento

- **UI de Investimento**: Implementar tela de investimento DeFi com saldo USDC.
- **Deploy**: Publicar integração de carteira.

## Milestone 7: fluxo de Retirada

- **Tela de Retirada**: Implementar interface para retirada do DeFi.
- **Tela de Saque**: Implementar interface para saque em PIX.
- **Deploy**: Publicar fluxo de retirada/saque.

## Milestone 7: Painel de controle do cliente

- **Tela de Retirada**: Implementar interface visualizar histórico e balanço.
- **Tela de Saque**: Implementar interface para editar e dados do cliente.
- **Deploy**: Publicar painel de controle.

# Backend

## Milestone 1: Autenticação do Usuário

- **Testes**: Realizar testes BDD E2E.
- **API de Autenticação**: Integrar Google OAuth para login com JWT.
- **Sincronização**: Integrar frontend e backend em dev.

## Milestone 2: Integração Payment Gateway

- **Integração Payment Gateway**: Deposito QR Pix
- **Integração Payment Gateway**: Conversor PIX-USDC
- **Integração Payment Gateway**: Saque wallet web3
- **Integração Payment Gateway**: Saque chave PIX
- **Configuração de Webhook**: Configurar webhook para notificações.
- **Testes**: Realizar BDD E2E.

## Milestrone 3: Integração HSM

- **Integração HSM**: Criação de novas carteiras
- **Integração HSM**: Assinatura de transações
- **Testes**: Realizar BDD E2E.

## Milestrone 4: Integração Banco de dados

- **Integração Banco de dados**: Create
- **Integração Banco de dados**: Read
- **Integração Banco de dados**: Update
- **Integração Banco de dados**: Delete
- **Testes**: Realizar BDD E2E.

## Milestrone 5: Integração Indexador

- **Integração Indexador**: Histórico de investimentos
- **Integração Indexador**: Histórico de retiradas
- **Testes**: Realizar BDD E2E.

## Milestrone 6: Integração Protocolo DeFi

- **Integração Protocolo DeFi**: Investimento
- **Integração Protocolo DeFi**: Retirada
- **Testes**: Realizar BDD E2E.

## Milestone 7: Testes Finais e Otimização

- **Teste de Carga**: Avaliar escalabilidade do backend.
- **Validação de Segurança**: Validar integrações de SaaS (OAuth, HSM, blockchain).
- **Otimização de Performance**: Reduzir latência e otimizar backend e frontend.
- **Configuração de Monitoramento**: Implementar logs e monitoramento para estabilidade de produção.
