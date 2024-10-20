# Pix Dolar

== Requirements

=== Must Have (Obrigatórios)

- O sistema deve permitir que o cliente faça cadastro utilizando apenas o email.
- O sistema deve enviar um código temporário por email para login, sem exigir senha do cliente.
- O cliente deve ser capaz de gerar um QR Code para realizar depósitos via Pix.
- O depósito deve ser automaticamente convertido para USDC e o saldo exibido em dólares na carteira.
- O cliente deve poder investir o saldo em USDC na AAVE ou Compound (apenas uma opção no MVP).
- O cliente deve ser capaz de desinvestir todo o saldo de USDC investido, retornando-o para a carteira.
- O cliente deve ter a possibilidade de sacar o saldo da carteira em reais via Pix, mostrando a conversão de dólar para real.

=== Should Have (Desejáveis)

- O sistema deve permitir que o cliente escolha a plataforma de investimento (AAVE ou Compound).
- O cliente deve ser capaz de desinvestir parcialmente (não obrigatório no MVP, mas desejável em futuras versões).
- O sistema deve fornecer uma interface para o cliente visualizar o histórico de depósitos, investimentos, saques e conversões.

=== Could Have (Opcional)

- O sistema pode oferecer notificações automáticas por email ou SMS sobre depósitos, investimentos e saques realizados.
- O sistema pode permitir a criação de múltiplas carteiras para o cliente, separando os fundos por objetivo.

=== Won't Have (Fora do escopo do MVP)

- Suporte a outras criptomoedas além de USDC.
- Integração com múltiplas plataformas DeFi além de AAVE e Compound.
- Implementação de sistema de recomendação ou otimização de investimentos.
